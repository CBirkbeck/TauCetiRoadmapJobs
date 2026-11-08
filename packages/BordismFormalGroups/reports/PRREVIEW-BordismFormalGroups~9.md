# Review of BordismFormalGroups (pull request #1807 at 72ca89d)

**Verdict:** needs changes

Incremental re-review of 78 changed lines since 113b939: the diff touches the F1 n-series paragraph, the F1 height sentence, the F2 Kudo–Borel instance and Bousfield locator, the Unoriented-coefficients Miller locator, the F6.2 Serre clause, one reference entry, and the module docstring of `Suggested.lean` (no Lean statement changed). All three findings of the previous review are repaired. The gate passes, the dependency check prints no UPWARD or CYCLE line, and `Suggested.lean` elaborates with only its two `sorry` warnings. One P3 remains: the repair's own rule ("the pinned Tau Ceti has no n-series module") is not applied to the sibling module three sentences later.

## R01 (P3) — F1 still consumes the formal-group logarithm from a Tau Ceti module absent at the pin

Location: `TauCetiRoadmap/BordismFormalGroups/README.md` lines 101–106 ("Use `FormalGroup.invariantDifferential` and, over a ℚ-algebra, `FormalGroup.log` and `FormalGroup.exp` from native `TauCeti.RingTheory.FormalGroup.Logarithm` … Consume `constantCoeff_log`, `coeff_one_log`, `derivative_log`, …").

Claim: these declarations are native, that is, exist in the pinned Tau Ceti.

Witness: the pinned Tau Ceti (358314d, `lake-manifest.json`) has no directory `TauCeti/RingTheory/FormalGroup/` at all (`git ls-tree 358314d4a TauCeti/RingTheory/FormalGroup/` is empty); a recursive grep of the pin for `FormalGroup.log`, `invariantDifferential`, `FormalGroupHom` and `FormalGroupIso` returns nothing. The linked commit 1844920e is a descendant of the pin, and the module was added there by Tau Ceti #13268, after the pin, in the same later directory as the `NSMul` module that this revision stopped consuming for exactly this reason (line 59, "The pinned Tau Ceti has no n-series module, so own the n-series API"). The two paragraphs now apply opposite rules to two modules of the same later commit.

Repair: treat the logarithm as the n-series is now treated. Replace lines 101–106 by targets this roadmap owns, shaped as the later module names them so the eventual swap is a deletion: the invariant differential of a commutative `F`; over a ℚ-algebra the logarithm with constant coefficient zero and linear coefficient one, its derivative the invariant differential, `log(F(X,Y)) = log X + log Y`, every additive series along `F` a scalar multiple of it, and the exponential as its substitution inverse. Keep the rest of the paragraph (base change, coordinate change, the bundled strict isomorphism to the additive group) as it stands. Tested on the instance that refutes the original: the pin's only formal-group file is Mathlib's `Mathlib/RingTheory/FormalGroup/Basic.lean`, whose declarations are the structure, `IsComm`, `Point`, `𝔾ₐ`, `𝔾ₘ`, `map`, `Xzero`/`zeroX` and the `AddMonoid` instance (lines 56–339); none is a logarithm.

## Previous findings

- R01 — repaired: lines 833–838 now read "Consume AlgebraicTopology Stage 5.5's Serre-fibration predicate (the homotopy lifting property for all cubes) and the locally trivial bundle instances of it; that stage owns their homotopy long exact sequence and the ordinary Serre spectral sequences over CW and arbitrary bases". No backticked pin name, DGFloer no longer named; grep of the README for `serreFibrations` and `DGFloer` is empty.
- R02 — repaired: line 344–345 "Miller, Chapter 1, Theorem 12.1 and Corollary 12.2"; lines 227–241 state the Guillou–Weibel instance (point site, connected simplicial group of finite type, n = 1 excluded); lines 265–268 add "Bousfield, §6, Theorem 6.6" and line 2201 lists it under the references.
- R03 — repaired: `Suggested.lean` lines 17–34 now name Lubin–Tate, Conner–Floyd and graded Eilenberg–MacLane, Hopkins–Smith thick-subcategory and periodicity, Hopkins–Ravenel smashing, the fracture square, the K(n)-local completion formula and the F6.6 torus Euler cancellation, each with its missing carrier.

## Verified sound

**The change.** `git diff --stat origin/main...HEAD` restricted to paths outside the fourteen declared folders prints nothing. The two files changed outside this folder since 113b939 are `TauCetiRoadmap/RigidAnalyticGeometry/{README.md,Suggested.lean}`, a folder the pull request declares as its own with a review of its own; this README does not cite RigidAnalyticGeometry.

**Gate and dependency check.** The worker's gate at this head passes every rule (`gate.md`: all counters 0, `OK`). I re-ran the dependency check; its whole output is

```
depcheck: 241 roadmaps, 2319 edges, 0 problem(s)
```

**Elaboration.** `lake env lean` on `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` at this head: exit 0, two warnings `declaration uses 'sorry'` (lines 68 and 98), nothing else. The diff changes only the module docstring, so the six elaborated signatures in the worker's file are those of the previous review; I compared them again with the README: the exponent-two theorem carries `[F.IsComm]` and `formalNSeries F 2 = 0` (README lines 115–121, where `2 = 0` in `R` follows from the linear coefficient 2 of `[2]_F`), and the height theorem carries `[Field k] [IsSepClosed k] [Fact p.Prime] [CharP k p] [F.IsComm] [G.IsComm]` (README lines 156–163). The one-tactic probes of the previous full review stand on an identical Lean body and were not repeated.

**The n-series repair against the pins.** Mathlib f6090c7 `Mathlib/RingTheory/FormalGroup/Basic.lean`: `structure FormalGroup` (line 56), `class FormalGroup.IsComm` (74), `def Point` (126), `instance : AddMonoid (F.Point σ)` with `nsmul := nsmulRec` (333–337), `AddCommMonoid` under `IsComm` (339); no n-series on `PowerSeries`, no height, no isomorphism predicate. Tau Ceti 358314d: no `nsmulSeries` anywhere, no `TauCeti/RingTheory/FormalGroup/` directory. So "the pinned Tau Ceti has no n-series module" is correct and the ownership here is right; the same module exists in Tau Ceti beyond the pin (commit 1844920e, `NSMul.lean`, `CharP.lean`), so an implementer will find the shapes there. `roadmaps grep` for `nsmulSeries|formalNSeries|formalHeight|IsFormalGroupIso` over main and the 457 open heads returns only this folder; EllipticCurves on main (lines 474, 572, 734) uses `[p]` of an elliptic curve and cites no n-series owner, consistent with line 167 here.

**Seeded sample, re-read at this head.** Steenrod algebras and mod-p Adams towers (README lines 193–275): hatcher-at line 21777 (Theorem 4L.12, the `Sq^i` axioms), line 21864 (Theorem 4L.13, Adem relations), line 22197 (Theorem 4L.16, the `P^i` axioms and Adem relations), lines 21565–21571 (the unnumbered theorem on printed page 500, proof deferred to [SSAT] at line 21561); guillou-weibel lines 748–751 (Definition 6.1), 752–759 (Theorem 6.2: `H^0 = 𝔽_ℓ`, first-quadrant, conditions (i) `E₂ ≅ W ⊗ V` and (ii) a transgressive ℓ-simple system), 761–764 (the Leray sequence of `E•G → B•G`), 767–771 (Proposition 6.4, the Künneth condition for all `U`), 784–788 (Kudo's Theorem 6.5 with `β(x) ↦ −β(y)`, `P^a` commuting, `x^{ℓ−1} ⊗ y ↦ −Q^a(y)`, `Q^a = βP^a` at line 112); ravenel-green lines 2627–2635 (Theorem 2.1.1, part (ii) finite type). Unoriented coefficients (README lines 336–355): miller-cobordism line 1226 (Theorem 12.1, free through degree n on the Thom class of `MO(n)`, via the zero section and `(RP^∞)^n`), line 1238 (Corollary 12.2, free on the Thom class of `MO`), line 1239 (Theorem 12.3, `H^*MO` free over `A`), lines 1369–1373 (`N_* = 𝔽₂[x_n : n ≠ 2^i − 1]`). The smoothing-and-triangulation comparison (README lines 1945–1962 consume it through F6.6's finite cell models; the section is on main): `TauCetiRoadmap/GeometricTopology/README.md` on main line 930 (the heading) and lines 938–942 (item 1, smooth implies PL, Whitehead 1940 and Munkres 1966), applied here only to compact closed manifolds.

**Cross-roadmap citations resolved at this head.** AlgebraicTopology Stage 5.5 at this head: `TauCetiRoadmap/AlgebraicTopology/README.md` lines 102–108 (ownership summary), 1018–1024 (the Serre predicate with its disc/cube characterisation and the locally trivial bundle instances), 1022 (the homotopy long exact sequence), 1062 and 1073 (homological and cohomological Serre sequences over CW bases), 1131–1139 (arbitrary bases). AlgebraicTopology is on main and earlier in the order, so the direction is right. That README describes the predicate as native `TauCeti.TopCat.serreFibrations`, which the pin lacks; that is AlgebraicTopology's text, reviewed in its own folder, and this README now names the predicate only by its owner and its characterisation. GeometricTopology's smoothing section on main (line 930). The remaining citations (GeneralizedCohomology G2–G5, CharacteristicClasses C3, AlgebraicTopology Stages 8.8–8.10) are untouched by the diff and were resolved by the previous reviews.

**Ravenel, Lemma A2.2.7 as applied.** ravenel-green lines 20711–20716: `F` over a commutative `𝔽_p`-algebra `R`, `f` a nontrivial endomorphism, then `f(x) = g(x^{p^n})` with `g'(0) ≠ 0`; over a perfect field the `h(x)^{p^n}` form. Ravenel's formal group laws are commutative, matching the README's "for a commutative F". The proof (lines 20721–20730) differentiates `f_i(F^{(i)}(x,y)) = F(f_i(x), f_i(y))` at `y = 0` and uses only that `∂_y F^{(i)}(x,0)` has constant term 1, so it holds over every commutative `𝔽_p`-algebra, not only domains; `g'(0)` is nonzero, not necessarily a unit, as the README says. Theorem A2.2.12 at line 20790 (separably closed, height `n` gives `F_n`) is the height-classification locator already in the file.

**Backticked names.** The gate's `readme-ids-missing` rule passes; the README's own names (`formalNSeries`, `formalVariable`, `exists_unique_normalized_exponentTwo_logarithm`, `IsFormalGroupIso`, `formalHeight`, `exists_formalGroupIso_iff_formalHeight_eq`) are the six declarations of `Suggested.lean`. The docstring's "not statable" list was checked against the README: Lubin–Tate (line 725), Conner–Floyd (363–426), thick subcategories (1309), smashing (1479), fracture and the K(n)-local formula (F6.4 from 1451), the F6.6 torus Euler cancellation (line 9); none of their carriers exists at either pin.

**Ownership against open work.** Checked only against the sibling checkouts the brief lists and the `roadmaps grep` index: no other `Suggested.lean` declares the six names above; TangentialBordism and HomotopySpheres remain later in the order, as in the previous review.

**Adversarial table.** Rows for statements the diff leaves untouched carry forward the previous report's computed values; rows for the changed statements are new.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| n-series API: constant and linear coefficients (README 59–61) | n = 0; induction step; 𝔾ₐ; 𝔾ₘ | [0] = 0 (linear 0); lin([n+1]) = lin([n]) + 1 since F = X + Y + (deg ≥ 2) and [n] has zero constant term; 𝔾ₐ: [n] = nX; 𝔾ₘ: [2] = 2X + X² | true for every formal group | none |
| Addition law [m+n] = F([m],[n]) (README 61–63) | m = n = 1 on 𝔾ₘ; n = 0; noncommutative F | F(X,X) = 2X + X² = [2]; F([m],0) = [m] by `add_zero`; the law is `add_nsmul` in the `AddMonoid` on `Point`, no commutativity used | true | none |
| Composition law [mn] = [m]∘[n] (README 62–64) | m = n = 2 on 𝔾ₘ; m = 0; n = 0 | [2]∘[2] = 2(2X+X²) + (2X+X²)² = 4X + 6X² + 4X³ + X⁴ = (1+X)⁴ − 1 = [4]; [0]∘[n] = 0; [m](0) = 0 = [0] | true (`mul_nsmul` read through evaluation at a point, a monoid map) | none |
| Prime-series decomposition over an 𝔽_p-algebra (README 64–68) | 𝔾ₘ/𝔽_p; 𝔾ₐ/𝔽_p; F = X+Y+εXY over 𝔽₂[ε]/ε²; h ≥ 1 | 𝔾ₘ: [p] = (1+X)^p − 1 = X^p, g = X, h = 1; 𝔾ₐ: [p] = pX = 0 (the "or" branch); 𝔽₂[ε]: [2] = εX², g(Y) = εY, g'(0) = ε ≠ 0 but not a unit, h = 1; n = 0 in A2.2.7 would give g'(0) = p·1 = 0, so h ≥ 1 | true as stated, with g'(0) nonzero rather than a unit, as in the source | none |
| Mod-p divisibility over every ring (README 68–70) | 𝔾ₘ/ℤ; p invertible in R | 𝔾ₘ: coefficient of X^k is C(p,k), divisible by p for 0 < k < p; k = p has coefficient 1 and p ∣ k, so no claim; p invertible: R/pR = 0, claim holds trivially | true | none |
| Kudo–Borel instance (README 227–241) | n = 1; n = 2; the sign | n = 1: G = ℤ/p discrete, not connected, excluded by the README; n = 2: G = K(ℤ/p,1) a connected simplicial abelian group, H*(Bℤ/p;𝔽_p) of finite type so Künneth holds for every U over a field; τβ = −βτ matches guillou-weibel line 786 | consistent; Theorem 6.2's conditions (i)–(ii) are the Borel hypotheses stated at README 220–225 | none |
| Nilpotent completion = derived p-completion (README 265–268) | finite-type X; Moore spectrum of ℤ/2^∞ | Ext(ℤ/p^∞, ℤ) = ℤ_p, Hom(ℤ/p^∞, ℤ) = 0, so π_*⊗ℤ_p as Ravenel 2.1.1(ii); M(ℤ/2^∞): classical lim(ℤ/2^∞ ⊗ ℤ/2^k) = 0, derived π₁ ⊇ Hom(ℤ/2^∞, ℤ/2^∞) = ℤ₂ | consistent with the Check at README 273–275; the Bousfield locator itself is uncertified | none |
| Miller locator (README 343–345) | Theorem 12.1; Corollary 12.2 | line 1226: MO(n), through degree n; line 1238: MO, the Thom class in H⁰ | locators correct | none |
| Serre clause (README 833–838) | AT 5.5 predicate, bundles, LES, SS over CW and arbitrary bases | AT lines 1018–1024, 1022, 1062, 1073, 1131 | each claimed object is owned where cited | none |
| `formalNSeries` recursion (Lean 47–49) | n = 0, 1; 𝔾ₐ; 𝔾ₘ at n = 2 | [0] = 0; [1] = F(0,X) = X; 𝔾ₐ: [n] = nX; 𝔾ₘ: [2] = 2X + X² | agrees with [n]_F (previous report) | none |
| Exponent-two logarithm (Lean 68–77, README 115–145) | R = 𝔽₂ with F = 𝔾ₐ, 𝔾ₘ; R = ℤ; the zero ring | 𝔾ₐ: [2] = 0, g = X satisfies all four conditions, X + X² fails coeff(2) = 0; 𝔾ₘ: [2] = X² ≠ 0, hypothesis fails; ℤ: coeff₁([2]) = 2 ≠ 0; zero ring: g = 0 unique | true as stated (previous report) | none |
| `formalHeight` (Lean 92–93, README 149–152) | 𝔾ₘ, 𝔾ₐ over 𝔽_p; 𝔾ₐ over ℤ at p = 2 | 𝔾ₘ: [p] = X^p, height 1; 𝔾ₐ over 𝔽_p: [p] = 0, iInf over ∅ = ⊤; 𝔾ₐ over ℤ: coeff(X) = 2 ≠ 0, height 0 | matches the usual height over `CharP k p` (previous report) | none |
| Height classification (Lean 98–101, README 158–166) | 𝔾ₘ, 𝔾ₐ over 𝔽̄_p; F = G; twists of 𝔾ₘ over 𝔽_p | heights 1 and ∞, no isomorphism; F = G: φ = X; over 𝔽_p two twists of height 1 are non-isomorphic, so `IsSepClosed` is needed | true as stated (previous report) | none |
| `IsFormalGroupIso` direction (Lean 82–86) | φ = X; φ = 0; φ = uX + X² over 𝔽₂ | φ = 0 excluded by the unit clause; φ(F(X,Y)) = G(φX,φY) pins F → G | correct (previous report) | none |
| Steenrod Checks (README 269–275) | a ∈ H¹(RP^∞); degrees at p = 2, 3; d₂ on (1,2); Moore spectrum of ℤ/2^∞ | Sq¹a = a², Sq²a = 0; |ξ₂| = |Q₁| = 3 at 2; |ξ₁| = 4, |τ₀| = 1, |τ₁| = 5, |Q₁| = 5 at 3; (1,2) ↦ (3,3); L₁(ℤ/2^∞) = ℤ₂ | all correct (previous report) | none |
| Milnor primitive degrees (README 248–251) | i = 0, 1 at p = 2, 3 | |Q₀| = 1; |Q₁| = 2p − 1 = 3, 5 | agree (previous report) | none |
| Dual Steenrod coproduct (README 244) | n = 1, 2 | Δξ₂ = ξ₂⊗1 + ξ₁^p⊗ξ₁ + 1⊗ξ₂, matching miller-cobordism line 1220 | same sum reindexed (previous report) | none |
| MU Adams E₂ (README 289–298) | a_i bidegrees | a_i ∈ Ext^(1,2p^i−1), t − s even, E₂ even, collapse | consistent (previous report) | none |
| MU Hurewicz Checks (README 312–317) | i = 1,…,6 | 2b₁, 3b₂, 2b₃, 5b₄, b₅, 7b₆; π₂ = ℤx₁, π₄ = ℤx₁² ⊕ ℤx₂ | correct (previous report) | none |
| MO Checks (README 365–370) | degrees 1–5 | π₁ = π₃ = 0, π₂ = 𝔽₂x₂, π₄ rank 2; degree 5: 7 = 1·1+1·2+1·0+2·1+2·0+2·1 | correct (previous report; Miller line 1373 agrees) | none |
| π₀MO = 𝔽₂ and the MO route (README 351–355) | H̃_n(MO(n);ℤ) | twisted Thom isomorphism gives ℤ/2, 2·id_MO = 0, cofiber of bounded exponent | closes without geometric input (previous report) | none |
| Toda bracket conventions (README 493–512) | ⟨2,η,2⟩; the swap | ⟨2,η,2⟩ = η² ≠ 0, indeterminacy 0; swap degree −1 | consistent (previous report) | none |
| James construction (README 844–864) | Y = S²; Y = S⁰ | H₂(J₂(S²)) = ℤ; J(S⁰) = ℕ ≠ ΩS¹ ≃ ℤ | path-connectedness stated (previous report) | none |
| Serre–Cartan basis (README 206–211) | n = 1, 2 at p = 2 and odd p | Hatcher page 500 cases | agrees (previous report) | none |
| K(n)-local Tate and Sylow unit (README 1832–1842) | n ≥ 1; G = S₃ at p = 2, 3 | [p](x) = v_n x^(p^n), K(n)^(tC_p) = 0; tr∘res = 3, 2 units | holds (previous report) | none |
| Smooth implies PL as used (README 1945–1962) | compact closed; noncompact | compact: finite triangulation; noncompact excluded | hypotheses present (previous report) | none |

## Not verifiable

- Bousfield, *The localization of spectra with respect to homology* (1979), §6, Theorem 6.6: `bousfield-1979` is settled as uncertified; the locator is the one the previous review asked for and is cited by theorem number. The mathematics it supports was checked by the finite-type and Moore-spectrum instances in the table.
- Thom, *Quelques propriétés globales des variétés différentiables* (1954): `thom-1954` is settled as uncertified; checked instead against miller-cobordism lines 1369–1373.
- James (1955), Toda (1962), Whitehead (1940), Munkres (1966): no open copy, as in the previous review; untouched by the diff.
- Tau Ceti commit 1844920e's `Logarithm.lean` and `NSMul.lean` were located by `git ls-tree` in the package checkout, not read: the finding needs only that they are absent at the pin.

## Source issues

- none

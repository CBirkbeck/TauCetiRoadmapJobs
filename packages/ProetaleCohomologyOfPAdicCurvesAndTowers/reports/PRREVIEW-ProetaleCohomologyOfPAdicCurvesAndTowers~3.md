# Review of ProetaleCohomologyOfPAdicCurvesAndTowers (pull request #2287 at adac797)

**Verdict:** needs changes

## Previous findings

- none: the previous review (at `77d5795`) raised no finding; its one deferred item is accounted for under *Deferred findings*.

## R01 (P3) — a supplier declaration name that exists nowhere

**Location:** `TauCetiRoadmap/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md` line 117, "§AI.6.2 (`Semistable.aOmega`, local edge comparison)", and line 835, "for `𝔛` semistable it is `Semistable.aOmega` of §AI.6.2".

**Claim:** AInfCohomology §AI.6.2 supplies a declaration named `Semistable.aOmega`.

**Witness:** `roadmaps grep aOmega` over main and every open head returns these two lines only. AInfCohomology §AI.6.2 names its targets **Semistable AΩ complex** and **Integral structure-sheaf edge comparison**; its `Suggested.lean` has no such declaration.

**Repair:** line 117: "§AI.6.2 (*Semistable AΩ complex*, with the *Integral structure-sheaf edge comparison*)"; line 835: "for `𝔛` semistable it is the *Semistable AΩ complex* of §AI.6.2, the case used in §6.8". Both names resolve in AInfCohomology §AI.6.2.

## R02 (P3) — the description counts one stated headline; the head states four theorems

**Location:** pull request description, "`Suggested.lean` states the one headline statable at the pins, the irreducibility of the generalized Steinberg representations `Sp_J(A)` of `GL_{d+1}(K)` over coefficient fields of characteristic `0` or `p`".

**Claim:** `Suggested.lean` states irreducibility only.

**Witness:** `Suggested.lean` at the head: `generalizedSteinberg_isIrreducible` (line 131), `nonempty_equiv_generalizedSteinberg_iff` (145), `exists_compositionSeries_generalizedSteinberg_multiplicity_eq_one` (159), `nonempty_equiv_hyperplaneCocycles` (272); its docstring lists two stated headlines.

**Repair:** "`Suggested.lean` states the two headlines statable at the pins: for `K/ℚ_p` finite and a coefficient field of characteristic `0` or `p`, the generalized Steinberg representations `Sp_J(A)` of `GL_{d+1}(K)` are irreducible, pairwise non-isomorphic and occur once each in a composition series of length `2^d` of `LC(G/B, A)` (multiplicity through `TauCeti.compositionMultiplicity`); and the Schneider–Stuhler and Iovita–Spiess presentation of `Sp_r(ℤ)`, `0 ≤ r ≤ d`, by locally constant cocycles on tuples of `K`-rational hyperplanes. The representations are formed on `TauCeti.TitsSystem.standardParabolic` of `TauCeti.glTitsSystem`; the docstring lists the other headlines and the carriers they lack."

## Deferred findings

- D01 — resolved: the board's `design/plan.json` top-level `gaps` list now has `completed-semistable-ring-general-K`, the same slug as README line 143.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §0.1 graph cohomology | annulus graph; subdivided loop; `L = 𝔽₂²`; line `ℤ` → loop | `(H⁰_c,H⁰,legs,H¹_c,H¹)` ranks `0,1,2,1,0`, alternating sum `0`; `L²/L(1,1) ≅ L`; orders `4` vs `16`; `H¹(ℤ)=0` | holds; matches CDN-CURVES lines 723–782 | none |
| §0.2 `N_µ` | loop cut into lengths `a`, `b`; segment with four legs | `N(x,x) = (ax,bx) ↦ (a+b)x`; `ker ∂^*` rank `5−2 = 3`, `H¹ = 0` | holds | none |
| §0.3 `Sp_J`, indexing | `d = 0`; `d = 1`; `d = 2`, `J = {s₁}` (Tau Ceti index `0`) | `A` trivial; `A` and `LC(ℙ¹)/A`, congruence invariants rank `(q+1)−1 = q`; `P_J` blocks `(2,1)` fixes `Ke₀+Ke₁`, `X_J` = planes | holds; CDN-STEIN lines 1901–1917 | none |
| §0.4(a) irreducibility (Lean) | `d = 0`; `d = 1`, `J` full; one-tactic probes | `Sp_∅ = A`, a field: simple; `P_J = G`, `Sp_J = A`; `simp`, `rfl`, `infer_instance`, `exact?`, `aesop`, `decide` all fail | holds; GK14 Corollary 4.3, type `A_d` not exceptional | none |
| §0.4(a) non-isomorphism (Lean) | `d = 0`; `d = 1`; `d = 2`, `{s₁}` vs `{s₂}` | one label; `dim A = 1` vs infinite; `LC(planes)/A` vs `LC(lines)/A`, exchanged by `g ↦ ᵗg⁻¹` only | holds; GK14 Corollary 4.4(a) | none |
| §0.4(a) multiplicity (Lean) | `d = 0`; `d = 1`; count of labels | length `1 = 2⁰`; `0 ⊂ A ⊂ LC(ℙ¹)`, length `2`; `d` simple reflections give `2^d` sets `J` | holds; GK14 Corollary 4.4(b), CDN-STEIN Proposition 5.1 | none |
| §0.5 presentation (Lean) | `r = 0`; `d = r = 1`; `d = 2, r = 1`; `r > d` | constants `ℤ`, `J` full; `f = φ(H₁) − φ(H₀)`; `J = {index 0}`, both sides `LC(𝓗)/ℤ`, action `f([a g])` on both; excluded by `r ≤ d` | holds; CDN-STEIN lines 2046–2054 | none |
| §1.4 normalizations | `e = 2`, `N_raw e₁ = 2e₀`; `ϖ = 12`, `p = 3` | `D_p(e₁+ue₀) = 0`, `D_raw(e₁+2ue₀) = 0`, `D_p(e₁+4ue₀) = −3e₀`; `a = 4`, `v₃(log 4) = 1` | holds; agrees with CohomologyComparisons §4.5 sign | none |
| §2.2 pattern | closed disc, two Gauss points; closed annulus | disc: `H¹(Γ) = 0`, `H¹_c(Γ)^* = 0`; annulus: `ker(L³ → L²)` rank `1` | holds; CDN-CURVES lines 264–298, 1688–1699 | none |
| §3.2 Hyodo–Kato | closed disc; closed annulus; `Nφ = pφN` | pieces `(0,0,0)`; `(0,0,1)` with `φ = p`; index set `Σ(Y)∖∂Y` ⊕ `∂Y^{[1]}` as source line 3578–3582 | holds; Théorème 6.21, Remarque 6.22 | none |
| §3.3 cone signs | closed disc, `f = 1 + pT`, `φ(T) = T^p` | `dy = pT^{p−1}dT/(1+pT^p) − p·dT/(1+pT) = (φ/p)x − x`, so `−(1−φ/p)x − dy = 0` | holds | none |
| §4.4 Weil–Deligne group | `Φ = diag(q⁻¹, 1)`, `Ne₁ = µe₀`; source's exponent `+deg` | `NΦe₁ = µe₀ = qΦNe₁`; `+deg` law gives `Ng = p^{−deg g}gN`, against source line 4437 | holds with `p^{−deg g₁}`; `W_Y = W_K × Aut_C(Y)^{G_K}` at line 4426 | none |
| §4.7 proper curves | `g = 0`; ordinary and supersingular `g = 1` | all terms `0`; `(1,1)+(0,1) = (1,2)`; `2·(1/2,1) = (1,2)`; row `(0,2g) + (g,0) = (g,2g)` | holds; Théorème 0.4, Remarque 6.33(i) | none |
| §5.3 Fontaine–Messing | `p = 2, r = 2`; `r = 0` | `a = 2`, `p^a a! = 8`; fibre `[RΓ_cr^{φ=1} → 0]`, `H⁰ = ℤ_p^{π₀}` | holds; CDN-STEIN Corollary 3.46, Proposition 6.1, line 2201 | none |
| §5.4 Bloch–Kato | `𝔛 = Spf O_K`, `r = 1`; element `u`; `r = 0` | `ker θ` on `(B_cris^+)^{φ=p}` is `ℚ_p t`, cokernel `0`; `φ(u) = pu`, `N(u) = −1 ≠ 0`; `/F⁰ = 0` | holds; CDN-STEIN lines 925–964, 1440–1454, 1525–1527 | none |
| §5.5 diagram | `r = 0`; affine line `r = 1` | `ℚ_p → C` injective, `X⁻¹_st = (B_cris^+)^{φ=p⁻¹} = 0`; `H¹ ≅ O/C` | holds; CDN-STEIN Theorem 4.12 | none |
| §6.4 Hyodo–Kato of `Ω^d` | `d = 1, r = 1`; `r = 0`; monodromy | `φ = p` on residue classes, `φ^f = q`; `F`, `ℚ_p`; `q^sN = q^{s+1}N ⟹ N = 0` | holds; CDN-STEIN Lemma 5.11 | none |
| §6.5 pro-étale | `r = 0`; `r = d + 1` | `H⁰ = ℚ_p`; `Sp_{d+1} = 0`, `Ω^d/ker d = 0` | holds; CDN-STEIN Theorem 5.13, Remark 1.6(i) | none |
| §6.6 integral de Rham | `d = 1`, points `0,1,2` | residues `(1,−1,0)+(0,1,−1)−(1,0,−1) = 0`; coefficient vector `(1,1,−1)` nonzero mod every prime | holds; CDN-STEIN Proposition 6.5, Theorem 6.28(2)(a),(c) | none |
| §6.7 `AΩ` fixed points | `y² = x³ + p`, `p ≥ 5`; supplier names | generic fibre: `2y = 3x² = 0 ⟹ p = 0`, smooth; special fibre a cusp; `Semistable.aOmega` found in no roadmap | theorem sound; name wrong | R01 |
| §6.9 étale | `r = 0`; `r > d` | `ℤ_p`, `𝔽_p`, `ℚ_p`; all `0` | holds; CDN-DUKE Theorem 1.1, CDN-STEIN Theorem 6.45(1),(4) | none |
| §6.10 Dat's complex | `d = 1`; `i = d − r` against §6.2 | `H¹_c = St`, `H²_c = Λ(−1)`; both `P_{{1,…,i}}` fix subspaces of dimensions `i+1,…,d` | indexings agree; DAT06 lines 1316–1327 | none |
| §7.1 components | `(3I₂, 3)`; `(ϖ, 1, Φ)`, `h = 1` | `9·9⁻¹ = 1`; valuation `1 − 0 − 1 = 0`; agrees with supplier §12.7 stabilizer | holds | none |
| §7.2 models | `n = 0` components `(v,i)`; node `xy = ϖ_E²` | `type + i` mod `2` invariant: two `G`-orbits; lengths `2 = 1 + 1` | holds; CDN20 lines 2103–2122, CDN23 lines 1173–1212 | none |
| §7.3 levelwise diagram | `M_{0,C}^ϖ = Ω ⊔ Ω`, `f = (0,1)` | `df = 0`; nonzero mod diagonal `C`; zero mod `H⁰_dR = C²` | holds; CDN20 Proposition 2.12(i) | none |
| §7.8 non-admissibility | `q = 2` levels; `F = ℚ_p` | `\|Ǧ₀/Ǧ₁\| = q²−1 = 3`, `\|O_D^×/(1+ϖO_D)\| = q²(q²−1) = 12`; (c) fails through the dense map `H(V) ⊗ L̂L(M) → Π_M(V)` | holds; CDN23 lines 1456–1545, 955 | none |

- Source locators checked against the text: 100 (CDN-CURVES 26, CDN-STEIN 39, CDN23 11, GK05 5, DAT06 5, CDN-DUKE 4, CDN20 4, GK14 4, GK05-RT 2); all seeded targets included; none wrong.
- Library declarations opened at the pins: 34 (19 Mathlib, 15 Tau Ceti), each at the file and line the README gives; `Representation.IsIrreducible` is `IsSimpleOrder (Subrepresentation ρ)` (`Mathlib/RepresentationTheory/Irreducible.lean:29`), no smoothness.
- Cross-roadmap citations resolved: 126 section or target ids in 30 roadmaps, on main or at their open heads; one name not found (R01).
- Declared gaps: 4, each with the same slug in the README (lines 118, 142–144) and in the board's plan.
- Gate: every check passes. Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration of `Suggested.lean`: four `sorry` warnings only (lines 131, 145, 159, 272). `#check @name` on all 10 declarations: every binder present, signatures equal to README §§0.3–0.5.
- One-tactic probe on the four sorried theorems: none closes; no padding.

Overlap check: read CstConjectureForDaggerVarieties, PadicHodgeTheory, CohomologyComparisons, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, CohomologyComparisonsPartII, FlagVarieties, AdicSpacesPartIV; nothing shared. The model-free Stein diagram stays with CstConjectureForDaggerVarieties §1.5, the proper-curve interface with CohomologyComparisons §4.12, the components of §7.1 are owned here and imported by ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §0.2.

Source independence: 24 passages compared with 8 sources, none shared beyond formulaic statement phrases of at most 11 words; largest share CDN-CURVES, 122 of 284 locators; contents compared with CDN-CURVES: independent (its Chapters 1, 3–5 and 6.2 are spread over Layers 0 and 2, Chapters 7–8 merged in Layer 4 in the order the limit arguments force).

## Not verifiable

- SS91 §§3–4, IS01, DS01 Theorems 5.7 and 7.7, NAK84 Theorem 4, KM74 Theorem 2, BW00 Chapter X Theorem 4.11: settled as uncertified; read only through their restatements in CDN-STEIN, GK05 and CDN23.

## Source issues

- **Misprint** in CDN-CURVES at §8.2.5, printed p. 107, CDN-CURVES line 4432: the source says the semidirect product law scales the second additive parameter by `p` to the power `deg g₁`; it should be the power `−deg g₁`, as its relation `Ng = p^{deg g}gN` requires; affects nothing.
- **Misprint** in CDN-CURVES at §1.2.1, printed p. 18, CDN-CURVES line 725: the source says the finitely supported boundary map lands in functions on the compact edges; it should land in functions on all edges, as its next display uses; affects nothing.
- **Misprint** in CDN-CURVES at Remarque 6.22(ii), printed p. 86, CDN-CURVES line 3579: the source says the interior product runs over an undefined decorated `Σ(Y)`; it should run over `Σ(Y)∖∂Y`; affects nothing.
- **Error** in CDN-STEIN at §5.2.2, printed p. 38, CDN-STEIN line 1936: the source says the dual of `Sp_J(Λ)` is the limit of the duals of the finite-level function spaces; it should be the annihilator of the relation submodule in that limit; affects nothing.
- **Misprint** in CDN-STEIN at §5.4.1, printed p. 41, CDN-STEIN lines 2063–2064: the source says the de Rham regulator lands in degree `s` and the pro-étale one has twist `s`; both should be `r`; affects nothing.
- **Misprint** in CDN-STEIN at Theorem 6.45(3), printed p. 59, CDN-STEIN line 2928: the source says the regulators are defined on measures on `(d+1)`-tuples of hyperplanes; it should be `(r+1)`-tuples; affects nothing.

## For the human reviewers

- none

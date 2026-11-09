# Review of CyclicHomologyLieHomologyAndQuasiFreeAlgebras (pull request #2037 at 16bbb8e)

**Verdict:** needs changes

Files reviewed: `TauCetiRoadmap/CyclicHomologyLieHomologyAndQuasiFreeAlgebras/README.md` and `TauCetiRoadmap/CyclicHomologyLieHomologyAndQuasiFreeAlgebras/Suggested.lean`. Source ids are those of this review's fetches: `LQ84` is the GDZ scan of Loday–Quillen 1984, read as rendered page images and cited by printed page; `KL82` is the Numdam text of Kassel–Loday 1982; `CQ95a`, `CQ95b` are the AMS open-archive texts of Cuntz–Quillen 1995a/b; `Cor06` is arXiv:math/0111096v5; `DHK85` is the AMS open-archive text of Dwyer–Hopkins–Kan; `Connes94` is Connes, *Noncommutative Geometry*, the PDF on the author's site; `Zbl <number>` is a zbMATH Open review.

## The previous review's findings at this head

| Previous finding | Status | Passage at this head |
|---|---|---|
| R01 completion of a quasi-free algebra | repaired | 4.2: "a quasi-free `A` lifts every homomorphism `A → R/I` to the `I`-adic completion" (Prop 6.1 (1), p. 275), the `ℚ⟦x⟧` negative Check, and 4.4's route through towers |
| R02 Hopf structure in characteristic zero | repaired | 2.1: "over a field `k` of characteristic zero … (Loday–Quillen 1984, §6, pp. 583–584)"; Convention 1 split accordingly |
| R03 nil-invariance over ℚ owned by RefinedTraceMethods | repaired | Scope: "3.2 cites it for `k = ℚ` and keeps the form for `HP` relative to an arbitrary field"; §4.9, §4.18 in 3.2's *Needs* |
| R04 SmoothRepresentationsOfLocalGroups | repaired | Scope and Downstream: "states the idempotented-algebra case independently and cites nothing here" |
| R05 2.5 and 3.1 narrower than sources | repaired | 2.5 for `A` free over a commutative ring (Kassel–Loday Corollaire 1.9); 3.1 over a commutative ring; the weight Check moved to 3.2 |
| R06 Tau Ceti and earlier owners | repaired | "Left to Tau Ceti" and "From Tau Ceti" list the six declarations; ALS.F.5 and LieGroupoidsPoisson §G1.3 cited |
| R07 wrong locators | repaired | CQ95b §3, p. 388 and §4, p. 392; Cortiñas Corollary 0.2, p. 2; Theorem A with Wodzicki (4) |
| R08 targets without numbered locators | partly | the table's locators are in; 3.1, 4.6, 5.1, 5.2, 5.4, 5.5, 5.6 still cite a work only (R07 below) |
| R09 two false Checks | repaired | 2.1 Check 4 ("the product itself sends `H₁ ⊗ H₁` to `H₂`"); 5.3 Check 3 ("the Dorroh unitisation … itself never does") |
| R10 docstring omits headlines | repaired, but one bullet it asked for is wrong | see R01 below: the wording that review suggested for 4.1's characterisations misdescribes Mathlib |
| R11 API bullet lists | repaired | bullet lists under 2.1, 4.1, 4.3, 5.1, 5.4, 5.5, 5.6 |

## R01 (P2) — 4.1's Hochschild-dimension characterisation is statable at the pins and is not stated

**Location.** `Suggested.lean` lines 40–42: "4.1's characterisations (`Ext²_{A^e}(A, −) = 0`, …): Mathlib has no `A ⊗ Aᵐᵒᵖ`-module structure on `A ⊗ A` …, so neither `A^e`-modules nor `Ω¹A ⊗_A Ω¹A`."

**Claim.** The README Summary names "Hochschild cohomological dimension at most one" as a headline. Its carrier exists: Mathlib gives every `A`-bimodule, and `A` itself, an `A ⊗[R] Aᵐᵒᵖ`-module structure. This corrects the bullet the previous review proposed: `#synth` fails there only because the structure is a `def`, not an instance.

**Witness.** `TensorProduct.Algebra.module` (`Mathlib/RingTheory/TensorProduct/Basic.lean:565`); `instModuleTensorProductMop : Module (A ⊗[R] Aᵐᵒᵖ) A` (`Mathlib/Algebra/Azumaya/Defs.lean:39`); `CategoryTheory.HasProjectiveDimensionLE` (`Mathlib/CategoryTheory/Abelian/Projective/Dimension.lean`).

**Repair.** State the headline, for example

```lean
theorem isQuasiFree_iff_hasProjectiveDimensionLE_one (K : Type u) [Field K] (A : Type u)
    [Ring A] [Algebra K A] :
    letI : Module (A ⊗[K] Aᵐᵒᵖ) A := TensorProduct.Algebra.module
    IsQuasiFree K A ↔
      CategoryTheory.HasProjectiveDimensionLE (ModuleCat.of (A ⊗[K] Aᵐᵒᵖ) A) 1 := by
  sorry
```

and name it in 4.1's bullet. This elaborates in a scratch file at the pins with `sorry` as the only warning, as does the form `∀ M : ModuleCat.{u} (A ⊗[K] Aᵐᵒᵖ), Subsingleton (Abelian.Ext (ModuleCat.of _ A) M 2)`. Reduce the docstring bullet to what still lacks a carrier: `Ω¹A` as an `A^e`-module and `Ω¹A ⊗_A Ω¹A` (no tensor product over a noncommutative ring).

## R02 (P2) — 4.2: "separable algebras are quasi-free" is false over a commutative ring

**Location.** `README.md` line 647: "Prove that separable algebras are quasi-free (loc. cit., p. 267)", with Convention 1 (line 117): "4.1–4.2 … work over a commutative ring `k`".

**Claim.** With `IsQuasiFree`, which lifts along every square-zero surjection of `k`-algebras, separability implies quasi-freeness only over a field. The source works over ℂ and argues through bimodule splittings.

**Witness.** `k = ℤ`, `A = ℤ/2`: `A ⊗_ℤ Aᵐᵒᵖ = ℤ/2`, so `A` is separable. `ℤ/4 → ℤ/2` is surjective with kernel `{0, 2}`, `2·2 = 0`. A lift `g` of the identity has `g(1) = 1` and `0 = g(1 + 1) = 2 ≠ 0`.

**Repair.** Write "separable algebras over a field are quasi-free" (the clause "over a field" already covers the closure properties), change Convention 1 to "4.1's definition and nilpotent lifting and 4.2's free algebras work over a commutative ring; everything else in 4.1–4.2 takes `k` a field", and add the Check "`ℤ/2` is separable over `ℤ` and not quasi-free over `ℤ`: the identity does not lift along `ℤ/4 → ℤ/2`". Over a field the instance disappears: a separable `A` has `Ext²_(A^e)(A, −) = 0`.

## R03 (P2) — 1.4 needs `V` flat: the suppliers' cyclic homology resolves a non-flat algebra

**Location.** `README.md` lines 305–309: "For a `k`-module `V` and the tensor algebra `T(V)`, prove: the reduced cyclic homology is `H̄C_n(T(V)) ≅ ⊕_(m>0) H_n(ℤ/m, V^⊗m)`"; *Needs:* RefinedTraceMethods §1.4, KTheoryFiniteLocalFields §4.0.

**Claim.** The suppliers define `HC_n(A/k)` "from a `k`-flat resolution when `A` is not flat" (RefinedTraceMethods §1.4; KTheoryFiniteLocalFields §4.0 uses derived Hochschild chains). `LQ84` proves Proposition 5.4 for the Hochschild complex of `T(V)` itself, through Lemma 5.2 (p. 582), `H_n(T(V)) = 0` for `n ≥ 2`. That step fails for the suppliers' `HH`.

**Witness.** `k = ℤ`, `V = ℤ/2`: `T(V) = ℤ[x]/(2x)` and `T(V)[x⁻¹] = 𝔽₂[x, x⁻¹]`. Derived `HH_*(𝔽₂[x^±]/ℤ)` contains `HH_*(𝔽₂/ℤ)`, which is `𝔽₂` in every even degree, so derived `HH_n(T(V)/ℤ) ≠ 0` for arbitrarily large `n`; Lemma 5.2 gives `0`.

**Repair.** State 1.4 "for a flat `k`-module `V`" (then `T(V)` is `k`-flat and the two complexes agree), and add the Check above as the reason. I did not complete an independent computation of the derived `H̄C_n(T(ℤ/2)/ℤ)`; the `HH` step is certain. The same sentence is needed in 5.2 over a commutative ring, where Wodzicki's theorem is about the Hochschild complex of a pure extension: take `A`, `R`, `S` flat over `k`, or say in Convention 1 which complex 5.1–5.2 use.

## R04 (P3) — two Checks are false as written

**Location.** 4.6 Check 2, lines 773–775: "the same extension in `HC` (not periodic) does not give a six-term sequence, since `J = xk[x]` is not H-unital". 3.1 Check 2, lines 541–543: "`L_D(xᵐ) = m xᵐ`, nonzero for `m > 0` … `HP₀(k[x]) = k`".

**Claim.** (a) `k[x]` is the unitisation `J⁺` of `J = xk[x]`, and `HC(J)` is defined as the relative term of `J⁺ → k`, so for this extension the long sequence is exact by definition. This is the error of the previous R09 (b) in another place. (b) 3.1 is stated over every commutative ring, and the Check holds only for `ℚ ⊆ k`.

**Witness.** (a) Over `ℚ`: `HC₀(J) = xk[x]`, `0 → xk[x] → k[x] → k → 0` is exact, and `HC_n(J) = 0`, `HC_n(k[x]) ≅ HC_n(k)` for `n ≥ 1`. (b) Over `𝔽_p`, `p·xᵖ = 0`, and by 1.4 the weight-`p` part of `H̄C_n(𝔽_p[x])` is `𝔽_p` for all `n`, so `HP₀(𝔽_p[x]) ≠ 𝔽_p`.

**Repair.** (a) Replace the clause by: "`J` is not H-unital (`J² ≠ J`), so by 5.2 some extension containing `J` fails excision in `HC`, for instance `J = (x)` in `k[x, y]/(xy)` against `xk[x] × 0` in `k[x] × k[y]`, where `[x dy] ≠ 0` in `HC₁(k[x, y]/(xy)) = Ω¹/dΩ⁰` maps to `0` (the Milnor square that RefinedTraceMethods §4.18 records as failing excision); `k[x] = J⁺` itself never does." (b) Begin the Check "Over `ℚ ⊆ k`".

## R05 (P3) — 1.2 states the `Ext` algebra over a field; Convention 1 and the source give a commutative ring

**Location.** `README.md` line 264: "Prove: over a field `k`, `Ext^*_(kΛ)(k♮, k♮)` is the polynomial algebra `k[u]`"; Convention 1, line 116: "Layer 1 (except 1.1's dual and the operator `S` of 1.2) … work over a commutative ring `k`".

**Claim.** The two disagree, and the statement is narrower than its source.

**Witness.** `Connes94` line 10817 (Chapter III, Appendix A, Theorem 11 a): the ring `Ext^*_Λ(ℤ♮, ℤ♮)` is `ℤ[σ]` with `σ` of degree 2. For any `k`, 1.1's resolution computes `Ext^n(k♮, k♮)` as `k` for `n` even and `0` for `n` odd.

**Repair.** Write "over a commutative ring `k`" in 1.2's first clause and keep "over a field of characteristic zero" for the comparison with `S` on `TauCeti.cyclicCohomology`.

## R06 (P3) — Layer 5's Examples promise a Morita invariance of `HH` and `HC` that no target states

**Location.** `README.md` lines 949–951: "its Morita contexts with surjective pairings preserve `HH`, `HC` (5.2 with RefinedTraceMethods §1.6) and `K₀′`."

**Claim.** RefinedTraceMethods §1.6 is Morita invariance for unital algebras and the matrix trace; 5.2 is excision. Neither gives invariance of `HH` and `HC` under a Morita context between rings with local units, and 5.5 states equivalences of module categories only.

**Witness.** 5.5's three bullets (lines 892–897) and 5.6's second bullet are the only Morita statements in Layer 5; none mentions `HH` or `HC`.

**Repair.** Delete "`HH`, `HC` (5.2 with RefinedTraceMethods §1.6) and" so that the example claims only `K₀′` (5.6), or add the statement to 5.5 as a bullet with its hypotheses on `P`, `Q` and a locator.

## R07 (P3) — targets that still cite a work without a numbered locator

**Location.** 3.1 ("Goodwillie 1985, Part II"); 4.6 ("Cuntz–Quillen 1997; Cuntz–Quillen 1993"); 5.1 and 5.2 ("Wodzicki 1989"); 5.4 ("González-Férez–Marín 2007"); 5.5 ("Marín 1998"); 5.6 ("Quillen 1996"); 1.1's dual and 1.2 ("Connes 1983").

**Claim.** The previous R08 is repaired for the locators it listed and not for these; each claim needs a theorem, section or page.

**Witness.** Open texts that record two of them: `Connes94` lines 10805–10819 (Chapter III, Appendix A, Theorems 10 and 11: `HCⁿ(A) ≅ Extⁿ_(k(Λ))(A♮, k♮)`, `ℤ[σ]`, `BΛ = BS¹`); `Cor06` lines 116–119 (Wodzicki's characterisation is his (3)).

**Repair.** Cite Connes, *Noncommutative Geometry*, Chapter III, Appendix A, Theorems 10 and 11 beside Connes 1983 in 1.1–1.3; cite Wodzicki 1989, (3), as recorded in Cortiñas 2006, p. 3, in 5.2; give the theorem numbers of the others from the texts.

## R08 (P3) — 5.4's example ring is over a field in the source

**Location.** `README.md` lines 872–874: "For the nonunital monomial algebra `R = k⟨x, y, z₁, z₂, …⟩/I` … the category of firm left `R`-modules is not abelian".

**Claim.** 5.4 opens with a nonunital ring and never introduces `k`; elsewhere in Layer 5 `k` is a commutative ring. The source's theorem takes a field.

**Witness.** `Zbl 1137.16010`: the main theorem is stated for a field `K` and the nonunital ring `K⟨X⟩/I`.

**Repair.** Write "For a field `k` and the nonunital algebra `R = k⟨x, y, z₁, z₂, …⟩/I`" (words of positive length). In the same list, the bullet "`A` is firm as a left module over itself if and only if `A ⊗_A A → A` is bijective" restates the definition: keep only "a ring with local units is firm over itself".

## R09 (P3) — process references and a stale remark in the README

**Location.** Line 46: "A search of the roadmaps on main, of the open pull requests and of the maintainers' packages …"; line 962: "No roadmap on main or in the open pull requests consumes a target"; line 222: "(the one layer stated in Lean, on Mathlib and Tau Ceti)".

**Claim.** The first two name the pull-request state, which the timeless rule excludes. The third is inaccurate: Layer 4 is stated in Lean as well.

**Witness.** `Suggested.lean` lines 85–119 state 4.1 and 4.2 under `## Layer 4`.

**Repair.** "No other roadmap owns the Loday–Quillen–Tsygan theorem, …"; "No roadmap consumes a target of this roadmap."; in "How to read the build", "(stated in Lean on Mathlib and Tau Ceti)" for Layer 2 and "(stated in Lean on Mathlib's algebra maps)" for 4.1–4.2.

## Verified sound

**Gate and build.** My run of the gate at this head, with the candidate merge order, prints `OK` with every counter 0. `gate --depcheck … --movable` prints `depcheck: 236 roadmaps, 2266 edges, 0 problem(s)`: no UPWARD or CYCLE line; the roadmap sits directly after RefinedTraceMethods. `lake env lean` on `Suggested.lean` gives four warnings, `declaration uses 'sorry'`, at lines 77, 103, 112, 117, and nothing else. No file outside the folder changes.

**Signatures.** `#check @` for all 6 declarations in one scratch file: `glAction` over `CommRing k`; the 2.2 theorem with `[Field K] [CharZero K]`; `IsQuasiFree` with `R S : Type u`; the nilpotent lift with `π`, surjectivity, `n` and the list hypothesis explicit; `isQuasiFree_freeAlgebra` over `CommRing k`; the non-example over `[Field K]`. Each equals its README statement; no binder is lost.

**Padding probe.** Each of the four theorems was tried with `simp [IsQuasiFree, glAction]`, `aesop`, `rfl` and `exact?`: 16 attempts, none closes. `glAction k r 0 x = 0` closes by `simp`, as the README's `p = 0` reading predicts.

**Library declarations opened at the pins** (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`, equal to main's): `TauCeti.permTensorActionAlgHom_injective_iff` (`Faithful.lean:167`), `TauCeti.mem_range_permTensorActionAlgHom_iff_forall_commute` (`SchurWeyl.lean:137`), `TauCeti.cyclicCohomology` (`Cohomology.lean:273`), `TauCeti.periodicCyclicCohomology` (`PeriodicCohomology.lean:119`), `TauCeti.relativeCyclicCohomology` (`Relative.lean:284`), `TauCeti.cyclicQuotient` (`CyclicQuotient.lean:151`), the `UniversalDifferential` folder; `TauCeti/RingTheory/CyclicCohomology/Derivation.lean` builds cocycles from a trace and derivations and does not state 3.1. Mathlib: `LieAlgebra.twoCochain` (`Algebra/Lie/Cochain.lean:46`), `Representation.Coinvariants` (`RepresentationTheory/Coinvariants.lean:57`), `Algebra.IsSeparable` (field-theoretic only, `FieldTheory/Separable.lean:548`). Neither library has a declaration for quasi-free algebras, the Chevalley–Eilenberg complex, the cyclic category, H-unitality, firm modules, Morita contexts, the Fedosov product, the X-complex, cyclic homology or Hochschild homology of an algebra (10 greps by object, 0 hits each; Tau Ceti's Hochschild files are the cochain side).

**Cross-roadmap citations resolved (13).** RefinedTraceMethods §1.1 (`Λ`, `Λ_∞`), §1.2, §1.4 (Connes' complex for `ℚ ⊆ k`; `HC_n(k[x]) = HC_n(k)` over `ℚ`), §1.6, §4.9 ("`HP(−⊗ℚ/ℚ)` is truncating"), §4.18 (nil-invariance, and the rational obstruction "equals that in `HC⊗ℚ` (shifted by one)"); KTheoryFiniteLocalFields §4.0 `cyclicHomologyModel`; AlgebraicKTheory §3.4; GeneralAlgebraicKTheory §8.3 and §8.10 (a nonzero square-zero `I` fails degree-one excision); SmoothRepresentationsOfLocalGroups SR.1.3, which says it cites nothing here; TopologicalKTheory T3; PerfectoidSpaces (the only firm modules on main). All suppliers precede this roadmap in the merge order. A search of main and the open heads for quasi-free algebras, H-unitality, the Loday–Quillen theorem, the Chevalley–Eilenberg chain complex, the X-complex, Morita contexts, `K₀′` and Goodwillie's theorems found no second owner; no open pull request changes this roadmap or drops an id it cites.

**Sample locators verified against the text.**

- 1.1 dual, 1.2, 1.3: `Connes94` lines 10805–10819; `DHK85` line 244 (§5, p. 287).
- 1.4: `LQ84` p. 581 (`V` a module over `k`), p. 582 (`σ` without sign, Lemma 5.2), p. 583 (Proposition 5.4 and its characteristic-zero form).
- 2.2: `LQ84` §6.3, pp. 584–585: surjectivity onto the invariants from Weyl, bijectivity for `r ≥ n`, coinvariants `k[Σ_n]` with conjugation.
- 2.5: `LQ84` p. 586 (Corollary 6.7), p. 587 (Remark: no hypothesis on the characteristic); `KL82` lines 181–204: Théorème 1.7, pp. 123–124, Proposition 1.8 and Corollaire 1.9, p. 124, with `A` a free `k`-module and `5 ≤ n ≤ ∞`, cyclic homology indexed one higher (`KL82` line 99).
- 2.6: `LQ84` p. 587, Theorem 6.9, word for word the README's ranges.
- 2.1, 2.3, 2.4: `LQ84` p. 583 (the differential, characteristic zero for §6), p. 584 (Lemma 6.1, Theorem 6.2), p. 585 (Propositions 6.4, 6.6).
- 4.1: `CQ95a` line 694 (Proposition 3.3, p. 267), line 750 (Proposition 3.4 (4), p. 268), lines 1019–1021 (nilpotent extensions, p. 275).
- 4.2: `CQ95a` lines 712–715 (free and separable, p. 267), 935–955 (dimension `n`, Proposition 5.3, p. 273), 1034 (Proposition 6.1 (1), p. 275).
- 4.3, 4.4: `CQ95b` lines 620 and 816 (§3, p. 388; §4, p. 392), line 34 ((2), p. 373), line 1256 (Theorem 6.2, p. 403), lines 1765–1803 (Proposition 9.2, Theorem 9.3, p. 416; Corollary 9.4, pp. 416–417).
- 4.5: `CQ95a` lines 195–223 (the universal property of `RA`, Proposition 1.2, p. 255, `IAⁿ ↔ ⊕_(k≥n) Ω^(2k)A`, `RA` free on a basis).
- 5.3: `Cor06` lines 47–48 (Corollary 0.2, p. 2), 94 (Goodwillie II.5.1), 116–123 (Wodzicki (3), (4); Suslin–Wodzicki Theorem A).
- 5.4: `Zbl 1137.16010`: left xst ⟺ every unitary module is firm, then the firm modules are abelian; the example ring; the right-module category is abelian.
- 5.5: `Zbl 0928.16007`: surjective pairings give both equivalences; the three equivalent conditions with "acceptable" as the README defines it.
- 5.6: `Zbl 0837.19001`: the definition by complexes over any `R`, independence of `R`, the canonical surjection onto `K₀` that is an isomorphism for C*-algebras, and `K⁰(X, Y)`.

**Adversarial table** (values computed on each side):

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Tor | `X = k♮`; degree 0 of `A♮`; `k → M₂(k)` | `Tor_n = k`, `0` (n even, odd) `= HC_n(k)`; `X₀/im(d₀ − d₁) = A/[A, A]`; `1 ↦ tr I₂ = 2` | holds | — |
| 1.2 | `Ext⁰`, `Ext¹`, `uᵐ`; ground ring ℤ | `k`; `HC¹(ℚ) = 0`; `Sᵐ : k ≅ k`; `ℤ[σ]` in `Connes94` | holds over any `k` | R05 |
| 1.4 | `V = k` over ℚ, 𝔽₂; `V = k²`, `m = 2`; `V = ℤ/2` over ℤ | `H̄C₀ = ⊕ kxᵐ`, `H̄C_(n>0) = 0`; `H_n(ℤ/2, 𝔽₂) = 𝔽₂`; `dim = 3`; derived `HH_(2j) ≠ 0` against Lemma 5.2's `0` | needs `V` flat | R03 |
| 2.2 Weyl form | `p = 0`; `r = 0`; `r = p = 2` on `e₂ ⊗ e₂`; `r = 2, p = 3` | `glAction = 0`, range all of `End K`; zero space; `[gA E₁₂, gA E₂₁] = −2 e₂⊗e₂ = gA(E₁₁ − E₂₂)`; `(x⊗1 + 1⊗x)² − (x²⊗1 + 1⊗x²) = 2 x⊗x`; `P∘gA(e₂e₂e₂) = e₁e₂e₂ ≠ 0 = gA∘P(e₂e₂e₂)` | holds | — |
| 2.2 coinvariants | `r = 1, p = 2` | `id − swap ↦ 0`, as `¬ 2 ≤ 1` predicts | holds for `r ≥ p` only | — |
| 2.3 Check 2 | `[x, y] = y`, `𝔤 = k·y` | coinvariant complex `k(x∧y) → 𝔤′/ky → k`, `d(x∧y) = −y ↦ 0`, `H₂ = k`; `H₂(𝔤′) = 0` | holds | — |
| 2.5 | `A = k`; `k[x^±]`; `𝔽_p[x]`; `M₂(k)` | `0 = 0`; `k·[x⁻¹dx]`; `[x^(p−1)dx] ≠ 0` and `H̄C₁` weight `p` is `H₁(ℤ/p, 𝔽_p) = 𝔽_p`; `[E₁₂, E₂₁] = E₁₁ − E₂₂` has trace `0` in `A/[A, A]` | holds, equals Corollaire 1.9 | — |
| 2.6 | `A = k`, `n = 2`, `i = 0, 1, 2` | `k ≅ k`; `H₁(𝔤𝔩₁) = k → H₁(𝔤𝔩₂) = k`; `H₂(𝔤𝔩₁) = 0`, `H₂(𝔤𝔩₂(k)) = H₂(𝔰𝔩₂ × k) = 0`, `Ω¹_k = 0` | holds | — |
| 3.1 | `ℚ[x]`, `𝔽_p[x]`, `ℤ[x]` with `D = x d/dx` | weight `m` acts by `m`; over `𝔽_p` nonzero `H̄C_(n≥1)` only for `p ∣ m`; over ℤ, `H_n(ℤ/m, ℤ) = ℤ/m` killed by `m` | holds over every `k`; Check 2 needs `ℚ ⊆ k` | R04 |
| 3.2 and the `𝔽_p[ε]` computation | weights `w` even, odd | `b x_w = (1 + (−1)^w) y_(w−1)`, `B y_(w−1) = w x_w` (`w` odd), `0` (`w` even); zero differential for odd `p ∣ w`, and for even `w` when `p = 2` | holds | — |
| 4.1 `IsQuasiFree`, nilpotent lift | `n = 0, 1`; `k[t]/t³ → k[t]/t²`; split extensions only | `[].prod = 1` forces `R = 0`; `π` injective; `x ↦ t` lifts; `a ↦ (f a, 0)` always lifts | holds | — |
| 4.1 dimension form | `K`-algebra `A`, Mathlib's `A^e`-module on `A` | elaborates at the pins | statable, absent | R01 |
| 4.2 free, `K[x, y]` | `FreeAlgebra k Empty`; `K[ε]`; `K[x, y]` | `π 1 = 1`; `(t + ct²)² = t² ≠ 0` in `K[t]/t³`; dimension 2 by `CQ95a` line 935 | holds | — |
| 4.2 separable | `ℤ/2` over `ℤ` | `A^e = ℤ/2`; no ring map `ℤ/2 → ℤ/4` | false over a ring | R02 |
| 4.2 group algebras | `SL₂(ℤ)`, `ℤ²`, `ℤ/p` over `𝔽_p` | `cd_ℚ = 1`; `cd = 2`; `cd = ∞`; the summand of the class of `1` in `(N ⊗ k[G])_ad` is `N` | holds | — |
| 4.3 | `♮d∘b`; `κ` on `Ω¹`; commutative `R` | `♮d(yz) = ♮(z dy + y dz)`, symmetric; `κ(a₀ da₁) = da₁ a₀`; `Ω¹R_♮ = I/I²`, `b = 0`; `X(ℚ[x])`: `H₀ = ℚ`, `H₁ = 0` | holds | — |
| 4.5 Fedosov | `a ∘ 1`; `A = k`; `(da db) ∘ (dc de)` | `a − da d1 = a`; `RA = k`; `da db dc de`, in `(IA)²` | holds, equals Proposition 1.2 | — |
| 4.6 | `J = A`; `k[x] ⊃ (x)`; `k[x^±] ⊃ (x − 1)` | identity; `HP(J) = 0`; `HP₁(J) ≅ k`; in `HC`, `0 → xk[x] → k[x] → k → 0` is exact | theorem holds; Check 2 false | R04 |
| 5.2 | `A × S`; `εk[ε]`; `pℤ ⊂ ℤ` | split; `A/A² = kε ≠ 0`; `pℤ ⊗ ℤ/p → ℤ ⊗ ℤ/p` is `0`, `A² = p²ℤ` | holds for the Hochschild complex | R03 |
| 5.4 | `2ℤ`, `ℤ/2` | `A ⊗_A M = ℤ/2`, `AM = 0`; for idempotent `A`, xst gives `r ∈ Ar` from `A(ℤr + Ar) = ℤr + Ar` | holds | R08 |
| 5.5 | `εℤ[ε]`, `φ = ψ = 0` | `a₁a₂ = 0 ∈ im φ`; firm and closed modules are `0` | holds | — |
| 5.6 Check 2 | `[[1,1],[0,0]]`, `diag(1,0)`; `diag(1,0)`, `0` | `(P − Q)³ = 0`, `tr = 0`; `(P − Q)³ = P`, `tr = 1` | holds | — |

## Not verifiable

- Goodwillie 1985 (Topology, a paywalled publisher): the theorem numbers for 3.1 and that the text states it over a commutative ring. `Zbl 0569.16021` describes the paper over a field of characteristic zero. The statement over every commutative ring is checked in the table and follows from the integer-coefficient Cartan identities the route names.
- Cuntz–Quillen 1997 and 1993 (4.6, and what "the approximately H-unital case" refers to), Wodzicki 1989 (5.1, 5.2, the purity hypothesis, local units), Suslin–Wodzicki 1992 beyond what `Cor06` records (C*-algebras), Quillen 1996 beyond its review (the hypotheses of the Morita invariance in 5.6's second bullet), Marín 1998 and González-Férez–Marín 2007 beyond their reviews, Connes 1983, Loday's *Cyclic Homology* (§6.2, Chapter 7), Tsygan 1983, Milnor–Moore 1965, Cartan–Eilenberg, Dunwoody 1979: no legal copy was read.
- 5.2 with the suppliers' resolved `HH` for non-flat algebras over a commutative ring: neither confirmed nor refuted (R03).

## Source issues

- none

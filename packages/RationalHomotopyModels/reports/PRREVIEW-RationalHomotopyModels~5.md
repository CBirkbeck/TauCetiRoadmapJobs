# Review of RationalHomotopyModels (pull request #2298 at 2b7b442)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README 103–111 places the identification, universal property, restriction/products and §1.2 API under characteristic zero; README 304 explicitly qualifies the identification of indecomposables with generators. The characteristic-two witness remains valid.

## Verified sound

| Statement | Instances | One side | Other side | Result; change |
|---|---|---|---|---|
| Ground-field witness; §1.1 identification | 𝔽₂[u], generators u₁, u²₂; Λ(e₁, v₂) over ℚ | uᵃ(u²)ᵇ = u^(a+2b), a ∈ {0,1}: basis; u² ≠ 0 | Over ℚ, e² = −e² implies e² = 0; basis eᵃvᵇ | Characteristic-two counterexample explicitly excluded from identification |
| §1.1 universal property | Λ(e₁) → Λ(z₁) over ℚ, e ↦ 2z; Λ(e₁) → 𝔽₂[s₁], e ↦ s | (2z)² = 0; unique map a+be ↦ a+2bz | In characteristic two, φ(e²) = 0 but φ(e)² = s² ≠ 0 | Stated characteristic-zero hypothesis excludes the failed map |
| §1.1 products | Λ(e₁,f₁) over ℚ; 𝔽₂[u] on u,u² | e² = f² = 0; ef = −fe | Odd-generator product formula gives 0; characteristic-two u·u = u² ≠ 0 | Formula now scoped correctly |
| §1.1 restriction and tensor comparison | Λ(e₁,v₂) over ℚ; 𝔽₂[u] on u,u² | Λ(e) ⊗ ℚ[v] has basis eᵃ⊗vᵇ, a ≤ 1 | Multiplication gives eᵃvᵇ bijectively; characteristic-two analogue kills u²⊗1−1⊗v ≠ 0 | Restriction and comparison now scoped correctly |
| §1.2 Sullivan inclusions and Hirsch extensions | ℚ[v₂] ⊆ Λ(v₂,u₁), du=v, v<u | Earlier subalgebra ℚ[v], d(v)=0 | Extension basis vᵇ and uvᵇ; d(uvᵇ)=v^(b+1) | Inclusion stable under d; extension satisfies the scoped API |
| §1.2 indecomposables identification | Λ(e₁,v₂) over ℚ; 𝔽₂[u] on u,u², d=0 | Over ℚ, Q(A) has basis [e],[v], dimension 2 | Over 𝔽₂, Q(A)=(u)/(u²) has dimension 1; generator span has dimension 2 | Explicit characteristic-zero qualification repairs the mismatch |
| §1.2 minimality criterion over arbitrary fields | 𝔽₂[u], du=u², order u²<u; Λ(v₂,u₁), du=v | First: du∈(u²), d(u²)=0; minimal. Second: du=v is indecomposable; not minimal | First: d(uⁿ)=(n mod 2)u^(n+1)∈(u²). Second: d(A⁺) contains v∉(A⁺)² | Both directions agree in positive and negative controls |
| §1.3 DG-map criterion over arbitrary fields | 𝔽₂[u], du=u²; targets 𝔽₂[s], d=0, and 𝔽₂; u↦s or 0 | dB(φu)=0 in both targets | φ(du)=s²≠0 or 0, respectively | First map fails both conditions; augmentation satisfies both |

The adversarial rows for untouched statements stand as in the previous review, of `dffc64c`.

- Sources: 3 locator groups reopened: Hess2007 §1 before Definition 1.10, p. 5, lines 229–240; Morgan1978 §1, p. 141, lines 214–220; Definition 5.2 and its note, p. 163, lines 1024–1035.
- Pinned carriers: 3 declarations opened: Mathlib `RingTheory/GradedAlgebra/Basic.lean:167` (`GradedAlgebra`); Tau Ceti `Algebra/Homology/DG/Algebra/Defs.lean:206` (`IsDGAlgebra`); `Algebra/Homology/DG/Algebra/Hom/Basic.lean:50` (`DGAlgHom`). Grading and the DG laws impose no characteristic-zero hypothesis.
- Signatures: all 20 `#check @` types elaborated on a scratch copy and match the supplied signatures; 11 theorems retain `CharZero`, 2 criteria and 7 definitions omit it. No binder mismatch with the revised convention.
- Citations: 8 supplier roadmaps resolved at main or their supplied open heads; EllAdicHomotopyTypesAndWeights's five contracts retain characteristic-zero hypotheses. No supplier or numbering changed.
- Gate: worker gate passes every check, including build. Rerun has only `depcheck: NOT IN ORDER: RationalHomotopyModels (insert it after its last supplier)`, exempt under the brief; every other scanner is 0.
- Candidate-order dependency output: `depcheck: 243 roadmaps, 2198 edges, 0 problem(s)`; no UPWARD or CYCLE. Targeted build and direct `lake env lean` both pass, with only 13 `sorry` warnings.
- PR text: title, description and the new-folder change agree with the repair; 0 removed headings or declarations, 0 changed suppliers, 0 changes outside the folder.

Remark on untouched text: SymplecticFieldTheory §0.3 also develops the free supercommutative ℚ-algebra and its universal property; this overlap predates the repair and is outside this incremental verdict.

Overlap check: read EllAdicHomotopyTypesAndWeights, KanQuillen, SuperconnectionsAndMathaiQuillenForms, DeRhamCohomologyAndDuality, DGAInfinity and SymplecticFieldTheory. RationalHomotopyModels owns the Sullivan and polynomial-form contracts consumed by EllAdicHomotopyTypesAndWeights; DGAInfinity owns tensor coalgebras, cobar, A∞ formality and Massey products; SymplecticFieldTheory owns its free supercommutative ℚ-algebra (§0.3, remark above). The other scopes introduce no overlap affected by this repair.

Source independence: changed passages only; 2 passages compared with 2 sources (Hess2007 and Morgan1978), with no copied wording or reused source material. Largest locator share remains Hess2007, 23 of about 80 in the previous audit. No layer was added, removed or reordered, so the previous independent-arrangement result stands; contents were not compared again. FHT2001 and DGMS1975 remain unread.

## Not verifiable

- FHT2001 §3 and §12: settled uncertified; the affected free-algebra and Sullivan claims were checked through Hess2007, Morgan1978 and the displayed computations.

## Source issues

- none

## For the human reviewers

- **Not tested.** FHT2001 and DGMS1975 remain uncertified; Quillen 1969 and Bousfield–Gugenheim 1976 had no open text in the previous review. Its Layers 5–7 comparisons used Hess2007, Morgan1978, Sullivan1977 and the Félix–Halperin survey only.
- **Licence.** The previous review found no public formalisation resembling `Suggested.lean` among pinned libraries or open roadmaps; it searched nothing outside them. This repair changes no Lean declaration.

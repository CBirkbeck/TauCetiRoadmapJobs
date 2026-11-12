# Review of BanachSpaceTheory (pull request #1854 at 7c577f0)

**Verdict:** needs changes

## R01 (P3) — §4.4 credits the pinned RMK theorem with a total-mass identity it does not state

**Location:** `TauCetiRoadmap/BanachSpaceTheory/README.md:804–807`: "the pinned Riesz–Markov–Kakutani representation `…integral_rieszMeasure_posPart_sub_integral_rieszMeasure_negPart` of a bounded functional on `C(K, ℝ)` … as the difference of the integrals against two finite regular measures whose total masses add up to its norm".

**Claim:**
- The norm equality of the integral and nuclear ideals needs these masses to be at most `‖Λ‖`.
- The cited theorem gives only the integral identity, on `C_c(X, ℝ)`.
- The route names no source for finiteness or for the total-mass identity.

**Witness:** `TauCeti/MeasureTheory/Integral/RieszMarkovKakutani/Signed.lean:262` concludes only `∫ f ∂μ⁺ − ∫ f ∂μ⁻ = Λ f`. Its module docstring (`:16–17`) and `:271` say that the two measures need not be finite.

**Repair:**
- Replace the quoted clause with: "writes a bounded `Λ` on `C(K, ℝ) = C_c(K, ℝ)`, `K` compact Hausdorff, which is order bounded, as the difference of the integrals against the Riesz measures of `TauCeti.RealRMK.posPart` and `TauCeti.RealRMK.negPart`. These measures are finite since `K` is compact. Their total masses `posPart 1 + negPart 1 = sup_{0 ≤ g ≤ 1} Λ(2g − 1) = ‖Λ‖` follow from `TauCeti.RealRMK.posPart_apply_of_nonneg` and `TauCeti.RealRMK.negPart_apply` (`Signed.lean:188,211`)".
- Add both names to §4.4's *Needs:* and to the Layer 5 contract (`:291–293`).
- Tested at `K = {a, b}`, `Λ f = f(a) − 2f(b)`: `posPart 1 = 1` and `negPart 1 = 2`, so the masses sum to `3`. This equals `‖Λ‖`, attained at `h = (1, −1)`.

## R02 (P3) — §6.2's restatement of the pinned compact-space inequality drops `0 ≤ C`

**Location:**
- `README.md:1758–1760`: "for compact normal `K, L`, a bilinear `B` on `C(K, 𝕜) × C(L, 𝕜)` with `‖B(f, g)‖ ≤ C ‖f‖ ‖g‖`, and families with … `‖Σ_i B(f_i, g_i)‖ ≤ 16 C`".
- `:91–92`: "for finite families of bilinear forms on `C(K, 𝕜) × C(L, 𝕜)`".

**Claim:**
- Without `0 ≤ C`, the restated inequality is false when `K` is empty.
- The Scope line speaks of families of forms, but the pinned theorem bounds one form evaluated on finite families of functions.

**Witness:** Take `K = ∅`, `C = −1`, `ι = Fin 1`. Then `C(K, 𝕜) = 0`, so the hypothesis reads `0 ≤ 0` and holds, but the conclusion `0 ≤ −16` fails. The pinned theorem (`Topology/ContinuousMap/Grothendieck.lean:157,169`) assumes `hC : 0 ≤ C`.

**Repair:**
- At `:1759`, write "with `0 ≤ C` and `‖B(f, g)‖ ≤ C ‖f‖ ‖g‖`".
- At `:91–92`, write "for one bilinear form on `C(K, 𝕜) × C(L, 𝕜)` evaluated on finite families with square functions at most one".
- Tested at `K = ∅`: with `C ≥ 0`, the conclusion `0 ≤ 16 C` holds.

## R03 (P3) — Garling–Gordon still has no exact locator

**Location:**
- `README.md:1860`: "is the kernel of a projection of norm at most `√n + ε` (Garling–Gordon 1971)".
- References (`:2000–2001`) give only the paper's page range, and `Suggested.lean:265` repeats "(Garling–Gordon 1971)".

**Claim:** The theorem has no theorem number or page. This is the part of the previous R06 that is not repaired.

**Witness:** SNumbers on main locates the same theorem as Pietsch, *Eigenvalues and s-Numbers*, 1987, 1.7.17 (`TauCetiRoadmap/SNumbers/README.md:629`). No file in this folder names a theorem of Garling–Gordon or of Pietsch.

**Repair:**
- Write "(Garling–Gordon 1971; Pietsch, *Eigenvalues and s-Numbers*, 1987, 1.7.17)" at `:1860`, at `:1894` and in the docstring of `garling_gordon`.
- Add Pietsch's book with that locator to References.

## Previous findings

- R01 — repaired: `:1854–1855` "extend the contact functionals `⟨u_i, ·⟩`, which are `𝕜`-linear"; `:1869` "`Σ c_i |⟨u_i, x⟩|² = ‖x‖²`"; the new Check at `:1887–1890` uses `u₁ = i`.
- R02 — repaired (D01): commit `7c577f0` restores `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` to main. The diff outside the three folders is empty.
- R03 — repaired: Layer 6 contract `:323–326`; §6.2 `:1758` "The compact-space form for finite families is pinned as well"; *Needs:* `:1785–1786`. The restatement of the pinned theorem drops `0 ≤ C` (R02).
- R04 — repaired: `:801` "Run this route for real `X`", with the pinned RMK at `:804–807` and the complex reduction at `:815–819`. §5.4 is gone from `:382`, `:922` and `:1181–1184`. The RMK attribution is R01.
- R05 — repaired: `:1029–1030` "Theorem 6 and Theorem 7 (Matching Lemma), p. 7, Corollary 9, p. 10, and Lemmas 10–11, pp. 11–12", also at `:1172` and `:2016`; `:526` "Theorems 4–5 (pp. 138–139)".
- R06 — partly repaired: §1.4 (`:490`), §4.1 (`:653`), §4.2 (`:671`, `:673`, `:691`) and §4.3 (`:717`, `:719`, `:729–730`) are now located. §7.2 keeps "(Garling–Gordon 1971)" at `:1860` (R03).
- R07 — repaired: `:1976–1977` "SelfAdjointSpectralTheory consumes §5.4's `M(K)` and its Riesz isometry with `C(K)*`; the Goldstine theorem and the scalar-measure layer it also uses are Tau Ceti's."
- R08 — repaired: the summary says the scalar-measure layer "now comes from the pinned Tau Ceti". The second bullet states the full rewrite, the 17 removed and 10 added declarations, and both supplier changes.

## Deferred findings

- D01 — resolved: commit `7c577f0` restores both files to main. The worker's gate reports `outside-folder=0`, and `git diff --stat origin/main...HEAD` outside the three folders is empty.

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| §1.4 counterexample and locator | `(t,t²)`; the line `y = mx`; Theorem 1.34 | `f = t⁴/(2t⁴) = ½`; `mx/(x²+m²) → 0`; vanneerven22 line 1343, printed p. 18 (line 1324) | holds | none |
| `james`, `surjective_inclusionInDoubleDual_iff_forall_exists_norm_apply_eq` (page) | Hilbert ball with `f ≠ 0`; James's text | `sup Re f = ‖f‖`, attained at `f/‖f‖`: true / true; Theorem 4 at james64 line 333 (p. 138), Theorem 5 at line 374 (p. 139) | holds | none |
| §4.1 MAP of `Lᵖ[0,1]` | `P_n 1`; `1_[0,1/3)` in `L¹`; Daws's remark | `‖P_n‖ = 1`; `‖P_n f − f‖₁ ≤ 2⁻ⁿ`; daws04 lines 1583–1585 (p. 40): `Lᵖ(μ)` has the MAP | holds | none |
| `hasApproximationProperty_iff_injective_toCompletedInjectiveTensor` | `E = 𝕜`; Daws 2.3.4(3) | `F⊗̂π𝕜 ≅ F ≅ F⊗̂ε𝕜`, identity map, injective: true / true; (3) maps `F⊗̂E` into `B(F′,E)`, which contains `F⊗̂εE` | holds | none |
| §4.2 `E*⊗̂πF → L(E,F)` when `F` has AP | `u = Σ fₙ⊗yₙ` zero on `E` | `Φ ↦ Σ Φ(fₙ)yₙ` is weak*-continuous on `E**` and zero on the dense `J(E)`, so `u = 0` by Daws 2.3.4(3) | holds | none |
| §4.2 Schmidt series | `id` on `ℓ²ₙ`; vanneerven22 Theorem 9.2 | `s = (1,…,1)`, `ν = n`; line 14056, stated for compact `T ∈ L(H,K)`, printed pp. 305–306 | holds | none |
| `exists_complexificationStrongDualEquiv` (locators) | the MST pairing; `E = ℝ` | mst99 line 275 `(φ+iψ)(x+iy) = φx − ψy + i(φy+ψx)`, which is the README's `φ` at `g=φ, h=ψ`; Taylor norm `√(x²+y²)` | holds | none |
| §4.3 Taylor norm and `complexify` | Prop. 3 (line 164, p. 5); Prop. 4 (line 241, pp. 6–7); `L = id` | `‖·‖_T ≤ ‖·‖ ≤ 2‖·‖_T`; `‖L̃‖ = ‖L‖ = 1` | holds | none |
| `hasMetricApproximationProperty_of_surjective_inclusionInDoubleDual` (complex step) | `X = ℂ²`, `T z = (z₁, Re z₂)`, `C = {e₁}` | `(T − iTi)/2 = diag(1, ½)`: `ℂ`-linear, norm `1 ≤ ‖T‖`, fixes `e₁`; error `≤ ½(‖Tx−x‖ + ‖T(ix)−ix‖)` | holds | none |
| §4.4 RMK input | `K = {a,b}`, `Λ f = f(a) − 2f(b)` | `μ⁺ = δ_a`, `μ⁻ = 2δ_b`; masses `1 + 2 = 3 = ‖Λ‖` at `h = (1,−1)`; follows from `:188,211`, not `:262` | true but misattributed | R01 |
| `exists_scalarPlusCompact` (DOSZ) | locators | Theorem 6 `C ≤ 8d` (dosz09 line 339, p. 7) matches `8d + ε`; Theorem 7 line 377 (p. 7); Corollary 9 line 503 (p. 10); Lemmas 10–11 lines 557, 580 (pp. 11–12) | holds | none |
| §6.2 pinned compact-space form | `K = L` a point, `B = c·fg`; `K = ∅`, `C = −1` | `|c Σ fᵢgᵢ| ≤ |c| ≤ 16|c|`; empty `K`: hypothesis `0 ≤ 0` holds, conclusion `0 ≤ −16` fails | restatement false at `K = ∅` | R02 |
| §6.2 measure form | `K = L = {a,b}`, `B(f,g) = Σ fg`, `μ = ν` uniform | `‖B‖ = 2`; `|B| = 2|∫fg dμ| ≤ 2‖f‖₂‖g‖₂ ≤ κ‖B‖‖f‖₂‖g‖₂`; pisier12gt line 133 (p. 4) agrees | holds | none |
| `summingENorm_one_le_of_lp_one` | `T f = ∫ f` on `L¹[0,1]` | `π₁(T) = ‖T‖ = 1 ≤ 16` | holds | none |
| §7.2 resolution of the identity | `u₁ = i`, `c₁ = 1`; `ℂ²`, `u = (e₁, ie₂)`, `c = (1,1)` | `|⟨i,1⟩|² = 1 = ‖1‖²`; `|x₁|² + |−ix₂|² = ‖x‖²`, `Σc = 2 = n` | holds | none |
| `kadec_snobar` (complex functionals) | `F = ℂx₀`, `u₁ = i` | `φ̃(x₀) = ⟨i,1⟩ = −i`, so `P x₀ = (−i)(i x₀) = x₀` and `‖P‖ = 1`; the old conjugate-linear `⟨·,i⟩` gives `P x₀ = −x₀` | holds | none |
| `garling_gordon` (new route) | `ℓ¹(ℂ²)`, `M = ℂe₂`, `φ₁ = i`; real `ℓ¹₃`, `M = ℝe₃` | `w₁ = −i`, `x₁ = (−i,0)`, `Py = (y₁,0)`, `ker P = M`, `‖P‖ = 1`; `Py = y₁e₁ + y₂e₂`, `1 ≤ √2 + ε` | holds | R03 (locator) |
| §7.2 bound `Σ cᵢ|φᵢ(q)|² ≤ ‖q‖²` | `q = (1,1) ∈ ℓ¹₂`, contact points `e₁, e₂`, `c = (1,1)` | `2 ≤ 4` | holds | none |

The rows for statements the diff does not touch stand as in the previous review, of `7d06cba`.

- Source locators: 17 read against the cached texts and all match. They are van Neerven 2, Daws 3, Muñoz–Sarantopoulos–Tonge 4 (Props. 3, 4, 7 and the pairing; the two-up scan was mapped to printed pages through its running heads), James 2, DOSZ 5 and Pisier 1.
- Library at the pins, 8 declarations opened: `Topology/ContinuousMap/Grothendieck.lean:157,169` (`[CompactSpace]`, `[NormalSpace]`, `0 ≤ C`) and `MeasureTheory/Integral/RieszMarkovKakutani/Signed.lean:160,188,205,211,262,272`.
- Cross-roadmap citations, 5 resolved:
  - SelfAdjointSpectralTheory at this head: `:87–88`, `:182–184`, `:215`.
  - SNumbers on main: `:106–108`, `:629`. SNumbers consumes the B7 statements, not a pairing convention, so the change to §7.2 breaks nothing there.
- Gate: the worker's run at `7c577f0` passes every check, the build included. A re-run without the folder record flags `outside-folder` only for MorseNovikov and SelfAdjointSpectralTheory, which are this pull request's own folders.
- Dependency check: `depcheck: 206 roadmaps, 1903 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Lean: `Suggested.lean` is unchanged since `7d06cba`. `lake env lean` exits 0 with 24 `declaration uses sorry` warnings and nothing else, so the previous `#check @` comparison and padding probe stand.
- Overlap check: read LocallyConvexDuality, CompactQuantumMetricSpaces, QuantumFoundations and MathematicalStatisticsFoundations (open), and SNumbers, VonNeumannAlgebras and NoncommutativeIntegration (main). The change adds no shared object. BanachSpaceTheory stays the owner of what they consume, and the four dropped anchors are mapped at `:30–43`.
- Pull-request text: the title, the summary and the bullets agree with this head, and "changes only the folders named below" now holds. The generated `merge-order` block still lists ArithmeticDirichletSeries and SymplecticGeometry as shared folders.

## Not verifiable

- `albiackalton06` 8.1.3 (§6.2 measure form): uncertified, with no text in the cache. The statement agrees with pisier12gt lines 130–135.
- `ryan02` Proposition 4.6 (§4.2): uncertified, with no text in the cache. daws04 line 1582 cites it for Proposition 2.3.4.
- `garlinggordon71` and Pietsch, *Eigenvalues and s-Numbers*, 1.7.17 (§7.2): the first is paywalled, and the second has no manifest key or legal open copy.

## Source issues

- none

# Review of GromovWittenTheory (pull request #990 at 46c74e9)

**Verdict:** needs changes

:robot: Independent AI review, incremental: 68 changed lines since eb530a1 (33 insertions, 35 deletions, in README.md and Suggested.lean). Nothing outside the folder changed. The gate passes on an independent rerun. The dependency check reports no problem. `lake env lean` on Suggested.lean exits 0 with no output.

Four of the five previous findings are repaired: the AlmostComplex path, the nodal-domain and Novikov "lacks" claims, the Novikov grading citation, and the Stacks 18.3 aside. The pin finding is not repaired. The branch still pins Tau Ceti `a91d3aa`, and the roadmap now depends on that commit more heavily: Layer 0's coefficient ring comes only from `TauCeti.NovikovSeries`, which `a91d3aa` lacks.

One new problem comes from the repair text. The new Tau Ceti bullet says Tau Ceti has no completed state module over the Novikov ring. At the commit the bullet names, `TauCeti.NovikovModule` is that module. Both findings are P3.

## R01 (P3) — The README and docstring read Tau Ceti at 2fd255d, but the branch still pins a91d3aa

This is the previous R01, not repaired.

**Location:**
- `TauCetiRoadmap/GromovWittenTheory/README.md:66`: “### From Tau Ceti (commit 2fd255d)”.
- `README.md:163`: “Define `Λ_ω = TauCeti.NovikovSeries ℚ H₂(X; ℤ) ω`”.
- `Suggested.lean:31–32`: “The pinned Tau Ceti has the compact nodal domain as the gluing quotient `GluedCurve`”.
- `Suggested.lean:39–40`: “the Novikov ring, which the pinned Tau Ceti has as `TauCeti.NovikovSeries ℚ H N`”.
- `lake-manifest.json:8`.

**Claim:** The branch's `lake-manifest.json` still pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`. That is the revision the gate's targeted build, `lake env lean` and this review's pinned checkout all read.

At `a91d3aa`, Tau Ceti has no `RingTheory/NovikovSeries/`, no `RingTheory/NovikovModule/`, no `AlgebraicGeometry/Curves/NodalGluing/` and no `AlmostComplex/` directory. So the docstring's two "the pinned Tau Ceti has" sentences are false at the branch pin.

This round also deleted the MorseNovikov N1 contract. As a result, `README.md:163` and the *Needs:* lines at 177, 194, 203 and 638 consume a Tau Ceti declaration that exists only at `2fd255d`. Those lines are correct once the branch carries main's pin.

**Witness:** `lake-manifest.json:8` has rev `a91d3aafa8cd…`. origin/main's manifest (line 10) has `2fd255d997f4…`, set by main's `a891cd19` after the merge base `4b002f62`. `grep -rl 'NovikovSeries\|GluedCurve'` over the pinned Tau Ceti checkout finds no file.

**Repair:** The pull request's branch takes origin/main, by a merge or a rebase. The manifest then pins Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b` and toolchain `v4.36.0-rc2`.
- No line in the folder changes for this finding.
- Rerun the targeted build afterwards. Suggested.lean declares nothing, so only the toolchain changes.
- This is the worker's rebase step. A repair job cannot edit the manifest.

## R02 (P3) — At 2fd255d, Tau Ceti has the completed state module that README line 74 and the docstring call missing

**Location:**
- `TauCetiRoadmap/GromovWittenTheory/README.md:74`: “Tau Ceti has no completed tensor product `V ⊗̂ Λ_ω` and no completed graded module over it.”
- `README.md:36`: “Tau Ceti states no completed tensor product over it”.
- `README.md:15`: the roadmap “owns … the completed state module `V ⊗̂ Λ_ω` with its support filtration and Chern grading”.
- `Suggested.lean:41` (“what it lacks are … the completed state module of §0.2”) and `Suggested.lean:48`.

**Claim:** At the named commit, `TauCeti.NovikovModule R F` is a completed module over `NovikovSeries`. It consists of the coefficient functions `S → R` that are finite above every threshold of a potential `F`.

Instantiate it at:
- `S = Σ (b : B), H₂(X; ℤ)`, for a finite homogeneous basis `B` of `V`;
- `F⟨b, A⟩ = −ω(A)`;
- degree `d⟨b, A⟩ = deg b + 2c₁(A)`.

This is §0.2's `V ⊗̂ Λ_ω` in basis coordinates. The library then already provides the following §0.2 targets:
- **The support filtration:** `potentialFiltration` and `isClosed_potentialFiltration` (Topology.lean:108, 240), with separated and complete instances (lines 265, 321).
- **The isomorphism with `V ⊗ Λ_ω`:** `coordinatesLinearEquiv` and `basis` (Basic.lean:303, 332). These say it is a finite free `Λ_ω`-module on `B`.
- **The Cauchy product:**
  - It is `kernelProduct` (Bilinear.lean:194) for the kernel `[C = A + A′]` at `(⟨b,A⟩, ⟨b′,A′⟩, ⟨(b,b′),C⟩)`, with potential bound 0.
  - It is `Λ_ω`-bilinear by `novikovKernelProduct` (line 703).
  - It is jointly continuous by `continuous_kernelProduct` (Topology.lean:527).
- **The homogeneous pieces:** `NovikovModule.gradeBy` (Grading.lean:55).
- **API bullet 1's scalar action `Λ_ω^D × (V ⊗̂ Λ_ω)^E → (V ⊗̂ Λ_ω)^(D+E)`:** `smul_mem_gradeBy` (line 143).
- **The `V = ℚ` case:** `mem_gradeBy_iff_coordinates` (line 123).
- **The degree additivity of the Cauchy product:** `kernelProduct_mem_gradeBy` (line 209) with `ε = 0`.

What exists at the commit the contract names is cited, not restated.

**Witness:** Tau Ceti `2fd255d`, `TauCeti/RingTheory/NovikovModule/Basic.lean:53` has `def NovikovModule (F : S → ℝ) : Submodule R (S → R)`, and line 227 has `coordinates … ≃ₗ[R] (ι → NovikovSeries R H N)` for `[Finite ι]`. TensorProduct.lean:86 and 208 give `externalProduct` and `lift_unique`, “the universal property of a completed tensor product”.

**Repair:**
1. Add a Tau Ceti contract bullet. It names `TauCeti.NovikovModule`, `NovikovModule.coordinatesLinearEquiv` and `NovikovModule.basis` (Basic.lean), and `potentialFiltration` with its complete topology (Topology.lean). It also names `NovikovModule.gradeBy`, `smul_mem_gradeBy`, `mem_gradeBy_iff_coordinates` and `kernelProduct_mem_gradeBy` (Grading.lean), and `kernelProduct`, `novikovKernelProduct` (Bilinear.lean) and `continuous_kernelProduct`.
2. Delete the sentence at line 74 and the clause at line 36.
3. Change §0.2 in one of two ways:
   - define `V ⊗̂ Λ_ω` as that `NovikovModule`; or
   - keep the basis-free functions `H₂ → V` and make the target their identification with it, independent of `B`.
4. Cite the library, instead of proving them, for the isomorphism, the filtration, the Cauchy product and the two degree statements.
5. Keep as targets only what is missing at the commit:
   - the independence and closedness of the pieces `NovikovModule.gradeBy` (Grading.lean has neither `iSupIndep` nor `IsClosed` for them);
   - the convergent homogeneous decomposition;
   - the perfect pairing;
   - the criterion `c₁ = 0` for internal grading.
6. Suggested.lean:41 should read “what it lacks are the Gromov–Witten classes of the first item”. Line 48 should say that the completed state module is Tau Ceti's `TauCeti.NovikovModule`, and that its closed homogeneous pieces and their convergent decomposition are README targets of Layer 0.
7. Line 15 should own the specialization of `TauCeti.NovikovModule` to `H^*(X; ℚ)` with its Chern grading, not the module itself.

**Tested on `X = S²`:** take `B = {1, x}` with degrees 0 and 2, so `d⟨1,k⟩ = 4k` and `d⟨x,k⟩ = 2 + 4k`.
- `NovikovModule.gradeBy d 4` is `ℚ·(q·1)`.
- §0.2's `(V ⊗̂ Λ_ω)^4 = {A ↦ v_A ∈ V^(4−4A)}` is also `ℚ·(q·1)`.
- The Cauchy-product kernel satisfies the bound `F₀ ≤ F₁ + F₂ + 0` with equality, and the degree shift is `ε = 0`.

## Previous findings

- R01 — not repaired: `lake-manifest.json:8` still pins Tau Ceti `a91d3aa`. README line 66 names `2fd255d`, and Suggested.lean:31–40 says “the pinned Tau Ceti has” `GluedCurve` and `TauCeti.NovikovSeries`, neither of which is at `a91d3aa` (R01 above).
- R02 — repaired: README line 68 reads “`SmoothAlmostComplexStructure` (TauCeti/Geometry/Symplectic/Manifold/AlmostComplex/Basic.lean)”. At `2fd255d`: structure line 71, `neg` 171, `const` 208, `product` 276.
- R03 — repaired: README line 68 reads “The compact nodal domain is at the pin as the gluing quotient `GluedCurve` of `FlagPairData`”. Suggested.lean:39–41 cites `TauCeti.NovikovSeries`. Both are true at `2fd255d` (false at the branch pin: R01).
- R04 — repaired: line 74 adds the `TauCeti.NovikovSeries` bullet. §0.2 defines `Λ_ω^D = NovikovSeries.gradeBy ℚ ω (2c₁) D` and cites `gradeBy.gradedMonoid` and `iSupIndep_gradeBy`. Its new sentence about completed modules is R02 above.
- R05 — repaired: line 774 reads “its kernel `𝒢` vanishes when `X` is reduced and `f` is an isomorphism over a dense open, but not for every reduced `X`”.

## Verified sound

**Gate and build.** Independent rerun of the full gate at `46c74e9d53e8d80cfbc781cb01cf39ca3d77a8d4`: every check 0, `OK`, exit 0. The dependency check with `--movable` against the board's merge order and main content gave:

```text
depcheck: 244 roadmaps, 2462 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. GromovWittenTheory is at merge-order line 307, after ImplicitAtlases (217) and AnalyticStableMaps (218).

`git diff --stat origin/main...HEAD` outside the folder is empty, and the folder holds README.md, Suggested.lean and metadata.toml. `lake env lean` on Suggested.lean exits 0 with no output (22 s).

Suggested.lean is `import Mathlib`, one module docstring and the namespace, with no declaration. Only docstring lines 20–50 changed. So the `#check` signature comparison and the one-tactic padding probe have no subjects. It has no sorry'd data and no `set_option`.

**Headline theorems** (docstring items 1–4): the Kontsevich–Manin properties of `I_(g,n,A)`; `I_(1,1,0)(1) = χ(X)·1`; the unital CohFT over `Λ_ω` and the associative quantum product; the string, dilaton and divisor equations and genus-zero TRR. None is statable at `a91d3aa` or at `2fd255d`. A grep at `2fd255d` (Tau Ceti and Mathlib `1b1ccf4b`) finds no Chern-class, stable-curve-moduli or implicit-atlas definition, so the docstring's reasons hold at both revisions.

**Tau Ceti names of the changed lines, opened at `2fd255d` (main's pin): 33 declarations.**

| File (TauCeti/…) | Declarations and lines |
|---|---|
| RingTheory/NovikovSeries/Basic.lean | `structure NovikovSeries` 92 (support `{h ∣ coeff h ≠ 0 ∧ N h < C}` finite; `N : H →+ ℝ`); `ext` 109; `finite_setOf_add_eq` 219; `ofFinsupp` 406; `single` 448; `ofFinsupp_surjective_iff` 697 (`[Nontrivial R]`) |
| NovikovSeries/Multiplication.lean | `instCommRing` 435; `isUnit_single` 476 (`[Semiring R]`, `IsUnit r`); `instAlgebra` 489; `ofAddMonoidAlgebra` 519 (`toFun x := ofFinsupp x.coeff`); `ofAddMonoidAlgebra_injective` 547 |
| NovikovSeries/Topology.lean, TopologicalRing.lean | `periodFiltration` 93; `T2Space` 231; `CompleteSpace` 263; `nonnegSubring` 245; `posIdeal` 277 |
| NovikovSeries/ExpLog.lean, Functoriality.lean, LaurentSeries.lean | `expMulEquiv` 70 (`[Algebra ℚ K]`); `mapRingHom` 184 (`∃ c > 0, N' (φ h) = c * N h`); `toLaurentSeries` 77 (`H = ℤ`, `N = Int.castAddHom ℝ`) |
| NovikovSeries/Grading.lean | `gradeBy` 92; `single_mem_gradeBy` 101; `gradeBy_eq_bot` 106; `gradeBy_eq_top` 111; `iSupIndep_gradeBy` 115; `eq_single_of_mem_gradeBy` 153 (injective `f`); `gradeBy.gradedMonoid` 165 (`f : H →+ ι`) |
| AlgebraicGeometry/Curves/NodalGluing/Basic.lean | `FlagPairData` 149; `GluedCurve` 477; `t2Space_gluedCurve` 692 (`[T2Space (X i)]`, `[Finite Flag]`); compactness by instance from `[Finite ι]` and compact components (docstring 43–45) |
| Geometry/Symplectic/Manifold/AlmostComplex/Basic.lean | `SmoothAlmostComplexStructure` 71; `neg` 171; `const` 208; `product` 276 |

Every name and hypothesis in README lines 68 and 74 matches. One wording point needs no change: §0.2 credits “onto iff `ω = 0`” to `ofFinsupp_surjective_iff` while naming `ofAddMonoidAlgebra`. These agree, because `ofAddMonoidAlgebra` is `ofFinsupp ∘ coeff` (Multiplication.lean:520).

**Cross-roadmap citations of the changed lines, resolved: 5.**
- ComplexCurveModuli D1 (main, heading line 53, `GluedCurve` contract line 71).
- AnalyticStableMaps §1.1 at its open head (lines 220–235, `GluedCurve.lift`).
- MorseNovikov N1 (main line 176, “Layers 1–7 retain the names N1–N7”; Layer 1 line 184). The README no longer cites MorseNovikov anywhere else; line 36 only says what N1 plans.
- CharacteristicClasses C3 (main line 1000).
- DifferentialGeometry Layer 8 (line 203, unchanged). Its #886 head is still `a565de62` and DeRhamCohomologyAndDuality's head is still `1b57dbe0`, at merge-order line 395. As in the previous review, that is #886's ownership gap and is not raised here.

**Overlaps.** `scratch/overlaps.md` lists no other pull request changing this roadmap and no id that only an open revision defines. Its one dropped-id lead is the DifferentialGeometry Layer 8 item above.

**Source at the changed locator.** stacks-curves lines 1677–1688 give Lemma 18.3, Tag 0CE3, printed p. 38:
- the hypotheses: `X` proper of dimension ≤ 1, and `f : Y → X` finite and a closed immersion over a dense open;
- the four-term sequence `0 → 𝒢 → 𝒪_X → f_*𝒪_Y → 𝓕 → 0`.

Lines 1696–1700 (Lemma 18.4, p. 39) say that for reduced `X` and `f` an isomorphism over a dense open, `𝒪_X → f_*𝒪_X′` is injective. Line 774 now matches both.

**Adversarial computations on the changed statements.** Coefficients are ℚ.

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| §0.2 `Λ_ω = NovikovSeries ℚ H₂ ω` (lines 74, 163) | `S²` with area 1; Enriques torsion class `τ`; `X` a point | `S²`: `H = ℤ`, `N = Int.castAddHom ℝ`, and `toLaurentSeries` gives `ℚ((q))`. Enriques: `(q^τ − 1)(q^τ + 1) = q^(2τ) − 1 = 0` with both factors `≠ 0`. Point: `H₂ = 0`, `Λ = ℚ`. | Not a domain in general, as stated. Correct. |
| “onto exactly when `ω = 0`” (line 163) | `S²`; point | `S²`: `N ≠ 0`, and `Σ_(k≥0) q^k` has infinite support, so not onto. Point: `N = 0`, onto. | Correct. |
| `q^A` unit with inverse `q^(−A)` (`isUnit_single`) | `H₂ = ℤ`; the monoid `ℕ` | In `ℤ`: `q^A·q^(−A) = q^0 = 1`. In `ℕ`: `q` has no inverse. | The group hypothesis is needed and stated (line 74). |
| `Λ_ω^D = gradeBy ℚ ω (2c₁) D` and Check line 172 | `S²` (`f = 4·`); `ℂP²` (`f = 6·`); K3 (`f = 0`) | `S²`: `D = 6` gives `⊥` (`6 ∉ 4ℤ`, `gradeBy_eq_bot`); `D = 8` gives `a q²` (`eq_single_of_mem_gradeBy`); Check: `0` if `4 ∤ D`, `a q^(D/4)` if `4 ∣ D`. `ℂP²`: `deg q^(2ℓ) = 12 = 6 + 6` (graded monoid). K3: `gradeBy 0 = ⊤`. | Correct. |
| `1 ∈ Λ_ω^0`, `Λ^D·Λ^E ⊆ Λ^(D+E)`, independence ⇒ `⊕_D Λ^D` graded ring | `2c₁ : H₂ →+ ℤ`; `S²` | `1 = single 0 1` and `2c₁(0) = 0`. `iSupIndep_gradeBy` holds for any `f`. On `S²`, `Σ q^k` has components in degrees `0, 4, 8, …`, so it is not in `⊕`. | Correct. |
| Tau Ceti “no completed tensor product / graded module” (lines 36, 74; Suggested.lean:41, 48) | `S²`, `B = {1, x}`, `S = Σ (b : B), ℤ`, `F⟨b,k⟩ = −k` | `NovikovModule.gradeBy d 4 = ℚ·(q·1)` and §0.2's `(V ⊗̂ Λ)^4 = ℚ·(q·1)`. Cauchy kernel: `F₀ = F₁ + F₂` (bound 0), `d₀ = d₁ + d₂` (`ε = 0`). | False at `2fd255d`: R02. |
| §0.3 convolution finiteness `finite_setOf_add_eq` (lines 181, 194) | `a = b = Σ_(k≥0) q^k` on `ℤ`, `h = 5` | The pairs `(u, v)` with `u + v = 5` and both coefficients nonzero are `(0,5), …, (5,0)`: 6 pairs, a finite set. Nothing about realization by curves is inferred. | Correct. |
| Docstring “the pinned Tau Ceti has `GluedCurve` / `NovikovSeries`” (Suggested.lean:31, 39) | `a91d3aa`; `2fd255d` | `a91d3aa`: 0 files mention either. `2fd255d`: NodalGluing/Basic.lean:477 and NovikovSeries/Basic.lean:92. | R01. |
| Stacks 18.3 aside (line 774) | `L₁ ⊂ L₁ ∪ L₂`; nodal cubic and its normalization | First case: `X` is reduced and `f` is a closed immersion over `U = X`, but `𝒢 = I_(L₁) ≠ 0`. Second case: `f` is an isomorphism off the node, and `𝒢 = 0`. | Now as stated. Correct. |

**Carried forward from the previous report** (r6 at `eb530a1`, for statements the diff leaves untouched, with the values computed there):
- **§3.2, Lemma 18.4:** `h¹ = 1, 0, 1, 1` on the nodal cubic, two `ℙ¹` meeting once, two `ℙ¹` meeting twice, and an elliptic curve with a rational tail. The double line has kernel `(ε) ≠ 0`.
- **§1.2, Pardon 9.2.10/9.3.1:** stable range `(0,3), (1,1), (1,0), (0,2)` gives true, true, false, false on both sides.

The r6 report carries the r5 rows:
- **§2.2:** `c = 1` vs unweighted `1/2`; `Ȟ²(S²) = ℚ`; `(0,3)` gives `1`; `Δ^*(a ⊠ a) = 0` on `S¹`.
- **ImplicitAtlases §6.5:** `S¹ × S¹` gives `ℚ²`; the Warsaw circle gives `Ȟ¹ = ℚ`.
- **§8.2:** `∫^wt ψ₁ = 1/24`.
- **§0.1/§0.3:** a degree-`d` line has area `d`.

It also carries the r3/r4 rows:
- **0.1:** areas `1, −1, 0`.
- **0.3:** `4` classes.
- **1.1:** `2g−2+n = 1, 1, 0, 0`.
- **1.2:** dimensions `0`, `10`.
- **2.1:** `1/2` vs `1`.
- **2.2:** `s = d = 10` gives `1`.
- **2.3:** classes `1, 2`.
- **3.1:** character `−1`.
- **3.3:** `r = 0`.
- **3.4:** `−1/24`; `λ² = 0`.
- **4.1:** torsion `0`.
- **4.2:** `+1`.
- **4.3:** `s − 2m`.
- **5.1:** `π_*ev^*H = 1`.
- **5.2:** `8 ≠ 10` gives `0`.
- **5.3:** `A = 0` gives `0`.
- **5.4:** `1, 0, 1`.
- **6.1:** `−1`.
- **6.2:** `1 = 1·1 + 0`.
- **6.3:** `2 = 2`.
- **6.4:** `ξ_*1 = 2τ_D`.
- **6.5:** `12 = 12`.
- **6.6:** `3 > 2`.
- **7.1:** unit only at `A = 0`.
- **7.2:** `H⋆H² = q`, `H²⋆H² = qH`.
- **8.1:** `1` vs `3`.
- **8.3:** `1, 1, 1/24`.
- **8.4:** `1/24 = 1·1/24`.
- **8.5:** `[D₁]` gives `1`.
- **8.6:** `⟨τ₁(pt) pt 1⟩ = 1`.

Of the seeded sample, only §7.1 cites a changed passage (§0.2). Its use of “the closed homogeneous pieces of total degree” and of their filtered completion stays a §0.2 target after R02's repair, because closedness is not in Tau Ceti's Grading.lean.

## Not verifiable

- The construction targets without a primary source are unchanged from the previous review: §1.2, §2.1, §3.2, §6.5, and the analytic versions of §§8.2, 8.4–8.6. The sampled instances are consistency tests, not proofs.
- Ownership was not checked against open pull requests whose files the brief does not supply. The diff introduces no object beyond the Novikov module of R02, which is Tau Ceti's.
- The folder has no `sources.toml`, and this review edits no manifest. The one cited text read here (stacks-curves) is in the cache, so `needs-references.toml` was not needed.

## Source issues

- none

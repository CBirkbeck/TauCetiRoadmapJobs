# Review of DerivedModuleAlgebra (pull request #1701 at ee318e5)

**Verdict:** needs changes

This is an incremental re-review of the 8 lines changed since 1c30cbf. All of them are README:972–976, in the §S.1 proof sketch. "README" means `TauCetiRoadmap/DerivedModuleAlgebra/README.md`. "Lean" means `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean`, which is byte-identical to 1c30cbf and to b4d058a.

The folder itself has no defect. The changed sentence is correct, and it now names the hypothesis that the conclusion actually needs (negative control below). The one remaining finding is outside the folder: the pull-request description, carried from r20. Fixing it means editing the description on GitHub.

## R01 (P3) — The pull-request description still describes a README-only amendment

This is r20's R01, earlier raised as r19's R02, r18's R04, r17's R01, r16's R01 and r15's R03. It is not repaired. No repair report marks it as not actionable: the board's reports directory for this package holds only review reports, and commit ee318e5 touches only README.

**Location.** The pull-request description (data), unchanged at this head:

- **Summary:** "README only; `Suggested.lean` is unchanged".
- **What this roadmap builds:** "Roby representability (`PD.robyRepresentability`)".
- **Why Tau Ceti wants it:** "Thirteen roadmaps consume it".
- **Title:** "cite the affine-crystalline formalisation at the divided power targets".

**Claim.** The human approval is given on the description, and the first three statements are false at this head. The title describes only the original amendment.

**Witness.**

- `git diff --numstat origin/main...HEAD` gives `492 1230` for Lean.
- `robyRepresentability` occurs nowhere in the folder or in the Tau Ceti pin `2fd255d`. Roby's theorem there is `DividedPowerAlgebra.homogeneousLawEquiv` (`TauCeti/RingTheory/DividedPowerAlgebra/Representability.lean`:440).
- README:2701–2706 names eighteen consumers.

**Repair.** Edit the description on GitHub:

1. End **Summary** with: "The head also replaces main's `Suggested.lean` with the roadmap's headline theorems and the few definitions they need."
2. Replace `PD.robyRepresentability` with `DividedPowerAlgebra.homogeneousLawEquiv`.
3. Replace "Thirteen" with "Eighteen".
4. If the title is kept, append "and state the headline theorems in Suggested.lean".

If the repair round cannot edit pull-request descriptions, its repair report should mark this finding `not actionable in this package` and say why. That settles it.

**Test.** After the edit, the three statements agree with the numstat, the pinned declaration at line 440, and README:2701–2706.

## Previous findings

- R01 — not repaired: the description still reads "README only; `Suggested.lean` is unchanged". It still cites `PD.robyRepresentability` and still says "Thirteen roadmaps consume it". Raised again as R01.

## Verified sound

### Gate, dependency check, elaboration, padding

- **Gate.** My run at this head (`gate … --base origin/main`) exits 0. Every counter is 0, followed by `OK`: `set_option`, `blob`, `latex`, `tex`, `prnum`, `sorry-data`, `sorry-examples`, `residue`, `private-paths`, `imports`, `mathlib-subimports`, `no-import-mathlib`, `lean-lines`, `statement-hygiene`, `forbidden`, `dropped`, `readme-ids-missing`, `empty-sections`, `round-labels`, `long-fences`, `layer-ids`, `target-ids`, `depcheck`, `metadata`, `stray-files`, `dirty`, `outside-folder` and `source-material`. The worker's record for this head adds `build=0`.
- **Dependency check.** Output, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 239 roadmaps, 2337 edges, 0 problem(s)
```

- **Files changed.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DerivedModuleAlgebra'` is empty. `git diff --stat 1c30cbf HEAD` shows only README changed, with 5 insertions and 3 deletions.
- **Elaboration.** `lake env lean` on Lean exits 0 with exactly 29 "declaration uses `sorry`" warnings and nothing else. `signatures.md` lists 39 declarations, none with a dropped section binder. Since Lean is unchanged, r18's 39-signature comparison against README still holds.
- **Padding probe.** I re-ran it this round on a scratch copy, replacing every `sorry` with `first | rfl | simp | infer_instance | trivial | decide`. All 29 theorems fail: 29 errors on 29 distinct lines, and none closes.

### The changed passage (README:971–976)

The new text derives the edge terms in four steps:

1. The double complex is first-quadrant, so `E_r^{pq} = 0` outside `p, q ≥ 0`.
2. `d_r` has bidegree `(r, 1 − r)`, so for `r ≥ 2` no differential enters `E_r^{0,n}` or leaves `E_r^{n,0}`.
3. Hence `E_∞^{0,n} ⊆ E₂^{0,n}`, and `E_∞^{n,0}` is a quotient of `E₂^{n,0}`.
4. Separately, `F⁰Hⁿ = Hⁿ` and `Fⁿ⁺¹Hⁿ = 0` give `Hⁿ/F¹Hⁿ = E_∞^{0,n}` and `FⁿHⁿ = E_∞^{n,0}`.

Each step checks against the section's own conventions:

- **Filtration.** `FᵖTotⁿ = ⊕_{i≥p} A^{i,n−i}` (README:888), so `F⁰Totⁿ = Totⁿ` and `Fⁿ⁺¹Totⁿ` has only terms with `q < 0`.
- **Differentials.** A differential into `(0,n)` starts at `p = −r < 0`. One out of `(n,0)` lands at `q = 1 − r < 0`.
- **Stabilization.** The pages stabilise at `r > n + 1` and `r > max(n, 1)` respectively (README:895), so the chains of subobjects and quotients are finite.
- **Graded pieces.** Applying `E_∞^{pq} ≅ FᵖH^{p+q}/F^{p+1}H^{p+q}` (README:896) at `(0,n)` and `(n,0)` gives the two stated identities.

The sentence fixes the attribution that r20 recorded as a remark, and the fix changes the mathematics, not only the wording. The negative control in the table below satisfies all three of the old premises: `F⁰H¹ = H¹`, `F²H¹ = 0`, and bidegree `(r, 1 − r)`. Yet `E_∞^{0,1}` is not a subobject of `E₂^{0,1}`. Only the first-quadrant hypothesis that the new text invokes excludes this.

The convergence that the adjacent sentence relies on is at the locators README:969–970 gives:

- StacksHom Lemma 25.1 (Tag 0130), line 3258, p.67: the `E₂` identification.
- Lemma 25.3 (0132), line 3284, p.68: boundedness, finite filtrations and convergence for a double complex with finitely many nonzero terms in each total degree, in any abelian category.
- Lemma 25.4 (0133), line 3293, p.68, with its proof running to p.69: the exact-augmentation comparison.

The page span pp.67–69 is correct.

The changed text has no dependents beyond its own section:

- §0.2.2 (README:1103) and §0.9 (README:1445) consume only "homological spectral sequence, convergence and abutment filtration". Those are untouched.
- The dropped-name row README:61 (`DoubleComplex.edgeBottom`, `edgeLeft`) still points at §S.1, which states the edge morphisms at README:896 and :937–938.
- No sampled target falls in or depends on the changed lines. The seeded-sample locators were verified in r18–r20 and nothing they cite has changed.

### Ownership, overlaps

- The diff adds no object, name or citation, so r18's ownership audit (main and all open heads) and its headline list still hold.
- `overlaps.md`: no other open pull request changes this roadmap, and no cited id is dropped by, or defined only in, an open revision.
- Of the ids this pull request drops, §1.T.1 and the anchor `#1t1-towers-lim-and-lim¹` cited by StableHomotopyKTheory #1227:86 still have their old → new mapping at README:34–36.

### Adversarial table

The first five rows were computed this round for the changed sentence. The remaining rows are carried forward from r20 (`PRREVIEW-DerivedModuleAlgebra~20`), which carries r19's and r18's rows. The diff leaves all of those statements untouched.

| Statement | Instances | Values on each side; wrong model excluded | Result | Change |
| --- | --- | --- | --- | --- |
| README:972–974: `E_∞^{0,n} ⊆ E₂^{0,n}`, `E_∞^{n,0}` a quotient of `E₂^{n,0}` | the four-generator Check (README:1012–1017) | `E₂^{0,1} = E₂^{2,0} = R`, `d₂[a] = [−e]` is an isomorphism. `E_∞^{0,1} = ker d₂ = 0 ⊆ R`, and `E_∞^{2,0} = coker d₂ = 0`, a quotient of `R`. Both are consistent with `H¹ = H² = 0` | True | none |
| same, negative control on the hypothesis | non-first-quadrant: `a` at `(−2,2)`, `b` at `(−1,1)`, `c` at `(−1,2)`, `e` at `(0,1)`; `d′a = c`, `d″b = c`, `d′b = 2e`, over `ℤ` | `Tot⁰ = ⟨a,b⟩ → Tot¹ = ⟨c,e⟩` has matrix `[[1,1],[0,2]]`, so `H⁰ = 0` and `H¹ = ℤ/2`. `F⁰H¹ = H¹`, since `e` generates it, and `F²H¹ = 0`. The `E₂` terms are `ℤ` at `(−2,2)` and at `(0,1)`, with `d₂[a] = [−2e]`, so `E_∞^{0,1} = ℤ/2`. `ℤ/2` is not a subobject of `ℤ`. The old premises hold and the conclusion fails; only `p ≥ 0` excludes this example | True (the hypothesis is needed) | none |
| README:975–976: `Hⁿ/F¹Hⁿ = E_∞^{0,n}`, `FⁿHⁿ = E_∞^{n,0}` | single column; single row (Check README:1010–1011) | Column: `F¹Hⁿ = 0`, so `E_∞^{0,n} = Hⁿ = Hⁿ(A^{0•}) = E₂^{0,n}`, and for `n ≥ 1`, `E_∞^{n,0} = 0 = FⁿHⁿ`. Row: `FⁿHⁿ = Hⁿ = Hⁿ(A^{•0}) = E₂^{n,0}`, and for `n ≥ 1`, `Hⁿ/F¹Hⁿ = 0 = E_∞^{0,n}` | True | none |
| same, `n = 0` | any first-quadrant `A` (Check README:1006) | Both statements apply at `(0,0)`: `E_∞^{00} = E₂^{00}`, `F¹H⁰ = 0` and `H⁰ = E₂^{00}`, which agrees with the Check `H⁰(Tot A) = E₂^{00}` | True | none |
| README:973, direction of `d_r` | the four-generator Check; wrong model with homological bidegree `(−r, r−1)` | The Check computes `d₂ : (0,1) → (2,0)`, which is bidegree `(2, −1) = (r, 1 − r)`. Under `(−r, r−1)`, `d₂` would enter `(0,1)` from `(2,0)`, making `E_∞^{0,1}` a quotient. The Check's value rules this out | True | none |
| Row README:49 → §0.4 `.map` (README:1217) | r20: identity square on `ℤ → ℤ/2`; `(ℤ → ℤ/2) → (ℤ/2 → ℤ/2)`; `t ↦ ε` | r20: `id` on `H⁻¹ = ℤ/2`; the map `ℤ/2[1] → 0`; on `H⁰`, `dt ↦ dε` is onto | True | none |
| Row README:49 → §0.4 `.resolutionIso` (README:1222) | r20: constant `P_n = A[t]`; `k[ε]/ε²` | r20: `H₀ = A[t]dt` and `H_{>0} = 0`; the wrong model `Ω[0]` misses `H⁻¹ = εB` | True | none |
| Row README:67 → `mulTower`, §1.1 Check | r20: `p = 2, 3`; Neg. `p = 1, 0` | r20: `lim = 0`, `lim¹ ≅ ℤ_p/ℤ`, `Σ4ᵐ = −1/3 ∉ ℤ`; for `p = 1`, `lim = ℤ` and `lim¹ = 0` | True | none |
| §S.1 five-term sequence (README:977) | r20: four generators; single row `A^{00} = A^{10} = ℤ`, `d′ = 0` | r20: `0 → 0 → 0 → R ≅ R → 0` is exact; `F¹H¹ = E₂^{1,0} = ℤ` | True | none |
| §S.1 extended sequence (README:978–979, statement README:903) | r20: `n = 2`, only `A^{02} = ℤ`; Neg. `n = 0` | r20: `0 → 0 → ℤ → ℤ → 0 → 0` is exact; at `n = 0` the composite `id` is nonzero, so `n ≥ 1` is needed | True | none |
| §§0.10, 0.11, 0.12, 1.1.1 locators and Checks | r20: `ℤ → F_p`; `ℤ[X] → ℤ[X^±]`; `k[ε]/ε²`; `L = ℤ[1/p]` | r20: `Tor₁ = F_p ≠ 0`; `L = 0`; `H⁻¹ ≠ 0`; `H¹ = ℤ_p/ℤ` | True | none |
| `nonempty_bicomplexSecondPageIso` (Lean:120) | r19: single term; four generators | r19: page 3 at `(0,0)` is `ℤ`, at `(−4,2)` it is `R`; the transposed model gives `0` | True | none |
| Row `test_derived_tensor_unbounded_flat` (README:47) | r19: bi-infinite `ℤ/4`, `d = 2` | r19: acyclic, and `⊗F₂` gives `Hⁱ = F₂` for all `i` | True | none |
| `simplicialTensorComparison`, `bisimplicialDiagonalComparison` (Lean:135, 158) | r18: `x ∈ X₁, y ∈ Y₁`; constant `P`; `A[1]` | r18: `d∇ = ∇d`; `H₀ = P`, `H₂ = A`, transposition sign `−1` | True | none |
| `quasiIso_whiskering_of_projective` (Lean:175) | r18 Neg.: `Γ₀[ℤ --2→ ℤ] → ℤ/2`, `V ⊗ V` | r18: source `H₁ = ℤ/2`, target `0` | True | none |
| `exteriorPower_decalage`, `symmetricPower_decalage` (Lean:198, 216) | r18: `F₂`, `n = 2`; `ℤ/2` over `ℤ` | r18: `F₂γ₂`; `Γ²_ℤ(ℤ/2) = ℤ/4`; ranks `1, 1, 0` | True | none |
| `derivedLimit_isTriangulated` (Lean:238) | r18: constant `ℤ[0]`; split Neg. | r18: the shift iso is `id`; the all-ones sequence is not in the image | True | none |
| Derived completeness block (Lean:262–310) | r18: `I = 0, A`; `ℤ[1/p]`; `m ⊂ O_ℂp` | r18: `ℤ[1/p] → ℚ_p ≠ 0`; `m = m²` is excluded by `hI` | True | none |
| `ordinaryQuotientCompletion` and variants (Lean:327–389) | r18: `ℤ, (p)`; `ℤ_p ⋉ ℚ_p/ℤ_p` | r18: `L = ℤ_p[0]`; non-Noetherian `H⁻¹ = ℤ_p`, so `hfin` is needed | True | none |
| `IsCompletelyFlatModule`, §1.8 (Lean:406–456) | r18: `ℤ`, `F_p`, `ℤ/4` | r18: `Tor₁(F_p, F_p) = F_p`; `M/4M = ℤ/2` is not flat | True | none |
| `IsPerfect`, `isPerfect_baseChange` (Lean:479–522) | r18: `eA ⊂ k × k`; `ℤ/2` over `ℤ/4` | r18: Euler ranks `(1,0)`; `Tor_i = F₂` for every `i` | True | none |
| `ringTowerLimit_jacobson`, `pseudoCoherent_residueCriterion` (Lean:537, 550) | r18: `k[t]/tⁿ⁺¹`; `k` over `k[ε]` | r18: `1 + t` is a unit; `hnil` is needed | True | none |
| `biduality_of_finite/_artinian` (Lean:574, 587) | r18: `ℤ_p`, `E = ℚ_p/ℤ_p`; `ℤ_(p)` | r18: `End E = ℤ_p`; `ℤ_(p)` is not complete | True | none |

## Not verifiable

- **NSW, Proposition 2.1.1 and Lemma 2.2.4** (README:965–967, printed pp.99 and 105, untouched). The cached NSW entry holds only the authors' landing page. The StacksHom derivation at README:967–979 covers the abelian-category generality without it.
- **IllusieCC** is uncertified in the manifest, so it is settled.

## Source issues

- none

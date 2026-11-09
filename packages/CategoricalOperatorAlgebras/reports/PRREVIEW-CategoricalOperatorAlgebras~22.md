# Review of CategoricalOperatorAlgebras (pull request #888 at b9c0a6f)

**Verdict:** accepted

This is an incremental re-review of the 44 lines of `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` changed since `91b6d83`. Nothing outside the folder changed, and `Suggested.lean` is unchanged.

- The previous R02 and R03 are repaired, and the repairs introduce no new problem.
- The previous R01 (the CA1a/CA2a ownership claims of the two open QuantumGroups revisions) is not re-raised. The repair report answers it as needing no edit in this folder, and that reason holds at this head; the details are under `## Previous findings`.
- The gate passes, the dependency check prints 0 problems, and `Suggested.lean` elaborates with no diagnostic.

No finding remains.

## Previous findings

- R01 — not repaired in the folder, and settled: lines 40–46 still read "have their single home here; QuantumGroups consumes CA1a and CA2a". The repair report's reason, that no file of this folder is wrong, is correct:
  - QuantumGroups on main (`3090489`), line 42, lists "CategoricalOperatorAlgebras CA1a,CA2a" as its supplier for exactly these objects, so main and this folder name one owner.
  - The competing claims are in two open revisions of that roadmap (#1705 at `f4ad8e4`, lines 33–37; #1649 at `50d79b7`, line 29). A revision of a roadmap on main is never a supplier here, and this roadmap cites QuantumGroups as it is on main.
  - The previous review re-raised the finding because the earlier repair said the order was stated in the pull-request description. This repair report no longer says that. It says the description should name both revisions as later and drop its stale validation text, and that this is for the author. That is accurate: the description at this head still names neither revision. It is not a change to this folder, and the two revisions carry the edit in their own reviews.
- R02 — repaired: lines 774–796, "Neither library carries a right-linear structure across the monoidal opposite, so construct that passage first … construct the bijection between `Functor.RightLinear` structures on F for C and `Functor.LeftLinear` structures on F for `Cᴹᵒᵖ`".
- R03 — repaired: lines 143–145, "coequalizers in which tensoring on either side preserves small colimits (`PreservesColimitsOfSize.{0,0}` for `tensorLeft X` and `tensorRight X`), not only coequalizers"; lines 913–916 and 923 use the same hypothesis.

## Verified sound

### Gate, dependency check, build and folder

- **Gate.** `gate … --base origin/main` at `b9c0a6f` printed `gate CategoricalOperatorAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run adds `build=0`.
- **Dependency check.** `gate --depcheck … --movable --content … --pr 888` printed `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/CategoricalOperatorAlgebras/Suggested.lean` exits 0 with no output. The file declares nothing, so there is no declaration for the `#check @name` comparison or the one-tactic padding probe. The headline list and the docstring's not-statable reasons are unchanged from the previous review, and the diff adds no carrier that makes a headline statable: the new passage is about `Functor.RightLinear` structures with unitary lineators, which still need a dagger.
- **Pins.** Mathlib `1b1ccf4`, Tau Ceti `2fd255d`.
- **Folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.

### The changed passages

**CA2b, the right-linear to left-linear passage (lines 774–796).** A scratch file importing Mathlib and `TauCeti.CategoryTheory.Monoidal.Action.LinearFunctor` was elaborated at the pins.

- The transport the README describes elaborates as written. With `MonoidalLeftAction.monoidalOppositeLeftAction` as the action, a `Functor.LaxLeftLinear Cᴹᵒᵖ` structure on F is built with `μₗ c d := μᵣ F d (unmop c)`, and each of its four laws is closed by the corresponding right-linear law with no rewriting:
  - `μₗ_naturality_left` by `μᵣ_naturality_right`;
  - `μₗ_naturality_right` by `μᵣ_naturality_left`;
  - `μₗ_associativity c c′ d` by `μᵣ_associativity F d (unmop c′) (unmop c)`;
  - `μₗ_unitality` by `μᵣ_unitality`.

  This is the README's claim that the laws of one structure "are those of the other", and it gives the direction of the lineator: `mop c⊙F(d)→F(mop c⊙d)` is `F(d)⊙c→F(d⊙c)`.
- The directions agree with the pin. Mathlib `Action/LinearFunctor.lean:52` has `μₗ : c ⊙ₗ F.obj d ⟶ F.obj (c ⊙ₗ d)`, and `:214` has `μᵣ : F.obj d ⊙ᵣ c ⟶ F.obj (d ⊙ᵣ c)`. `Action/Opposites.lean:70–80` defines the opposite action with `actionAssocIso := αᵣ` and `actionUnitIso := ρᵣ`, so its associator and unitor are the right action's.
- The composite lineator. Tau Ceti `Action/LinearFunctor.lean:66` defines it as `μₗ G c (F.obj d) ≫ G.map (μₗ F c d)`, which in operator order is the README's `G(μ_F)∘μ_G`. `CategoryTheory.Functor.LeftLinear.comp` is at `:153`.
- Module natural transformations. `CategoryTheory.NatTrans.IsLeftLinear` (`:172`) is the single equation `μₗ F₁ c d ≫ τ.app (c ⊙ₗ d) = c ⊴ₗ τ.app d ≫ μₗ F₂ c d`. Under the transport this is commutation with the right lineators, as the README says.
- "Neither library carries a right-linear structure across the monoidal opposite." Mathlib `Action/Opposites.lean` has no occurrence of "Linear". In Tau Ceti the string "RightLinear" occurs only in `mulRightLinearEquiv` and `mulRightLinearMap`, in three unrelated files.
- The *Needs:* line (835–840) and the layer's Dependencies (855–863) name every declaration the new target uses: `Functor.RightLinear`, `MonoidalLeftAction.monoidalOppositeLeftAction`, `CategoryTheory.Functor.LeftLinear.comp`, `CategoryTheory.NatTrans.IsLeftLinear` and `CategoryTheory.ObjectProperty.fullSubcategoryMonoidalLeftAction` (Tau Ceti `Action/FullSubcategory.lean:104`).

**The new Check (lines 826–831).** `(mop c ⊙ₗ d : C) = d ⊗ c` holds by `rfl` for `selfRightAction` in the scratch file. The Check discriminates: a passage through `selfLeftAction` would compare `c⊗d` with `d⊗c`, and in `Hilb(S₃)` with `g=(12)`, `h=(123)` these are `δ_(gh)` and `δ_(hg)` with `gh≠hg`.

**The `Bimod` hypothesis (lines 143–145, 913–916, 923).** `#check` on `Bimod.tensorBimod` and `Bimod.monBicategory` gives `[HasCoequalizers C]`, `[∀ X, PreservesColimitsOfSize.{0,0} (tensorLeft X)]` and `[∀ X, PreservesColimitsOfSize.{0,0} (tensorRight X)]`, which is the hypothesis the README now states. No occurrence of "coequalizers preserved" remains in the folder. The justification for a unitary multitensor category reaches the pinned hypothesis: semisimple gives abelian, hence coequalizers, and rigidity makes each tensoring functor a left adjoint, which preserves all colimits.

### Sources

The diff adds or changes no source locator, so no target of the seeded sample falls in a changed passage. The 15 locators the previous review read stand as recorded there.

### Cross-roadmap citations, overlaps and ownership

- The diff adds no cross-roadmap citation. Subfactors 7.2, cited next to the changed passage, is untouched.
- `overlaps.md` lists no other pull request changing this folder and no dropped or revision-only id. The citation resolver lists nothing missing.
- Ownership of the new passage: `roadmaps grep` was not needed beyond the pins, since the passage is a bridge between two pinned APIs and is stated as a CA2b target; no other roadmap names `Functor.RightLinear`.
- QuantumGroups is not in the merge order file. This roadmap is at position 229 and cites QuantumGroups only as a consumer and for compact quantum groups.

### Adversarial table

Rows for changed statements were computed in this review. The other rows are carried from the previous report (review of `91b6d83`), whose statements the diff does not touch.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| CA2b passage: `RightLinear C` ↔ `LeftLinear Cᴹᵒᵖ` (changed) | general F with right C-actions; associativity at `(mop c, mop c′, d)` | `mop c⊗mop c′=mop(c′⊗c)`; left side `μᵣ d (c′⊗c) ≫ F(αᵣ)`, right side `αᵣ ≫ μᵣ d c′ ⊵ c ≫ μᵣ (d⊙c′) c`: the right-linear law at `(d,c′,c)`. Elaborated: all four laws close by the right-linear ones | sound |
| CA2b passage: identity and composite (changed) | identity functor, `selfRightAction`; F=G=id | `mop c⊙d=d⊗c` by `rfl`; lineator `id_(d⊗c)`; composite `μ_G ≫ G(μ_F)=id ≫ id=id` | sound |
| CA2b Check: wrong passage through the left regular action (changed) | `Hilb(S₃)`, `g=(12)`, `h=(123)`; `Hilb(ℤ/2)` | `δ_g⊗δ_h=δ_(gh)`, `δ_h⊗δ_g=δ_(hg)`, `gh≠hg`: no lineator exists between different simples. In `Hilb(ℤ/2)` the two agree, so the Check needs a nonabelian group, as it says | sound |
| CA2b module natural transformations (changed) | `τ=id` on the identity functor; `τ` between F with lineator `μ` and itself | `μ ≫ τ = (c ⊴ τ) ≫ μ` reads `μ=μ` for `τ=id`; the zero transformation satisfies it in a preadditive M, and unitarity (required at line 794) excludes it | sound |
| `Bimod.tensorBimod`, `Bimod.monBicategory` hypothesis (changed) | (Ab, ⊕); `Hilb_fd` | `A⊕−` sends the empty coproduct 0 to A, so it fails the stated hypothesis, as the pin requires; in `Hilb_fd` tensoring is a left adjoint and preserves all colimits | sound; README and pin agree |
| CA3 range of `p` vs `Bimod.tensorBimod` (text changed in its hypothesis only) | rows ⊗ columns over `M_n`; `Q=1` | quotient `M_n/[M_n,M_n]`, dim 1; `Q=1`: dim `n²` on both sides | sound |
| CA6 twist: HPT (24) equals the pinned `u⁻¹φ` | carried | `w∘u=id_v`, so `θ=u⁻¹φ` | sound (previous report) |
| CA6 Checks: sVec, `Hilb(ℤ)` | carried | `θ_f=−1`; `θ_(δ₁)=4`, `θ_(δ₋₁)=1/4` | sound (previous report) |
| CA2a braided sign law; `ε=ν₂(x)` | carried | Q₈: `(2+2−12)/8=−1`; S₃: `(2+6−2)/6=+1` | sound (previous report) |
| CA2b Penneys Theorem C (headline) | carried | `P_(0,+)=ℂ²`, `P_(0,−)=ℂ`; `det=δ²(δ²−1)`, 2 at δ=√2 | sound (previous report) |
| CA3 normalisations (headline) | carried | `i†i=1`, `mm†=n²` for `Q=M_n(ℂ)` | sound (previous report) |
| CA4 free modules; CP and Stinespring (headline) | carried | `mop A⊗mop c=mop(c⊗A)`; transpose on `M₂` has eigenvalue −1 | sound (previous report) |
| CA5 (headline) | carried | `N⊆N⋊ℤ/2`: `d_Q=2`; `N⊆N⋊ℤ`: not compact | sound (previous report) |
| CA7 Katsura 8.6; weights (headline) | carried | `K₀=ℤ/(n−1)`, `K₁=0`; `a²μ(w)=4=a⁻²μ(v)` at a=2 | sound (previous report) |
| CA8 ordered K₀; Watatani index (headline) | carried | `√2−1≈0.414`; `Ind=(3,3/2)`; N=3, 3, 4, 5 | sound (previous report) |
| CA9 HNP Theorem A; canonical and basic extension; central triviality; Tomatsu Theorem D (headline) | carried | dim 6 on both sides; phase `2^(−i)`; `Ind(E)=25/4`; `λ^(it₀)=−1`; `F·K=K` | sound (previous report) |
| CA10 (headline) | carried | tube dims 4 and 36; `1+1+4+9+9+4+4+4=36` | sound (previous report) |

### Remark on the pull-request description

The description is not part of the folder and is not a finding of this review. For the author: its merge-order paragraph names neither QuantumGroups revision, and its validation paragraph still describes a `Suggested.lean` with "5 admitted-target warnings" that is "byte-exact" to an earlier prototype. The file declares nothing and elaborates with no warning.

## Not verifiable

- **Kosaki 1986, Popa 1995, Izumi 1993.** Recorded as `uncertified` in the manifest and cited by locator; no changed passage cites them.
- **The author's intended order against the two QuantumGroups revisions.** Nothing in the folder or the merge order file states it. Main's QuantumGroups cites this roadmap as supplier, which is the order this review assumed.

## Source issues

- none

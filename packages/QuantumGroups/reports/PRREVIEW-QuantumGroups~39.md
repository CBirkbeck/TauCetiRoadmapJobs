# Review of QuantumGroups (pull request #1705 at 3d02d53)

**Verdict:** accepted

This is an incremental re-review of the 110 lines that changed in the folder since `d3c6f3a`. Two commits are new:

- `9a671ea` merges main (`641f296`). The branch manifest now records main's pins: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`.
- `3d02d53` edits `README.md` (20 lines) and `Suggested.lean` (90 lines).

Line numbers refer to the README unless a file is named.

This head has no findings. The previous R01 is repaired exactly as its recipe asked. The changed passages, the new §8.5 declarations and the five sorried headlines were checked against the pins, with the values below.

## Previous findings

- R01 — repaired: the manifest now records Tau Ceti `2fd255d9`. Both revision paragraphs are gone. `Suggested.lean:207` states `uqSl2_sphericalCategory (q : ℂ) [Fact (q ≠ 0)] (hq : q - q⁻¹ ≠ 0) : TauCeti.SphericalCategory (TauCeti.FiniteHopfModuleCat ℂ (TauCeti.UqSl2 q))`. `git diff 903be55b HEAD` shows only the three re-applications the recipe listed.

## Verified sound

**Gate, order, build.**

- **Gate.** Re-run at `3d02d53`: every counter is 0, `OK`, exit 0. The worker's gate also reports `build=0`.
- **Changes outside the folder.** None. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` and `git diff --stat 641f296a HEAD` outside the folder are both empty. The long list of outside files in `changes.md` is main's own history, brought in by the merge.
- **Main has not moved under the branch.** Main (`08d58bb`) has not touched the folder, `lake-manifest.json` or `lean-toolchain` since `641f296`. `git merge-tree --write-tree HEAD origin/main` exits 0.
- **Dependency check.** The required command, output unmodified. It has no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 233 roadmaps, 2263 edges, 0 problem(s)
```

- **Elaboration.** `lake env lean` on `TauCetiRoadmap/QuantumGroups/Suggested.lean` at the pins: exit 0. There are exactly five warnings, all `declaration uses sorry`, at `:120`, `:152`, `:163`, `:173` and `:207`, one per headline. All seven `TauCeti.*` imports have prebuilt object files at `2fd255d9`.

**Signatures, instances and padding.** Each check below ran in a scratch copy of the file with checks appended.

- **`#check @` on all 9 declarations.** Each elaborated type matches its README statement.
  - The four Layer 3/4 headlines now carry `[TauCeti.StarCoalgebra ℂ A]` where they had `hΔ`. Nothing else in their types changed.
  - `AlgebraicHaar` still drops `[StarModule ℂ A]`. This is harmless, as recorded before: no field uses it, and every headline carries it.
  - The §8.5 declarations carry `[Fact (q ≠ 0)]` and, for the headline, `hq`.
- **The headline uses the new instances.** Under `pp.explicit`, `uqSl2_sphericalCategory`'s type mentions `@uqSl2RigidCategory q inst` and `@uqSl2PivotalCategory q inst`. Two `rfl` examples confirm that instance search returns exactly these two instances on `FiniteHopfModuleCat ℂ (UqSl2 q)`.
- **One-tactic probe on `uqSl2_sphericalCategory`.**
  - `infer_instance` fails. At the pin the only `SphericalCategory` instances are on `Center`, ribbon and symmetric categories (`Center/Pivotal.lean:194`, `Ribbon.lean:89`, `Symmetric.lean`), and none applies.
  - `constructor; intro X f; simp` ends with "simp made no progress".
  - A proof must identify the categorical traces with linear traces, which is the §8.5 target at `:1679`–`:1684`. The headline is therefore not padding.
- **The two instances have real bodies.** They use Tau Ceti's `rigidCategory`, `unitEvalNatIso` and `unitEvalNatIso_isMonoidal`. They are the definitions the headline needs to be statable. No data is sorried.

**The changed passages.** Each was read in full.

- **`:155`.** The revision sentence is removed. The paragraph now cites at the pins like other roadmaps.
- **`:677`–`:678`.** "this class as an instance hypothesis" agrees with `Suggested.lean:121`, `:154`, `:165` and `:175`.
  - Tau Ceti `Algebra/Coalgebra/Star.lean:46`–`:49` makes `StarCoalgebra` a `Prop` class over `[StarAddMonoid A] [StarModule R A] [CoalgebraStruct R A]`.
  - Its single field `comul_star` is the former `hΔ` word for word. It uses the same tensor star from Mathlib `Algebra/Star/TensorProduct`.
- **`:1517`.** "already in the pinned libraries": each cited declaration exists, with the hypotheses the text gives.
  - `TauCeti.IsLocallyFiniteModule.of_finite` is an instance (`RingTheory/Finiteness/LocallyFinite.lean:79`).
  - `isSemisimpleModule_of_finiteDimensional` needs `IsGenericQuantumParameter` (`QuantumGroups/UqSl2/CompleteReducibility.lean:300`), which matches "at generic q".
  - The type-1 iff is at `QuantumGroups/UqSl2/TypeOne.lean:370`, also generic.
  - Mathlib has `IsSemisimpleModule.extension_property` and `lifting_property` (`RingTheory/SimpleModule/Basic.lean:255`, `:261`).
- **`:1627`, `:1686`–`:1688`, `:1699`.** The backticked names `uqSl2RigidCategory`, `uqSl2PivotalCategory` and `uqSl2_sphericalCategory` are declared in `Suggested.lean`. Every one of the 9 Lean names appears in the README.
- **The `Suggested.lean` module docstring.**
  - The "stated here" list now includes §8.5.
  - The Biedenharn–Elliott entry is true at the pin. Recoupling exists only for triple products, `clebschGordanRecouplingEquiv` (`QuantumGroups/UqSl2/ClebschGordan/Recoupling.lean:135`). No "pentagon" or quadruple recoupling occurs under `QuantumGroups/`.
- **The §8.5 docstrings.**
  - `S²(x) = K⁻¹ x K` is `TauCeti.UqSl2.antipode_antipode` (`QuantumGroups/UqSl2/Antipode.lean:59`).
  - `v ↦ (φ ↦ φ(K⁻¹ v))` is `dualEquiv_unitEvalIso_hom_apply` with g = K⁻¹ (`Algebra/Category/FiniteHopfModuleCat/Pivotal.lean`).
  - "right trace tr(K⁻¹f), left trace tr(Kf)" agrees with the definitions in `CategoryTheory/Monoidal/Pivotal/Trace.lean:88`–`:94`; see the table.

**Citations resolved.**

- All 139 distinct backticked `TauCeti.*` names in the README are declared at `2fd255d9`. A scripted search found 138; the remaining one, `TauCeti.UqSl2.counit_k`, is at `QuantumGroups/UqSl2/Hopf.lean:204`, inside `namespace TauCeti.UqSl2`.
- `IsGroupLikeElem` is at Mathlib `RingTheory/Coalgebra/GroupLike.lean:37`.
- `scratch/citations.md` lists nothing missing.

**Description.** Its claims match the head:

- the manifest records `2fd255d9`/`1b1ccf4b`;
- the file has seven Tau Ceti imports;
- there are 139 names;
- the build gives five `sorry` warnings;
- the merge-order block orders #1649 before this pull request, which settles the one conflict in `scratch/overlaps.md`.

`overlaps.md` reports no dropped id and no id defined only by a revision.

**Ownership.** `roadmaps grep` for the three new names, for `FiniteHopfModuleCat ℂ (TauCeti.UqSl2`, and for U_q with "spherical" matches only this pull request, on main and at all 450 open heads. The pin has no spherical or pivotal instance on `FiniteHopfModuleCat`. This roadmap is therefore the single owner of the U_q sphericity statement.

**Seeded sample.** The changed lines fall in two sampled sections.

- **§3.1.** `schur_orthogonality`'s locator, Neshveyev–Tuset Theorem 1.4.2, is at `nt` line 447. That is PDF page 13, printed p.9 (offset +4, as for Theorem 1.7.3 at `nt` line 977, printed p.22). The theorem's part (i) gives both formulas with `ρ = F̃ᵗ` (see the table). Only the form of the hypothesis changed.
- **§8.3.** The changed sentence carries no locator. Its declarations are checked above.
- **§8.5 (not sampled).** Its Needs locators were read:
  - Virelizier Lemma 2.3 (`virelizier` line 265, pp.6–7): evaluation and coevaluation of duals are module maps.
  - Virelizier Proposition 4.1 (`virelizier` line 644, pp.13–14): the Clebsch–Gordan decomposition.
  - The README marks the trace comparisons as the roadmap's own construction. Sphericity follows from the pinned trace identity.

**Adversarial table.** Rows for the changed statements, with values computed this round:

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `[TauCeti.StarCoalgebra ℂ A]` versus former `hΔ` | ℂ[C₂] with u*=u; ℂ[C₂] with u*=−u | Field `comul_star` equals `hΔ` (`Star.lean:49`). u*=u: `Δ(u*)=u⊗u=(u⊗u)*`. u*=−u: `Δ(u*)=−u⊗u`, `(u⊗u)*=(−u)⊗(−u)=u⊗u`, so the class fails. | Hypothesis unchanged in content; the wrong star is excluded | none |
| `schur_orthogonality` versus `nt` 1.4.2(i) | F̃=ρᵗ | NT: `h(u_ij*u_kl)=δ_jl(ρ⁻¹)_ki/dim_q=δ_jl(F̃⁻¹)_ik/Tr F̃⁻¹` and `h(u_ij u_kl*)=δ_ik ρ_lj/dim_q=δ_ik F̃_jl/Tr F̃`, with `dim_q=Tr ρ=Tr ρ⁻¹` | matches `Suggested.lean:125`–`:133` | none |
| `compactType_iff` with the class | ℂ, z*=z̄; ℂ[C₂], u*=−u | ℂ: class holds, h=id, span{1}=ℂ, both sides true. u*=−u: class fails; there `h((a+bu)*(a+bu))=|a|²−|b|²` and `u*u=−1`, so both sides are false anyway | ok | none |
| `uqSl2RigidCategory` | q=2; q=±1 | q=2: `S²E=K⁻¹EK=E/4`, `S²F=4F` (`Antipode.lean:65`, `:69`), S bijective (`:73`), left duals via S⁻¹ exist. q=±1: K central, `S²=id` | ok | none |
| `uqSl2PivotalCategory`: which pivot | g=K⁻¹, K, 1, −K⁻¹ at q=2, on E | K⁻¹: `K⁻¹EK=E/4=S²E`. K: `KEK⁻¹=4E≠E/4`. 1: `E≠E/4`. −K⁻¹: `Δ(−K⁻¹)=−K⁻¹⊗K⁻¹≠(−K⁻¹)⊗(−K⁻¹)`, not group-like. K⁻¹: `Δ=K⁻¹⊗K⁻¹`, `ε=1` | only K⁻¹ satisfies both laws | none |
| Trace convention in the docstring | basis e_i of V, g=K⁻¹ | rightTrace = `η ≫ f▷ ≫` pivotal ev: `Σe^i(g f e_i)=tr(K⁻¹f)`. Pivotal coev is `Σe^i⊗g⁻¹e_i` (zigzag: `Σe^i(gx)g⁻¹e_i=x`), so leftTrace = `tr(fg⁻¹)=tr(Kf)` | docstring correct | none |
| `uqSl2_sphericalCategory`, q=2 | L₁⁺, L₂⁺, L₁⁻ | `tr K⁻¹=tr K=1/2+2=5/2=[2]₂`; `4+1+1/4=21/4=(8−1/8)/(3/2)=[3]₂`; −5/2 on both sides | holds | none |
| `uqSl2_sphericalCategory`, root of unity q=i (q−q⁻¹=2i≠0) | V with basis v₀,v₁: K=diag(3,−3), Fv₀=v₁, Fv₁=0, Ev₀=0, Ev₁=(−4i/3)v₀ | Relations: `[E,F]v₀=(−4i/3)v₀=((3−1/3)/(2i))v₀`; `KEv₁=−4i·v₀=q²EKv₁`. The weights {3,−3} are not closed under inversion, yet `tr K=3−3=0=1/3−1/3=tr K⁻¹`. End_U(V)=ℂ, since Fv₀≠0 forces a scalar | holds beyond the generic case | none |
| Truth for all q with q²≠1 | any finite V and module map f | `(K−K⁻¹)f=(q−q⁻¹)(E(Ff)−(Ff)E)`, a commutator of trace 0. This is Tau Ceti `trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp` (`QuantumGroups/UqSl2/QuantumTrace.lean:41`), hypothesis `q−q⁻¹≠0` only | true as stated | none |
| Hypothesis `hq` needed | q=±1, ℂ with K=2, E=F=0 | `Rel.e_mul_f_sub_f_mul_e` (`UqSl2/Basic.lean:76`–`:79`) gives `EF−FE=0⁻¹•(K−K⁻¹)=0`; `KE=q²EK` holds since `q²=1`; rightTrace `1/2`, leftTrace `2` | not spherical, as the docstring and the `:1707` Check say | none |
| q=0 | Lean junk value | `q−q⁻¹=0−0=0`, and `Fact (q≠0)` fails: excluded twice | ok | none |

Rows carried from the previous report (`~38`, values first recorded in `~37`) for statements the diff leaves untouched:

| Statement | Values (`~37`) | Result |
| --- | --- | --- |
| `compactType_iff`, ℂ[x] with x primitive | `x+h(x)1` vs `h(x)1` forces x=0; unitary entries constant, span ℂ≠ℂ[x]; both sides false | ok |
| `compactType_iff`, zero ring (Check `:908`) | `ε(1)=1` excludes A=0; with a non-unital ε, span `{0}=⊤` but `h(1)=0≠1` | ok |
| `schur_orthogonality` vs `nt` 1.4.2 at SUq(2) | `h(a*a)=1/5`, `h(c*c)=4/5`, `h(aa*)=4/5`; §7.1 `(1−q²)/(1−q⁴)=4/5` | ok |
| `schur_orthogonality`, degenerate | character `F̃=1`: `1=1/1`; `F̃=2` gives `2≠1/2` | ok |
| `AlgebraicHaar` | `h((1+u)*(1+u))=2`; zero functional `h(1)=0≠1`; ε: `u≠1` | ok |
| `haar_modular_automorphism` | `θ(a)=4a`, `h(aa*)=4/5=4·h(a*a)`; θ⁻¹ gives `1/20`; ℂ[S₃] θ=id | ok |
| `haar_trace_iff_antipode_involutive` | ℂ[S₃] trace and `S²=id`; SUq(2) `4/5≠1/5`, `S²c=c/4` | ok |
| §3.4 conventions | `S²c=c/4=τ_−i(c)`; `σ_t(a)=4^(it)a` | ok |
| §3.3 metrics | `(FuF⁻¹)*F⁻²(FuF⁻¹)=F⁻²`; traces `2`, `1/2` | ok |
| §0.2 Checks | `‖T†T‖=4`; `√17≠5`; `√2`; `8`, `1/2` | ok |
| §0.3 Checks | `tr₂(p)=4/25`, `21/25`; `d³−2d=0`; `e²=δe` | ok |
| §1.2 monoid {1,0} | dimension 3 of 4 | ok |
| §2.2 Check | `T=[[1,1],[1,3]]`, det 2, `U*TU=T` | ok |
| §4.2 pentagon | `(1,3,6)` on both sides | ok |
| §4.3 | `2√3<4`; `2/(2N+1)→0` | ok |
| §5.1 relations, antipode, coproduct | `aa*+q²c*c=1/4≠1` at a=0, c=1; `S(c)=−qc` | ok |
| §5.2, §7.2 | `FF̄=−2I`; norm² 5; `d≤5/2` | ok |
| §7.1 Haar and character | `4/5`, `16/21`; `√3/4` | ok |
| §7.2 dimensions | `1, 5/2, 21/4, 85/8`; moments `1, 2` vs `1, 1` | ok |
| §8.1 | `KF=4FK`; q=0 forces E=0 | ok |
| §8.2 ladders | weights `1/4, 1, 4`; `[E,F]=diag(5/2,0,−5/2)` | ok |
| §8.3 Casimir | `10/9, 17/9, 65/18` | ok |
| §8.5 Clebsch–Gordan | `α₁=−1/2`; middle coefficient `5/4` | ok |
| §8.6 form and pairing | `h₁=1/2`; `⟨Ev₁,v₀⟩=1` | ok |
| §8.7 basis change | exponents `0`; `q⁻¹(2)_q=5/2=[2]` | ok |

**Library declarations opened this round (17), at Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`.**

- **Tau Ceti.**
  - `Algebra/Coalgebra/Star.lean:46`–`:49`, `:91`
  - `Algebra/Category/FiniteHopfModuleCat/Pivotal.lean:119`, `:221`
  - `Algebra/Category/FiniteHopfModuleCat/Rigid.lean:146`
  - `CategoryTheory/Monoidal/Pivotal/Basic.lean:76`
  - `CategoryTheory/Monoidal/Pivotal/Spherical.lean:69`
  - `CategoryTheory/Monoidal/Pivotal/Trace.lean:88`, `:93`
  - `QuantumGroups/UqSl2/Basic.lean:69`–`:86`, `:163`
  - `QuantumGroups/UqSl2/Antipode.lean:59`, `:73`
  - `QuantumGroups/UqSl2/Hopf.lean:167`, `:204`
  - `QuantumGroups/UqSl2/QuantumTrace.lean:41`
  - `QuantumGroups/UqSl2/ClebschGordan/Recoupling.lean:135`
  - `QuantumGroups/UqSl2/CompleteReducibility.lean:300`
  - `QuantumGroups/UqSl2/TypeOne.lean:370`
  - `RingTheory/Finiteness/LocallyFinite.lean:79`
- **Mathlib.** `RingTheory/SimpleModule/Basic.lean:255`, `:261`; `RingTheory/Coalgebra/GroupLike.lean:37`.

**Remarks on untouched text** (no change requested):

- §§0.2–0.3 are still also claimed by the open CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras heads. This was settled earlier: the correction belongs to those pull requests.

## Not verifiable

- **Timmermann** (`timmermann`) is settled as uncertified. Theorem 3.2.12, cited for `compactType_iff`, was not read. The equivalence was cross-checked earlier against `nt` Theorem 1.6.6 (`nt` line 810, p.18).
- **Jones 1983 and Takesaki II** are settled as uncertified and are untouched by the diff.

## Source issues

- none

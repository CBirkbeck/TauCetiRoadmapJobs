# Review of ChevalleyGroups (pull request #697 at 3d6f23f)

**Verdict:** needs changes

The head under review carries the whole roadmap folder `TauCetiRoadmap/ChevalleyGroups/` (README.md, Suggested.lean, metadata.toml) together with edits to two other roadmap folders. The pull request text describes only the metadata file; the findings below concern the roadmap content at this head, which is what the gate and this review see. The gate fails at this head (`sorry-data=7`, `imports=1`, `mathlib-subimports=1`, `no-import-mathlib=1`, `outside-folder=3`; the targeted build itself passes), so there is no acceptance regardless of the mathematics.

## R01 (P1) — Suggested.lean is built on seven sorry'd data definitions

Location: `TauCetiRoadmap/ChevalleyGroups/Suggested.lean` lines 31, 33, 37, 41, 63, 70, 76 (`def ChevalleyGroup … : Type := sorry`, `instance … Group … := sorry`, `rootSubgroup`, `torus`, `titsSystem`, `characterMap`, `graphAut`).

Claim: the file states the roadmap's headline theorems against the pins.

Witness: every `theorem` in the file (`torus_conj_rootSubgroup` l. 45, `elementary_eq_top` l. 59, `graphAut_rootSubgroup_simpleIndex` l. 82) mentions a sorry'd carrier, so none of them can be refuted or confirmed; the gate rule `sorry-data` lists all seven. The module docstring (l. 9–18) is the old "target signatures, not exhaustive, `sorry` is allowed" form and says the group scheme "is not displayed here" instead of naming what is not statable.

Repair: delete the seven definitions and everything that mentions them. Write the module docstring in the required form: the roadmap is README.md; the file states headline theorems against the pinned APIs; the headlines not statable at the pins are (i) `G_sc(t)` and its points (the pinned `kostantToralGroupScheme` needs a lattice `M` with a ℤ-basis `b` and weights `wt`, and the fundamental lattices with their bases are C1 theorems, not pinned data), hence also the Bruhat decomposition, Tits system, Steinberg presentation, graph automorphisms, exceptional isogenies and the comparison theorem; (ii) the structure-constant theorem of C0 (the named Chevalley system is a C0 construction; only `DynkinType.exists_isChevalleySystem` is pinned). State only what is statable with real bodies: the one candidate found is C1.1, finite-dimensionality of `irreducibleQuotient` over `ℚ` for `DynkinType.lieAlgebra t ht` with `DynkinType.cartanSubalgebra t ht` at a dominant integral weight, with no `IsAlgClosed` (pinned theorem `finiteDimensional_irreducibleQuotient_of_isDominantIntegral` in `TauCeti/Algebra/Lie/HighestWeight/FiniteDimensional.lean` l. 137 sits under `[IsAlgClosed K]`, l. 72). If the fundamental weights cannot be named at the pin without new data, the file states nothing and the docstring says so.

## R02 (P1) — The construction is already planned by ReductiveGroups Layer 9 on main; two owners for one object

Location: `TauCetiRoadmap/ChevalleyGroups/README.md` lines 3–5 ("This roadmap constructs … `G_sc(t)` over `ℤ`, as one uniform construction"), 36–41 ("Its Layer 9 consumes `G_sc(t)` from here"), and milestones C1–C5.

Claim: this roadmap owns the Chevalley–Demazure construction and ReductiveGroups Layer 9 consumes it.

Witness: on main, `TauCetiRoadmap/ReductiveGroups/README.md` l. 1092 "Layer 9: pinned Chevalley–Demazure group schemes over `ℤ`"; 9A item 5 (l. 1591–1604) plans the admissible lattices generated from highest-weight lines and modules whose weights generate `X`; 9B (l. 1610–1658) plans the construction via Chevalley basis and Kostant form, base change, root subgroup maps with commutator relations and pinning equations, points over an algebraically closed field with field maps and Frobenius, the isomorphism theorem for pinned groups, the special isogenies with `τ² = Frob_p`, and the carriers with numbered symmetries. The present README plans the same objects again (C1.3–C1.5, C2, C5), and its statement about Layer 9 is true only after this pull request's own edit of that file (R03). The open revisions of ReductiveGroups (its pull requests at their heads, both still headed "Layer 9: pinned Chevalley–Demazure group schemes over `ℤ`") keep Layer 9 as the constructor and cite ChevalleyGroups C0–C7 as a consumer, and the current head of the ChevalleyGroups proposal branch itself now reads "Its canonical constructor is the Chevalley–Demazure construction of ReductiveGroups Layer 9 (9A and 9B)". The text under review is the opposite design.

Repair: cite ReductiveGroups Layer 9 (9A.5 for the lattices, 9B for the scheme, root subgroups, torus, base change, points, Frobenius, isomorphism theorem, special isogenies) as the supplier of `G_sc(t)` under `## Exact supplier contracts`, and keep here only what Layer 9 does not plan, stated as theorems about that supplied object: the named Chevalley system and structure constants (C0), the split-field finite-dimensionality (C1.1), the Bruhat decomposition and Tits system of `E(k)` as an abstract group, the centre, Steinberg's presentation, and the comparison theorem on points. If the project decides instead that ChevalleyGroups owns the construction, that decision is made in ReductiveGroups' own revision, and this README cites Layer 9 as it then reads; it is not made by editing that folder here.

## R03 (P2) — Edits outside the roadmap folder

Location: `git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/ChevalleyGroups`: `TauCetiRoadmap/CFSGStatement/README.md` (487 lines), `TauCetiRoadmap/CFSGStatement/Suggested.lean` (30), `TauCetiRoadmap/ReductiveGroups/README.md` (131).

Claim: the pull request adds one roadmap and a metadata file.

Witness: gate rule `outside-folder` (3). The ReductiveGroups edit replaces Layer 9's construction by a consumption of this roadmap (R02); the CFSGStatement edit renames L0 and L5 ("L5: removal of the family-specific constructions"), deletes the "Explicit carriers" and "The carrier plan" subsections and rewrites four docstrings of its `Suggested.lean` to cite C5 and C6 here.

Repair: drop the three files from this pull request. A consumer's switch to this roadmap is that consumer's revision; this roadmap lists the consumers under `## Downstream consumers` and says what each takes.

## R04 (P2) — Scope cites suppliers for statements they do not make

Location: `TauCetiRoadmap/ChevalleyGroups/README.md` l. 42–44 ("root-systems roadmap owns … diagram automorphisms of root data, and root-datum isogenies"); l. 51–53 ("CFSG statement roadmap owns … the removal of the family-specific carriers that `G_sc(t)` replaces").

Claim: these roadmaps, as they are, own those items.

Witness: `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md` on main has no occurrence of "diagramAut" or "isogen" (grep: 0 hits); the objects are pinned library, `DynkinType.diagramAut` (`TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/DiagramAutomorphism.lean` l. 267), `DynkinType.b2SpecialIsogeny`, `g2SpecialIsogeny`, `f4SpecialIsogeny` (`TauCeti/LinearAlgebra/RootSystem/Isogeny/Special.lean` l. 127, 245, 331). `TauCetiRoadmap/CFSGStatement/README.md` on main has "L0: ambient groups with root subgroups" with subsections "Explicit carriers" and "The carrier plan" (l. 298, 386) and "L5: agreement of explicit carriers with the pinned groups" (l. 652), and at l. 312 takes its pinned groups from ReductiveGroups Layer 9; no removal is planned there.

Repair: in `## Exact supplier contracts`, cite the pinned declarations under `From Tau Ceti` with file names, and describe CFSGStatement and ReductiveGroups as they read on main (or at the heads of their own open revisions, by roadmap and section). The statement that CFSGStatement will remove its carriers is that roadmap's to make.

## R05 (P1) — `characterMap` has no determining law: an abstract endomorphism preserving the torus need not act by an integer matrix

Location: `TauCetiRoadmap/ChevalleyGroups/Suggested.lean` l. 67–72; `TauCetiRoadmap/ChevalleyGroups/README.md` l. 312–318 ("`F ∘ torus` is `torus` composed with the map on `(k^×)^{rank}` given by a unique integer matrix, because homomorphisms of algebraic tori over an algebraically closed field are given by integer matrices").

Claim: for every group endomorphism `F` of `ChevalleyGroup t ht k`, `k` algebraically closed, with `∀ s, ∃ s', F (torus s) = torus s'`, there is a unique integer matrix describing `F` on the torus.

Witness: `t = A₁`, `k = ℂ`, `F` the endomorphism induced by complex conjugation (C5 "Field maps", l. 321–323, makes every field endomorphism of `k` an endomorphism of the points, and `F (torus s) = torus s̄`). On `ℂ^×` the map `s ↦ s̄` is not `s ↦ sⁿ` for any `n ∈ ℤ`: at `s = e^{2πi/8}` it needs `n ≡ 7 (mod 8)`, at `s = e^{2πi/16}` it needs `n ≡ 15 (mod 16)`, and no integer satisfies both for all orders. In characteristic `p` the same happens with `k = 𝔽̄_p` and a Galois automorphism outside the powers of Frobenius (an element of `Ẑ ∖ ℤ`), which acts on roots of unity by a profinite, non-integer exponent. The quoted reason is true for homomorphisms of algebraic groups, which an abstract `→*` is not. The Lean `def` therefore has no value its docstring determines, and the README's contravariance theorem is about an undefined object.

Repair: define the character map only for endomorphisms whose restriction to the torus is given by an integer matrix: hypothesis `∃ M : Matrix (Fin t.rank) (Fin t.rank) ℤ, ∀ s, F (torus s) = torus (fun i => ∏ j, s j ^ M i j)` (or restrict to the standard endomorphisms of C5: `Frob_q`, `γ_σ`, `τ` and their composites, which all satisfy it), prove the matrix unique over an infinite field, and record complex conjugation as a negative-control Check in C5. Tested on the refuting instance: conjugation fails the new hypothesis, `Frob_q` satisfies it with `M = q • 1`.

## R06 (P2) — `elementary_eq_top` is narrower than the README and than the mathematics

Location: `TauCetiRoadmap/ChevalleyGroups/Suggested.lean` l. 59 (`[IsAlgClosed k]`); `TauCetiRoadmap/ChevalleyGroups/README.md` l. 305–307 ("For `G_sc(t)` they are generated by root subgroups alone: `ChevalleyGroup t ht k = E(k)` for every field `k`").

Claim (Lean): generation by root subgroups needs an algebraically closed field.

Witness: `t = A₁`, `k = 𝔽₂`: `SL₂(𝔽₂) ≅ S₃` (order 6) is generated by the two transvections `[[1,1],[0,1]]` and `[[1,0],[1,1]]` (their product has order 3, each has order 2). `k = ℝ`: `SL₂(ℝ)` is generated by elementary matrices. The README's own C2 (torus generated by `h_{α_i}(s)`) and C4 (points in translates of the big cell) give the statement over every field, which is what C4 states and what the simply connected case needs (CFSG descent works over `𝔽̄_p` but the comparison theorem of C6 is used over every field).

Repair: drop `[IsAlgClosed k]` from `elementary_eq_top`, or name it in the docstring as not statable; never state the headline below the README's generality.

## R07 (P3) — README shape: no Needs lines, no Checks, no supplier contracts, and backticked names that `Suggested.lean` does not declare

Location: `TauCetiRoadmap/ChevalleyGroups/README.md` throughout.

Witness: grep counts `*Needs:*` = 0 and `**Checks.**` = 0 in 425 lines; sections are "Scope and boundaries", "Standing conventions", "What already exists (consume)", a "Milestones" table (l. 121–132) and C0–C7 subsections; no `## Exact supplier contracts`, `## How to read the build`, `### Examples`, `### Dependencies`, `## Downstream consumers`. The dependency check reports `depcheck: 155 roadmaps, 1063 edges, 0 problem(s)` with no edge from this README, so the supplier-order audit checks nothing here. Backticked names of this roadmap's own absent from `Suggested.lean`: the worker's four (`DynkinType.adjointGroupScheme` l. 112, `DynkinType.chevalleyTorus` l. 234, `DynkinType.chevalleySpecialIsogeny` l. 334, `DynkinType.serreLift_injective` l. 67) and also `DynkinType.chevalleySystem`, `DynkinType.structureConstant`, `DynkinType.fundamentalModule`, `DynkinType.fundamentalLattice`, `DynkinType.scModule`, `DynkinType.scLattice`, `DynkinType.ChevalleyDatum`, `DynkinType.chevalleyGroupScheme`, `DynkinType.rootSubgroup`, `DynkinType.chevalleyGraphAut`; and the Lean file's `rootSubgroup`, `torus`, `elementary`, `titsSystem`, `graphAut` live in `TauCetiRoadmap.ChevalleyGroups`, not `DynkinType`. Targets without any locator: C1.1, C1.2, C1.4 (faithfulness), C1.5, every C2 bullet, C4 "Flatness", "Fibres" and "Points" (Jantzen and SGA 3 are named without part, section or theorem), C5 "Rigidity up to the torus", "Determination by simple root subgroups", "Steinberg endomorphisms", C6's scheme extension, C7. Process narrative at l. 113–115 ("are removed by that roadmap once `G_sc(t)` replaces them").

Repair: rewrite in the TauCetiRoadmap form (Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers with `### k.n` prose, `*Needs:*` per target, `**Checks.**` with at least three discriminating Checks per definition, `### Examples` and `### Dependencies` per layer, Downstream consumers, References); keep backticked names of the roadmap's own only for declarations that exist in `Suggested.lean`; give every theorem its locator.

## R08 (P3) — Imports

Location: `TauCetiRoadmap/ChevalleyGroups/Suggested.lean` l. 1 (`import Mathlib.FieldTheory.IsAlgClosed.Basic`).

Witness: gate rules `imports`, `mathlib-subimports`, `no-import-mathlib`. The three `TauCeti.*` modules exist at the pin and only `TauCeti.GroupTheory.TitsSystem.Basic` is used by a surviving declaration after R01.

Repair: the single line `import Mathlib`, then only the `TauCeti.*` modules actually used.

## R09 (P3) — The commutator-formula convention is not pinned by a witness

Location: `TauCetiRoadmap/ChevalleyGroups/README.md` l. 253–255 (`[x_α(u), x_β(v)] = ∏ x_{iα+jβ}(C_{ijαβ} (-v)^j u^i)`).

Witness: neither the commutator convention nor one computed value is given. In `SL₃` with `x_α(u) = 1 + u E₁₂`, `x_β(v) = 1 + v E₂₃`, `e_{α+β} = [e_α, e_β] = E₁₃` (so `N_{α,β} = +1`): `x_α(u) x_β(v) x_α(u)⁻¹ x_β(v)⁻¹ = 1 + uv E₁₃ = x_{α+β}(uv)`. Under `[a,b] = a b a⁻¹ b⁻¹` the displayed shape forces `C_{11αβ} = −N_{α,β}`; under `[a,b] = a⁻¹ b⁻¹ a b` with the two factors in Carter's order `[x_β(v), x_α(u)]` it gives `+N_{α,β}`. Without a Check a reader cannot tell which `C` the roadmap means.

Repair: fix the convention in Conventions and record this `A₂` computation as a Check of the commutator formula.

## R10 (P2) — The Serre sample: the specialization names neither of the two inputs it needs

Location: `TauCetiRoadmap/ChevalleyGroups/README.md` l. 64–67 and l. 170–172 ("specialize Serre's theorem from LieHighestWeight Layer 7 to `DynkinType.serreLift`, so that it is an isomorphism").

Claim: the Layer 7 theorem applies to `DynkinType.serreLift` as stated.

Witness: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md` on main, Layer 7 l. 1158–1189, owns `serreLift_injective_of_base` for the Serre system `exists_isSerreSystem_of_base` produces from a base of a Killing algebra over `[Field K] [CharZero K]`, and "additionally assumes `[LieAlgebra.IsSimple K L]`". At the pin, `DynkinType.serreLift` (`TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/SerrePresentation.lean` l. 126) is the lift of the system `isSerreSystem_lieBasis` built from `DynkinType.lieBasis`, not from a base; the pinned instances `DynkinType.instIsKillingLieAlgebra` and `DynkinType.instIsTriangularizableLieAlgebra` synthesize, but `LieAlgebra.IsSimple ℚ (t.lieAlgebra ht)` does not (elaborated: "failed to synthesize"); the file's own docstring says "No claim is made that `serreLift` is injective". Mathlib at the pin has `LieAlgebra.IsKilling.isSimple_iff_isIrreducible` (`Mathlib/Algebra/Lie/Weights/IsSimple.lean` l. 555), so simplicity follows from irreducibility of the pinned root system, which is itself a glue theorem nobody states.

Repair: the C2 target lists as inputs (a) simplicity of `DynkinType.lieAlgebra t ht` for valid `t`, from `isSimple_iff_isIrreducible` and irreducibility of `(rootSystem (cartanSubalgebra t ht))`, owned here or cited where it is proved; (b) the identification of the `lieBasis` Serre system with a base system of Layer 7's theorem, or a use of `eq_serreLift` to transport injectivity between the two lifts. The sentence in the standing conventions says "an isomorphism once C2 proves injectivity" rather than presenting it as already following from Layer 7.

## Verified sound

**Gate and build.** The worker's gate at 3d6f23f: `build=0` (the targeted build passes), `depcheck=0`, `latex=0`, `prnum=0`, `set_option=0`; failing rules are listed in R01, R03, R08. I re-elaborated `Suggested.lean` with `lake env lean` on a scratch copy: ten `declaration uses sorry` warnings, nothing else. A `#check` scratch file against the pins elaborated after building `TauCeti.LinearAlgebra.RootSystem.SimplyConnectedRootDatum.SerrePresentation` and `….LieAlgebra.Chevalley` (missing object files, 2787 jobs, 18 s). Signatures confirmed at the pin: `DynkinType.simplyConnectedRootDatum : (t) → t.Valid → RootDatum (Fin t.numRoots) (Fin t.rank → ℤ) (Fin t.rank → ℤ)`; `DynkinType.simpleIndex : (t) → t.Valid → Fin t.rank → Fin t.numRoots`; `DynkinType.diagramSymmetry : (t) → Subgroup (Equiv.Perm (Fin t.rank))`; `DynkinType.serreLift : … t.SerreLieAlgebra →ₗ⁅ℚ⁆ ↥(t.lieAlgebra ht)` with `serreLift_surjective`; `TitsSystem : (G) → [Group G] → Type`. The signature comparison the brief asks for (every declaration's elaborated type against its README statement) found the two mismatches reported in R06 and R07 (`IsAlgClosed`; namespace `TauCetiRoadmap.ChevalleyGroups` versus `DynkinType`).

**Dependency check.** Output: `depcheck: 155 roadmaps, 1063 edges, 0 problem(s)`. No UPWARD or CYCLE line; but the README has no `*Needs:*` line, so the check has no edge of this roadmap to test (R07). Merge order: ChevalleyGroups is listed last (line 353); its named suppliers (ReductiveGroups, RootSystems, LieHighestWeight, CFSGStatement, CFSGBasicProperties) are all on main.

**Pinned declarations opened** (file and line at the pinned Tau Ceti): `simplyConnectedRootDatum` Assembly.lean 79; `simpleIndex` Assembly.lean 205; `lieAlgebra` LieAlgebra/Basic.lean 130; `cartanSubalgebra` 139; `chevalleyInvolution` 257; `instIsKillingLieAlgebra` Killing.lean 58; `instIsTriangularizableLieAlgebra` Chevalley.lean 45; `exists_isChevalleySystem` Chevalley.lean 51; `SerreLieAlgebra` (= `Matrix.ToLieAlgebra ℚ t.cartanMatrixᵀ`, matching the README's Standing conventions) SerrePresentation.lean 109; `serreLift` 126; `serreLift_surjective` 152; `diagramAut` DiagramAutomorphism.lean 267; `diagramSymmetry` DiagramPermutations.lean 373; `RootPairingIsogeny` Isogeny/Basic.lean 105; `b2SpecialIsogeny`, `g2SpecialIsogeny`, `f4SpecialIsogeny` Isogeny/Special.lean 127, 245, 331; `IsLongSimpleRoot` RootLength.lean 272; `IsSpecialNodePerm` SpecialNodePermutations.lean 101; `numRoots` NumberOfRoots.lean 47; `kostantForm` Kostant/Form.lean 124; `kostantWeightBasis` Weight/Basis.lean 214; `kostantElementarySubgroup` Elementary/Basic.lean 144; `kostantElementaryFrobenius` 350; `kostantTorusPoints` Torus/Basic.lean 305; `kostantWeylPoints` Weyl/Basic.lean 172; `kostantGeneratedGroupScheme` Scheme/Generated/Basic.lean 108; `kostantToralGroupScheme` Scheme/ToralClosure/Basic.lean 164 (variables l. 67–77: lattice `M`, stability `hM`, nilpotence `hnil`, ℤ-basis `b`, weights `wt`); `kostantToralPointsSubgroup` ToralClosure/Points.lean 87; `kostantElementaryNumberedSymmetryAut` NumberedSymmetry.lean 155; `kostantToralNumberedSymmetryIso` ToralClosure/NumberedSymmetry.lean 301; `kostantElementarySteinberg` Steinberg.lean 166; `geckGroupScheme` GeckLattice/GroupScheme.lean 153; `VermaModule` Verma.lean 196; `irreducibleQuotient` Verma.lean 416; `finiteDimensional_irreducibleQuotient_of_isDominantIntegral` FiniteDimensional.lean 137 under `[IsAlgClosed K]` (l. 72), confirming the README's C1.1 premise; `TitsSystem` TitsSystem/Basic.lean 48; `simplyConnectedSemisimpleCommHopfAlgProperty` SimplyConnected/Basic.lean 67; `SpStd.specialIsogeny` Symplectic/StandardCarrier/SpecialIsogeny.lean 68; `ValidLieTypeIndex.exists_pow_datumSteinberg_eq_smulId` CFSG/Datum/Assembly.lean 184; the `G₂` commutator directory `Kostant/RootSubgroup/Commutator/G2/` exists. `DynkinType.adjointGroupScheme`, `chevalleyTorus`, `chevalleySpecialIsogeny`, `serreLift_injective` do not exist at the pin (the README names them as targets). No `IsSimple` instance for `t.lieAlgebra ht` at the pin (R10).

**Cross-roadmap citations resolved** (on main unless said): RootSystems Layer 6 (l. 356–389) owns `DynkinType.cartanMatrix`, the Bourbaki numbering, `IsLongSimpleRoot`, `simplyConnectedRootDatum`, `numRoots`, with character lattice basis the fundamental weights and simple root `α_i` the `i`-th Cartan row, as the README says; LieHighestWeight Layers 3, 4, 7 exist (l. 405, 537, 931) and Layer 7 owns `serreLift_injective_of_base` (R10); the LieHighestWeight standing conventions (l. 75–105) do name the split non-closed case as "a named generalization stated as such", as the README claims; ReductiveGroups Layer 9 (R02); CFSGStatement L0/L5 and its citation of ReductiveGroups Layer 9 at l. 312 (R04); CFSGBasicProperties on main cites "Chevalley groups C2–C5" for the ambient theory (l. 49, 97) and owns Steinberg descent, twisted root groups and simplicity (l. 59), as the README says. Ownership against open pull requests: `roadmaps grep` for `G_sc(t)`, `ChevalleyGroup t ht`, `Chevalley–Demazure` hits ChevalleyGroups (#447, #697), ReductiveGroups revisions (#1332, #1676), ReductiveGroupsPartII (#785, which consumes "ChevalleyGroups §C3 / §C4"), CFSGStatement (#1334, which consumes C5 and an `IsCharacterMap` this README does not define), GroupSchemesOverABase (#1522, two mentions), and consumers in the Langlands lane; no other open pull request constructs these schemes. ReductiveGroupsPartIII and ClassicalGroupsPartII have no hit.

**Adversarial table** (values on both sides; "carrier sorry'd" means the Lean statement cannot be instantiated, the value is for the README statement).

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `torus_conj_rootSubgroup` (pinning equation) | `A₁`, any `A`, `s ∈ Aˣ`; root `α` and `−α`; zero ring | `diag(s,s⁻¹)(1+uE₁₂)diag(s⁻¹,s) = 1 + s²uE₁₂`; root coordinate of `α` in the fundamental-weight basis = Cartan row = 2, so RHS `s²u`; for `−α`: `s⁻²u` both sides; zero ring: both sides `1` | agrees | carrier sorry'd (R01) |
| `h_α(s) = n_α(s) n_α(1)⁻¹` equals `α^∨(s)` | `SL₂` | `n(s) = [[0,s],[−s⁻¹,0]]`, `n(1)⁻¹ = [[0,−1],[1,0]]`, product `diag(s, s⁻¹)` | agrees | none |
| rank-one relation `n_α(s) x_α(u) n_α(s)⁻¹ = x_{−α}(−s⁻²u)` | `SL₂` | product computed `[[1,0],[−s⁻²u,1]]` | agrees | none |
| commutator formula | `A₂` in `SL₃`, `u,v` | `[x_α(u),x_β(v)] = x_{α+β}(uv)` with `N_{α,β}=+1`; README shape gives `C₁₁ = −N` (aba⁻¹b⁻¹) or `+N` (Carter's order) | convention unpinned | R09 |
| structure constants `N = ±(r+1)` | `A₂` simple pair: `r=0`; `B₂` `α=e₁, β=e₂`: `β−α` root, `β−2α` not, `r=1` | `±1`; `±2` (short+short=long, divisible by 2, consistent with the char-2 short-root ideal used in C5) | agrees | none |
| `elementary_eq_top` | `A₁/𝔽₂`; `A₁/ℝ` | `SL₂(𝔽₂)` (order 6) = ⟨two transvections⟩; `SL₂(ℝ)` generated by elementary matrices | true without `IsAlgClosed` | R06 |
| `characterMap` well defined | `A₁/ℂ`, `F` = complex conjugation; `A₁/𝔽̄_p`, `F` = non-Frobenius Galois element | `s ↦ s̄` is not `s ↦ sⁿ`: needs `n ≡ 7 (8)` and `n ≡ 15 (16)` simultaneously for all orders, impossible; profinite exponent in char `p` | definition has no value | R05 |
| `Frob_q` character map `q • id` | `s ↦ s^q` on `(k^×)^r` | matrix `q·1`, pullback `χ ↦ qχ` | agrees | none |
| character map of `γ_σ` = weight map of `(diagramAut σ)⁻¹` | `γ_σ(x_{α_i}(u)) = x_{α_{σi}}(u)` | conjugating by `γ_σ(s)`: `α_{σi}(γ_σ(s)) = α_i(s)`, so pullback sends `α_{σi} ↦ α_i`, i.e. `α_j ↦ α_{σ⁻¹j}` | agrees | none |
| `graphAut_rootSubgroup_simpleIndex` docstring remark | highest root `θ`, simple `α_i` | `θ + α_i ∉ Φ`, so `x_θ(u)` commutes with every `x_{α_i}(v)` but moves `x_{−θ}(v)`: positive simple equations alone do not determine an automorphism | agrees | none |
| exceptional isogeny exponents, `τ∘τ = Frob_p` | `B₂`, `p = 2`: long `α`, short `α*` | `x_α(u) ↦ x_{α*}(±u) ↦ x_{α**}(±u^p)`; short start collects the `p` first; `dτ` kills short root vectors, consistent with `e_i = p` on short | agrees | none |
| centre `{h ∈ T(k) : α(h)=1 ∀α} ≅ Hom(P/Q, k^×)` | `A₁/𝔽₂`; `A₁/𝔽₃`; `A₂/𝔽₄` | `Z(S₃)=1`, `T=1`; `Z(SL₂(𝔽₃))={±1}=T`, `s²=1`; `Z(SL₃(𝔽₄))=μ₃ = Hom(ℤ/3, 𝔽₄^×)` | agrees | none |
| centralizer of `T(k)` is `T(k)` for `k` infinite | `A₁/𝔽₃` as negative control | `T = {±1}` central, centralizer all of `SL₂(𝔽₃)` | hypothesis needed and present | none |
| `N(k)/T(k) ≅ W`, `N ∩ B = T` | `A₁/𝔽₂`, `A₁/𝔽₃` | `n(1)` of order 2 resp. 4, `T` of order 1 resp. 2, quotient order 2 = |W| | agrees | none |
| C6 direction `Λ(D') ⊆ Λ(D) ⇒ G_D → G_{D'}`, central finite kernel | `A₁`: `Λ(SL₂) = ℤϖ ⊇ Λ(PGL₂) = 2ℤϖ` | `SL₂ → PGL₂`, kernel `μ₂` | agrees | none |
| worked example index `|k^×/k^{×2}|` | `k = 𝔽₃`; `k = 𝔽₂` | `|PGL₂(𝔽₃)|/|PSL₂(𝔽₃)| = 24/12 = 2 = |𝔽₃^×/squares|`; `1 = 1` | agrees | none |
| fibre dimension `rank + numRoots` | `A₁`; `G₂` | `1+2 = 3 = dim SL₂`; `2+12 = 14` | agrees | none |
| `numRoots` formula | `A₁` | `n(n+1) = 2` | agrees | none |
| C1.1 premise (pinned proof assumes `IsAlgClosed`) | pin | FiniteDimensional.lean l. 72 `[IsAlgClosed K]` | agrees | none |
| C1.3 `U_ℤ·v⁺ = U_ℤ⁻·v⁺`, `ϖ_i`-weight space `ℤv⁺` | triangular decomposition | `U⁰ v⁺ ⊆ ℤ v⁺`, `U⁺ v⁺ ⊆ ℤ v⁺` by binomial and nilpotence | agrees | none |
| Serre sample hypotheses | pin, LieHighestWeight Layer 7 | `IsKilling`, `IsTriangularizable` synthesize; `IsSimple` fails; Layer 7 assumes `IsSimple` and a base system | inputs missing | R10 |
| `*Needs:*` edges | depcheck | 0 edges from this README | nothing checked | R07 |

**One-tactic probe.** Every sorried theorem mentions a sorry'd carrier (R01), so no library tactic can close or refute it; padding by one-tactic closure cannot be assessed. By reading: `torus_conj_rootSubgroup` restates the pinning equation, a README API fact rather than a headline, and `graphAut_rootSubgroup_simpleIndex` restates a defining equation of `γ_σ`; after R01 neither survives.

## Not verifiable

- Steinberg, *Lectures on Chevalley Groups* (every Steinberg locator in C0–C6: Ch. 1 Thm 1; Ch. 2 Cor. 1 to Thm 2; Ch. 3 Lemmas 15, 19, 27 remark, 28(c)(d), Thms 4, 4′, Cor. 3–5; Ch. 5 Thm 7; Ch. 6 Thm 8; Ch. 10 Thms 28, 29). Looked: the sources service by citation (arXiv API answered HTTP 429) and the author's page `math.ucla.edu/~rst/YaleNotes.pdf` (HTTP 404); the AMS 2016 reissue whose numbering the README cites is paywalled. Recorded in the job's missing-references file. The relations I could recompute (Lemma 19's `n_α`, `h_α`; the rank-one relation; the centre formula on small fields; the exponent pattern of Thm 28) agree with the text as cited, from memory of the notes, not from the text.
- Steinberg, *Endomorphisms of linear algebraic groups*, 7.2, 10.10, 11.2–11.6: cited only for the CFSG statement roadmap's use; not fetched.
- Carter, Humphreys, Jantzen Part II, SGA 3, Conrad: cited without theorem or section numbers (R07), so there is no locator to check.
- Geck, PAMS 145 (2017), arXiv 1602.04583: arXiv API rate-limited during this review; the pinned `GeckConstruction` files realise what the README attributes to it.
- Ownership against open pull requests was checked only through the `roadmaps grep` index of 2026-10-28 and the sibling checkouts this brief lists; packages on the board (five listed, none on Chevalley groups) were read from the index only.

## Source issues

- none

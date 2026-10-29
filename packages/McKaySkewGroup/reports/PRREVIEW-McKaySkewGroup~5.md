# Review of McKaySkewGroup (pull request #223 at 2592d6c)

**Verdict:** accepted

Full review. The change since the previous head `0b393ea` is the deletion of the three companion Lean files (1553 lines, no insertion); `README.md` and `Suggested.lean` are byte-for-byte unchanged since that head. The previous review's only blocking finding (R01, the companion files) is repaired; its P3 (no `sources.toml`) is not. The whole README and the Lean file were re-read, every seeded target was checked at its locator or recorded under "Not verifiable", and the adversarial pass below recomputes the values. Four P3 notes remain, none blocking.

## Previous findings

- R01 (P1, companion files) — repaired. `git diff --stat 0b393ea HEAD -- TauCetiRoadmap/McKaySkewGroup` lists only `CBHTraceControls.lean`, `GeometricMcKayTargets.lean` and `McKayClassificationTargets.lean`, all deleted; the folder now holds `README.md`, `Suggested.lean`, `metadata.toml`. No README passage referred to those files, so nothing dangles (`roadmaps resolve` found no Lean name missing; gate `readme-ids-missing=0`).
- R02 (P3, no `sources.toml`) — not repaired: `ls TauCetiRoadmap/McKaySkewGroup/` still has no manifest. Carried below as R01.

## R01 (P3) — The source manifest is still absent

**Location:** `TauCetiRoadmap/McKaySkewGroup/` (folder listing: `README.md`, `Suggested.lean`, `metadata.toml`); `README.md:2153` (`## References`).

**Claim:** sixteen works are cited (thirteen bibliography entries plus Isaacs, Crawley-Boevey's Conze paper and Tikaradze inline) and no `sources.toml` records their identity, access status or version.

**Witness:** `ls TauCetiRoadmap/McKaySkewGroup/sources.toml` fails; the brief's manifest line reads "none recorded yet".

**Repair:** add `TauCetiRoadmap/McKaySkewGroup/sources.toml` (schema `tauceti-roadmap-sources/v1`), one key per work with locator scheme, locator and `cited_for`; arXiv and journal versions of FKS05, KV00, BKR01, Rei97, HK01, CBK22 as one entry each with a version note; CBH98, Spr77, CS03, Isaacs and the Conze paper as `uncertified`; the texts the service resolved this round (FKS05 arXiv v1, KV00 v2, Rei97 v1, BKR01 v2, HK01 v2, CBK22 arXiv 2108.00795v3, Tikaradze 2204.13647v2, GSV83 at Numdam) carry the service's access fields. No source text enters the repository.

## R02 (P3) — BKR01 does not cite Ito–Nakamura

**Location:** `README.md:1966–1967`: "which covers dimension two; the case of `SL₂(ℂ)` is due to Ito and Nakamura, cited there".

**Claim:** the attribution is not in the cited source. BKR01 credits the dimension-two case to Gonzalez-Sprinberg–Verdier and to Ito–Nakajima's observation, and cites Nakamura alone only for abelian subgroups of `SL(3, ℂ)`.

**Witness:** `BKR01 line 62–66` ("Nakamura [18] proved ... Abelian", "Ito and Nakajima [12] observed that the construction of Gonzalez-Sprinberg and Verdier [10] is the M = C² case"); the reference list has `[12]` Ito–Nakajima and `[18]` Nakamura, no Ito–Nakamura entry (`grep -a Nakamura` at lines 53, 62, 73, 660, 668, 879).

**Repair:** either cite Ito–Nakamura directly (Y. Ito and I. Nakamura, *McKay correspondence and Hilbert schemes*, Proc. Japan Acad. Ser. A 72 (1996), 135–138) as a new References entry, or write "the case of `SL₂(ℂ)` is Gonzalez-Sprinberg–Verdier's construction, as BKR01 notes citing Ito–Nakajima". Theorem 1.2 itself (`BKR01 line 122–123`, p. 4: `n ≤ 3`, `G-Hilb` irreducible and a crepant resolution) is correctly located and already covers the surface case.

## R03 (P3) — `TauCeti.SplitK0.of_mul_of` is in a different file

**Location:** `README.md:190–193` (supplier contract: "`TauCeti.SplitK0.of`, product rule `TauCeti.SplitK0.of_mul_of` ... (`TauCeti/RepresentationTheory/RepresentationRing/Basic.lean`, `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`)").

**Claim:** the product rule lives in neither listed file.

**Witness:** at the pin, `TauCeti/CategoryTheory/GrothendieckGroup/Monoidal/Basic.lean:179` (`theorem of_mul_of (X Y : C) : (of X : SplitK0 C) * of Y = of (X ⊗ Y)`); `Split.lean:124` has only `def of`; `RepresentationRing/Basic.lean:98` mentions the name in a docstring.

**Repair:** add `TauCeti/CategoryTheory/GrothendieckGroup/Monoidal/Basic.lean` to the parenthesis.

## R04 (P3) — A backticked model name that `Suggested.lean` does not declare

**Location:** `README.md:380–381`: "together with the trivial subgroup `cyclicSU2 1 := ⊥`".

**Claim:** the README's own convention (and the gate's) is that a backticked name of this roadmap's own is a declaration of `Suggested.lean`; `cyclicSU2` is declared nowhere, and the open roadmap K3SurfacesAndSymplecticBoundedness already cites "`cyclicSU2 n`" from this Layer 0 as if it existed (its README line 231).

**Witness:** `grep -n cyclicSU2 TauCetiRoadmap/McKaySkewGroup/Suggested.lean` is empty; the gate missed it because the span is `cyclicSU2 1 := ⊥`, not a bare identifier.

**Repair:** write it in prose ("together with the trivial subgroup, the cyclic model with `n = 1`"), or, if a named family is wanted downstream, make the Layer 0 models explicit README targets with prose names and no backticked identifiers.

## Verified sound

**Head, gate, dependency check.** Head `2592d6c85b2e1ed4e213ab581eee35422d954d2a`, worktree clean; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/McKaySkewGroup'` is empty. The worker's gate at this head: every counter `0`, `build=0`, `OK`. Rerun of the dependency check:

```
depcheck: 200 roadmaps, 1308 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Elaboration and signatures.** `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` appended for all 24 declarations (9 theorems, 3 `def`s with real bodies, 6 instances, 2 `Prop` definitions with bodies, 3 abbreviations/definitions of Layer 5): nine `declaration uses 'sorry'` warnings, no error, no other warning, 6 s. Every elaborated type was compared with its README statement: `exists_isMcKayLabelling` carries `[Finite G] [Nontrivial G]`, `finrank = 2`, injectivity of `V.ρ` and `det = 1`; `exists_repRing_addEquiv_of_isMcKayLabelling` carries `ht : t.Valid`; `exists_full_corner_equiv_zigzag` carries `∃ g, V.ρ g = -1`, the labelling and `t.IsGraphical`; `exists_full_corner_equiv_deformedPreprojectiveAlgebra` carries `z ∈ Subalgebra.center ℂ (MonoidAlgebra ℂ G)` and the trace identity for every simple. The three `*Aut` definitions keep `[Field k] [Group G] [AddCommGroup V] [Module k V]` with `V` in the universe of `k`, matching `FDRep k G`'s carriers in the instances. Nothing is lost to the section-variable rule.

**One-tactic padding probe.** Each of the nine theorem bodies replaced by `first | rfl | simp | infer_instance | decide | (intros; rfl) | (intros; simp) | sorry` on a scratch copy: none closed (`finite_subgroup_SL2_classification` fell through to `sorry`; the other eight left unsolved goals after `simp`). The definitions `IsMcKayLabelling`, `IsMcKayQuiver`, `rootLatticeQuotientMap`, `deformedPreprojectiveAlgebra`, `cbhRelator`, `CBHAlgebra` and the six instances are exactly what the Layer 1, 2, 4, 5 headlines need to be stated; no API lemma, Check mirror or small-value example is in the file.

**Headline theorems.** From the README's summary: Klein's classification and conjugacy (stated: three theorems), the McKay correspondence and its converse (stated), the representation-ring comparison (stated), the preprojective and zigzag corners (stated), the Crawley-Boevey–Holland theorem (stated), the relative Koszul duality of Layer 3, the FKS Weyl action of Layer 6 and the geometric correspondence of Layer 7 (named in the docstring as not statable, with the missing carriers: relative tensor algebras over `k[G]` and quadratic duals; parity-graded duplexes with odd algebra elements and non-scalar curvature, reflection kernels, stable categories of `Ã_c`; minimal resolutions and equivariant Hilbert schemes). I checked the last three against the pins: `grep` finds no relative quadratic dual, no `Γ-Hilb` or equivariant Hilbert scheme, and `TauCeti.CurvedDuplex` (`Duplex.lean:92`) has a scalar curvature `w : R` with `d₀ ≫ d₁ = w • 𝟙`, as the docstring says.

**Pinned declarations opened (file and line relative to the library).**

| Declaration | Where | What was checked |
| --- | --- | --- |
| `SkewMonoidAlgebra.single_mul_single` | Mathlib `Algebra/SkewMonoidAlgebra/Basic.lean:1042`; `instRing` at `:779` | `single g a * single h b = single (g*h) (a * g • b)`: the left skew product of the Conventions. |
| `SkewMonoidAlgebra.liftNCAlgHom` | Mathlib `Algebra/SkewMonoidAlgebra/Lift.lean:30` | needs `[MulSemiringAction G A] [SMulCommClass G k A]`, which the six instances supply. |
| `MulSemiringAction.compHom` | Mathlib `Algebra/Ring/Action/Basic.lean:104` | used by the three action instances. |
| `SymmetricAlgebra.lift`/`ι`/`algHom_ext`, `ExteriorAlgebra.map:429`/`hom_ext:136`, `TensorAlgebra.lift:132`/`hom_ext:185` | Mathlib | the universal properties the `*Aut` bodies use (they elaborate). |
| `FDRep.char_tensor:177`, `char_orthonormal:245`, `scalar_product_char_eq_finrank_equivariant:223` | Mathlib `RepresentationTheory/Character.lean` | the Hom-dimension formula `(Nat.card G)⁻¹ Σ χ_W(g) χ_V(g⁻¹) = finrank (V ⟶ W)`. |
| `Representation.asAlgebraHom` | Mathlib `RepresentationTheory/Basic.lean:119` | `k[G] →ₐ[k] End k V`, used in `hlam`. |
| `isCyclic_of_injective_ringHom` | Mathlib `RingTheory/IntegralDomain.lean:130` | `[Finite G] (f : G →* R)`, `R` a domain. |
| `FixedPoints.subalgebra` | Mathlib `Algebra/Algebra/Subalgebra/Operations.lean:106` | exists. |
| `Representation.averageMap:126`, `isProj_averageMap:141` | Mathlib `RepresentationTheory/Invariants.lean` | `[Fintype G] [Invertible (Fintype.card G : k)]`, projection onto `invariants`. |
| `Module.Projective.of_split` | Mathlib `Algebra/Module/Projective.lean:164` | split summand of a projective is projective. |
| `RootPairing.GeckConstruction.equivRootSystem:105`, `equivLieAlgebra:125` | Mathlib `LinearAlgebra/RootSystem/GeckConstruction/Basis.lean` | exist with a base `b`. |
| `TauCeti.SimpleFDRepClasses:188`, `.mk:196` | Tau Ceti `RepresentationTheory/Simple/Basic.lean` | the carrier of the labelling. |
| `TauCeti.repRing:106`, `repRingCharacter:127` | Tau Ceti `RepresentationTheory/RepresentationRing/Basic.lean` | `repRing k G` abbreviates `SplitK0 (FDRep k G)`. |
| `TauCeti.SplitK0.of_mul_of` | Tau Ceti `CategoryTheory/GrothendieckGroup/Monoidal/Basic.lean:179` | `[X]·[Y] = [X ⊗ Y]` (R03: not in the listed file). |
| `TauCeti.irreducibleRepresentation` | Tau Ceti `CharacterTable/Table.lean:248`, variables at `:160` | `[Finite G] [IsAlgClosed k] [Invertible (Nat.card G : k)]`, as the README says. |
| `Representation.finrank_dvd_card:119`, `FDRep.finrank_dvd_card:143` | Tau Ceti `CharacterTable/Degree.lean` | `[Finite G] [IsAlgClosed k] [CharZero k]`, irreducible. |
| `FDRep.nonempty_iso_of_character_eq:117`, `finrank_hom_eq_sum_of_character_eq:127` | Tau Ceti `CharacterTable/Determined.lean` | `[Finite G] [CharZero k]`, no algebraic closure needed: the README's hypotheses match. |
| `FDRep.char_biprod` | Tau Ceti `RepresentationTheory/FDRep.lean:292` | additivity on `⊞`. |
| `TauCeti.SU2.toGL` | Tau Ceti `RepresentationTheory/SU2/SymmetricPower.lean:70` | `SU2 →* GL (Fin 2) ℂ`. |
| `TauCeti.AffineDynkinType` | Tau Ceti `LinearAlgebra/RootSystem/AffineDynkinType/Basic.lean:114` | constructors `A n`, `D n`, `E6`, `E7`, `E8`; `Valid` (`A n ↔ 1 ≤ n`, `D n ↔ 4 ≤ n`), `IsGraphical := t ≠ A 1`, `graph` (`E8` edges `0–1, 0–2, 2–3, 0–4, 4–5, 5–6, 6–7, 7–8`), `cartanMatrix` (`A 1 = !![2,-2;-2,2]`), `marks` (`E8 = ![6,3,4,2,5,4,3,2,1]`, `E7 = ![4,2,3,2,1,3,2,1]`, `E6 = ![3,2,1,2,1,2,1]`, `D n` has `2` for `1 ≤ i ≤ n−3`), `affineNode` (`A, D ↦ 0`, `E6 ↦ 2`, `E7 ↦ 4`, `E8 ↦ 8`), `marks_affineNode`, `cartanMatrix_mulVec_marks_eq_zero:658`. |
| `finiteType:84`, `bourbakiNode:131`, `bourbakiNode_injective`, `bourbakiNode_ne_affineNode:188`, `range_bourbakiNode:262`, `cartanMatrix_submatrix_bourbakiNode:384` | Tau Ceti `AffineDynkinType/Deletion.lean` | all under `t.Valid`, the hypothesis §2.2 carries. |
| `IsIdempotentElem.Corner.instAlgebra` | Tau Ceti `RingTheory/Idempotents/Corner.lean:162` | the `ℂ`-algebra structure the corner equivalences use. |
| `IsIdempotentElem.cornerEquivalence` | Tau Ceti `RingTheory/Morita/Corner.lean:388` | `(hfull : TwoSidedIdeal.span {e} = ⊤)`, inverse `Hom_{eAe}(eA, −)`, as §6.3 says. |
| `TauCeti.IsBasic` | Tau Ceti `RingTheory/Semisimple/BasicAlgebra.lean:184` | exists. |
| `TauCeti.pathAlgebra:209`, `preprojectiveRelator` (`Preprojective/Basic.lean:341`, the gauge-one relator `∑_a (a a* − a* a)`), `preprojectiveAlgebra:597`, `preprojectiveIdeal:514` | Tau Ceti | the Layer 5 definition builds on these. |
| `TauCeti.DoubledQuiver.Orientation` | Tau Ceti `Quiver/Zigzag/Orientation.lean:64` | exists. |
| `TauCeti.nonisolatedZigzagQuotient` | Tau Ceti `Quiver/Zigzag/Relations.lean:300` | "the algebra of a connected graph with an edge"; every valid graphical type has `≥ 3` nodes and is connected. |
| `TauCeti.AffineInvariantQuotient` | Tau Ceti `AlgebraicGeometry/Quotient/Affine.lean:46` | `Spec (Aᴳ)` with projection, affine universal property. |
| `TauCeti.IsCurvedDGAlgebra:73`, `IsCurvedDGLeftModule` (`Module/Defs.lean:64`: `sq_eq : dM (dM x) = -(w • x)`), `isCurvedDGLeftModule_iff_gradedOppositeRight` (`Opposite.lean:71`), `CurvedDGRightModuleCat` (`Right/Defs.lean:146`), `DGHomotopyCategory` (`DG/HomotopyCategory.lean:542`), `CurvedDuplex` (`Duplex.lean:92`), `disk:400`, `curvedDuplex_split_isFrobenius` (`Frobenius.lean:174`), `curvedDuplexSplitStableHomotopyEquivalence:255`, `instPretriangulated` (`Triangulated.lean:80`) | Tau Ceti `Algebra/Homology/Curved/` | the left square is `−(w x)`, so FKS's `d² = c` is the left modules over `(A, 0, −c)`, exactly as §6.1 states. |

**Cross-roadmap citations resolved (main unless noted).**

| Citation | Resolved at |
| --- | --- |
| CharacterTheory Layers 2–3 (Wedderburn, `Irreps`, centre splitting, primitive central idempotents) | `RepresentationTheory/CharacterTheory/README.md:221–248`. |
| LieGroups' `SU(2)`, `SO(3)` example | `RepresentationTheory/LieGroups/README.md:479–485`: surjective `SU(2) → SO(3)` with kernel `{±1}`. |
| RootSystems Layer 4 (strict fundamental domain), Layer 5 (classification) | `RepresentationTheory/RootSystems/README.md:296–320, 321`. |
| ReductiveGroups 9A.1a (norm-two shell, height induction, `a+b ∈ Φ ↔ B(a,b) = −1`, `B = ±2 ↔ a = ±b`, empty diagram included) | `ReductiveGroups/README.md:1125–1141`. |
| ZigzagPreprojective (ordinary zigzag, skew-zigzag with backtrack ratios, Layer 4 orientation independence, `affineE8Graph`, downstream convention) | `ZigzagPreprojective/README.md:125–135, 240–252, 303`; `Suggested.lean:238, 280` (`2·9 + 2·8 = 34`). |
| QuiverRepresentations (Morita, primitive idempotents) | `RepresentationTheory/QuiverRepresentations/README.md:145–168`. |
| DGAInfinity Layer 11 | `DGAInfinity/README.md:629–633` (relative quadratic algebras, right dual). |
| GrothendieckEulerForms Layer 3 | `GrothendieckEulerForms/README.md:107, 318`. |
| StablePeriodicCurved (`MorphismIdeal`, right curved modules, `d² = m·w`) | `StablePeriodicCurved/README.md:71, 426, 449`. |
| NilpotentOrbits N6–N8 | `NilpotentOrbits/README.md:369, 390, 417–440`: hypersurfaces `xy + z^{m+1}` (`A_m`), `x² + y²z + z^{m−1}` (`D_m`), the three `E` forms, charts, `P¹`s with self-intersection `−2`, intersection matrix the negative Cartan matrix, completed comparison only. The §7.2 table agrees: order-`4m` binary dihedral ↦ `D_{m+2}` with `z^{m+1}`. |
| ReflectionInvariantTheory §1 | `ReflectionInvariantTheory/README.md:7–17`: Reynolds operator, Molien, Noether bound, finite generation, nonmodular. |
| GroebnerGeometry G1 | `GroebnerGeometry/README.md:63`. |
| SchemeAndStackFoundations §§1.17, 4.14, 5.1–5.3, 5.7 | `README.md:2624, 5706, 6567, 6653, 6701, 6987`. |
| AlgebraicVectorBundles L0A–L0C | `AlgebraicVectorBundles/README.md:215, 228, 254`. |
| KacMoody KM0–KM1 | open head `rev/1124/.../KacMoody/README.md:20, 30`. |
| CompactGroups, ClassicalGroups | folders exist on main; cited only for infrastructure. |

**Ownership.** `roadmaps grep` over main and the 431 open heads for McKay correspondence/quiver/graph/matrix, Kleinian singularities, skew-group algebras, `Γ-Hilb`, Crawley-Boevey–Holland, the binary groups and "finite subgroups of SL": no other roadmap builds these. ZigzagPreprojective (main, lines 125–135 and 216) explicitly defers the skew-group corner and the McKay graphs' representation-theoretic side to "the downstream McKay roadmap"; CharacterTheory (#978, line 1452) excludes McKay graphs and the subgroup classification; K3SurfacesAndSymplecticBoundedness (#1375, lines 19, 229–241) is a consumer of Layer 0. No open pull request's `Suggested.lean` declares a `TauCetiRoadmap.McKaySkewGroup.*` name. Ownership against open pull requests not listed in the brief was not checked.

**Seeded sample, target by target.**

| Target | Resolution |
| --- | --- |
| 1.2 The McKay labelling | McK80 and Ste85 unreadable this round (below); the definition was checked against the pin's `A 1` matrix `!![2,-2;-2,2]`, marks and affine node (rows A05–A07), and against `Q₈`/`D 4` (`marks = (1,2,1,1,1)`, affine node `0`, centre node `1`) and `E8` (A08). |
| 2.2 The quotient by the regular class | Ste85 unreadable; the pinned lemmas `marks_affineNode`, `bourbakiNode_ne_affineNode`, `range_bourbakiNode`, `cartanMatrix_submatrix_bourbakiNode` carry exactly the `Valid` hypothesis; values A09–A12 (including the `.A 0` negative control: `¬(A 0).Valid`, `nodes = 1`, `finiteType.rank = 0` by `decide` at the pin). |
| 3.1 Skew-group algebras | Mathlib `single_mul_single` at `Basic.lean:1042`; Check values A13. |
| 3.2 Actions on the algebras | the `*Aut` bodies use `SymmetricAlgebra.lift`, `ExteriorAlgebra.map`, `TensorAlgebra.lift` and `MulSemiringAction.compHom` at the pin; Check values A14. |
| 4.1 Full idempotents and the McKay quiver | `HK01 line 616–622` (Prop. 16: binary `G` ⇒ `Λ(ℂ²,G)` Morita equivalent to the zigzag algebra of `Γ_aff`; cyclic of order `n` gives relation (42) with `(i|i−1|i) + (i|i+1|i) = 0`, a zigzag algebra iff `n` even), `line 626–627` (Prop. 17, preprojective), arXiv v2 pp. 13–14; CBH98 Thm 0.1 paywalled (by locator). Values A15–A17. |
| 5.2 The `Q₈` test | internal computation A18–A20; the trace-weight statement agrees with `Tik22 line 135–137` (p. 4: `λ = Σ f_i τ_i` has `i`-th entry `f_i δ_i`). |
| 5.3 Centre and CBH | CBH98 paywalled; `CBK22 line 24–35` (`ρ = Σ ε(a) a a*`, `ρ_λ = ρ − Σ λ_i e_i`, path `ba` exists when `h(a) = t(b)`: later factor first); Tau Ceti relator `∑_a (a a* − a* a)` at `Preprojective/Basic.lean:341`. Values A21–A23. |
| 6.2 Reflection functors | `FKS05 line 759–807` (the kernel `C_{a,x}`, `d²` on `A` is `x(2X_a − Σ X_{i(h)})`, (6.3)–(6.4), `s_a(c) = c + x_a(Σ X_{i(h)} − 2X_a)`, "tensor product with `C_{a,−x_a}` is a functor `Com₂(A,c) → Com₂(A,s_a(c))`"), `line 810` (Lemma 6.1), `line 846–848` (Prop. 6.1, `x ≠ 0`), `line 910, 922` (Props. 6.2–6.3), `line 999–1016` (Theorems 1–2: braid action, Weyl action on a generic orbit; the Remark's weaker condition "no point of the orbit fixed by any `s_a`"), arXiv v1 pp. 21–27. Values A24–A26. |
| 6.3 Γ-side curved Morita | `FKS05 line 1124–1147` (§8.1–8.2: `{±1} ⊂ Γ`, `T_ab = dim Hom(ρ_a ⊗ ρ, ρ_b)`, `A_Γ = Λℂ² ⋊ ℂ[Γ]`, bipartite via `ρ_a(−1) = ±1`, right projectives `ρ_a* ⊗ Λℂ²`, Morita equivalence (8.2)), `line 1191–1196` (§8.5: `c_a = x∧y · p_a`, `d² − Σ ζ_{C,a} c_a`), p. 29–31. Values A27–A29. |
| 6.4 Γ-side reflection kernel | `FKS05 line 1381–1408` (§9.3: `d₁ = m∘(1⊗ι_a⊗1)`, `d₂ = (1⊗π_a⊗1)∘Δ` with `Δ` "its adjoint" and no pairing specified; the canonical transformation `R∘R_a → R`; Prop. 9.1), pp. 36–37. Values A30–A31. |
| 7.1 The quotient | ReflectionInvariantTheory §1 line 9–15, SchemeAndStackFoundations §1.17 line 2624, Tau Ceti `AffineInvariantQuotient`; values A32–A33. |
| 7.2 Invariant presentations | Spr77 paywalled (by locator); the degree table is confirmed by `GSV83 line 422–428` (`E₆: 12, 8, 6`; `E₇: 18, 12, 8`; `E₈: 30, 20, 12`) and the hypersurface forms by NilpotentOrbits N8. Values A34–A36. |
| 7.3 The minimal resolution | NilpotentOrbits N8 (`README.md:417–440`). Values A37. |
| 7.5 Tautological bundles | `KV00 line 53–54` (`V_ρ = Hom_G(ρ, V)`, `E` the regular representation), `line 185–194` (§2.1 Proposition: vertices of `Γ₀` ↔ components of `E`, edges ↔ transverse single intersections; Lemma: `E_π|_{P¹_ρ}` is `O^{d_π}` for `π ≠ ρ` and `O(1) ⊕ O^{d_π−1}` for `π = ρ`), arXiv v2 pp. 2, 5; `GSV83 line 369` (rank of the tautological module equals the degree of `ρ`), `line 102–113` (degrees of irreducibles = coefficients of the highest root = multiplicities in the fundamental cycle); `Rei97 line 3697–3704` (§4.5 Proposition, printed p. 84: unique minimal effective `Z` with `Z·Γ_i ≤ 0`); `BKR01 line 122–123` (Theorem 1.2, p. 4) for 7.4. Values A38–A42. |
| 7.6 The Lie comparison | Mathlib `GeckConstruction/Basis.lean:105, 125`; KacMoody KM0–KM1 at the open head. Values A43. |

**Adversarial pass (values computed on each side).**

| ID / statement | Instances and values | Result |
| --- | --- | --- |
| A01 §0.1 quaternion map | `i ↦ !![I,0;0,−I]`, `j ↦ !![0,1;−1,0]`; product `!![I,0;0,−I]·!![0,1;−1,0] = !![0,I;I,0]` = image of `k` (`d = 1`: `!![0,I;I,0]`); reverse product `!![0,−I;−I,0]` = image of `−k`. Icosahedral count: all permutations `4!·8 = 192`, even `96`, `96 + 24 = 120`. | Retain. |
| A02 §0.2 pole equation | `(2,3,4)`: `1/2 + 2/3 + 3/4 = 23/12 = 2 − 2/24`; `(2,2,n)`: `2 − 1/n = 2 − 2/(2n)`; `(2,3,6)`: `1/2 + 2/3 + 5/6 = 2`, impossible for finite `K`. `C₃` in the torus: `p⁻¹(p(C₃)) = C₆`. | Retain. |
| A03 `finite_subgroup_SL2_classification` | trivial `H`: cyclic ✓. Disjuncts overlap by design (`C₄₈` and `Q₄₈` have order `48`). `QuaternionGroup 1 ≅ C₄` excluded by `2 ≤ n`. | Retain. |
| A04 `finite_subgroup_SL2_conjugate_of_mulEquiv`, `card_eq_48_conjugate` | cyclic of order `n`: image of `diag(ζ^a, ζ^{−a})`, `a` a unit, is the same subgroup; binary dihedral: faithful `2`-dim reps `r ↦ diag(ζ^k, ζ^{−k})` (`k` coprime to `2n`) have the same image; `SL(2,𝔽₃)`: the three `2`-dim irreps are `ρ ⊗ χ^j`, `det = χ^{2j}`, only `j = 0` has `det 1`; `SL(2,𝔽₅)`: the two `2`-dim irreps differ by the outer automorphism swapping the order-`5` classes, same image; binary octahedral: `ρ ⊗ ε` has image `{ε(g)ρ(g)} ⊂ ρ(2O)·{±1} = ρ(2O)`. Order `48` in `SL₂`: `C₄₈`, `QuaternionGroup 12`, `2O`; `card = 48` forces `Finite H`. | Retain; the two exclusions of `card_eq_48_conjugate` are exactly the non-octahedral orders-`48`. |
| A05 `IsMcKayLabelling` on `C₂ = {±I}`, `t = A 1` | `V = 2·sign`; `Hom(triv, V⊗triv) = 0 = 2·1 − 2`; `Hom(sign, V⊗triv) = 2 = 0 − (−2)`; marks `(1,1)`; `(A 1).Valid` (`1 ≤ 1`), `affineNode = 0`, `cartanMatrix 0 1 = −2` (by `decide`). | Retain. |
| A06 `IsMcKayLabelling`, trivial group | `nodes = 1` forces `t = A 0` (`D 0` also has one node: edges `(i=0 ∧ j=0)` removed, marks `1`); `Hom(triv, V⊗triv) = 2 ≠ 2 − 2 = 0`: no labelling, so `exists_isMcKayLabelling` needs `[Nontrivial G]` and `exists_full_corner_equiv_zigzag` is vacuous there (and `hneg` fails: `ρ(1) = 1 ≠ −1`). | Retain. |
| A07 labellings by invalid types | `D 3` (`4` nodes, edges `0–1, 1–2, 0–3`, a path, all marks `1`): `(Mδ)_{end} = 1 ≠ 2`; `D 2` (`3` nodes, edge `0–2`, node `1` isolated): `(Mδ)_1 = 0 ≠ 2`; `A 0`: as A06. No nontrivial group is labelled by an invalid type, so the zigzag headline, which omits `t.Valid`, is not widened to a false case. | Retain. |
| A08 `Ẽ₈` marks and numbering | pin: edges `0–1, 0–2, 2–3, 0–4, 4–5, 5–6, 6–7, 7–8`, `marks = (6,3,4,2,5,4,3,2,1)`, `affineNode = 8`; `(Cδ)_0 = 12 − (3+4+5) = 0`, `(Cδ)_8 = 2 − 2 = 0`, `Σδ² = 120`; swapping nodes `1,3`: `12 − (2+4+5) = 1`. `Ẽ₇ = (4,2,3,2,1,3,2,1)`: `Σδ² = 48`; `Ẽ₆ = (3,2,1,2,1,2,1)`: `Σδ² = 24`; `D̃_{n+2}`: `4 + 4(n−1) = 4n`. | Retain; the README's multisets match the pin. |
| A09 `rootLatticeQuotientMap` body | `Ã₁`: `x = (1,0) ↦ 0 − 1·1 = −1`; `(0,1) ↦ 1 − 0 = 1`; `(1,1) ↦ 1 − 1 = 0` (checked by `simp [rootLatticeQuotientMap]; decide` at the pin, `bourbakiNode 0 = 1`). `.A 0`: target `Fin 0 → ℤ`, total. | Retain. |
| A10 §2.2 form preservation | `Ã₁`, `x = (0,1)`: `x·Cx = 2`, image `1`, finite form `1·2·1 = 2`; `x = (1,0)`: `2` and `(−1)·2·(−1) = 2`; `x = δ`: `0 = 0`. `.A 0`, `x = [1]`: affine form `2`, image form `0`: `Valid` necessary. | Retain. |
| A11 §2.2 kernel and image | kernel: `x_i = x_0 δ_i` at every node in `range bourbakiNode = {affineNode}ᶜ` (Valid) and `δ_0 = 1`: `x = x_0 δ`; surjectivity: `q(e_{b(i)}) = e_i` since `b(i) ≠ affineNode`. Over `ℤ` the radical of `C` is `ℤδ` because `δ_0 = 1` makes `δ` primitive. | Retain. |
| A12 §2.2 `Q₈` and `Ẽ₈` Checks | `D₄` finite: `q(e_0) = −(1,1,1,2)`; norm `(1,1,1,2)·C·(1,1,1,2) = 2(1+1+1+4) − 2(2+2+2) = 14 − 12 = 2`. `Ẽ₈`: column of `2 − C` at node `8` is `e_7` (unique neighbour), mark `2`. | Retain. |
| A13 §3.1 Checks | `C₂` on `k[x]`, `x ↦ −x`: `single g 1 * single 1 x = single g (1·(g•x)) = single g (−x)`; the opposite convention gives `single g x`. `A = k`, `Γ = C₂`: two simples versus one. | Retain. |
| A14 §3.2 Checks | `(1#g)(x#1) = single g (g•x) = −x # g`; `(x#1)(1#g) = single g (x·1) = x # g`; `x²` fixed by multiplicativity. | Retain. |
| A15 §4.1 `IsMcKayQuiver` | trivial group: `Hom(triv, V⊗triv) = 2 = 2·#loops` ⇒ one loop; `C₂`: `Hom(sign, V⊗triv) = 2` ⇒ two arrows between the vertices (Kronecker, or one each way); `Q₈`: binary ⇒ `M_ii = 0`, one arrow per edge of `D̃₄`. | Retain. |
| A16 `exists_full_corner_equiv_preprojectiveAlgebra`, boundary groups | trivial group: `Sym(ℂ²)⋊1 = ℂ[x,y]`, `Π(loop) = ℂ⟨a,a*⟩/(aa* − a*a) = ℂ[a,a*]`, `f = 1`; `C₂`: both idempotents primitive of dimension one, `f = 1`, `Π(Ã₁)` on four arrows. | Retain. |
| A17 §4.2 cyclic corner | `X_{i+1}X_i = x² e_i = 0`; `Y_{i+1}X_i = yx e_i`, `X_{i−1}Y_i = xy e_i = −yx e_i`; basis `4n`; `n = 3`: ratio at `i` scales by `(s_{i−1}t_i)/(s_i t_{i+1})`, cycle product `1`, so `(−1)³ = −1` is invariant; `n = 4`: `X_i ↦ (−1)^i X_i` turns every `−1` into `+1`. Zigzag dimensions: `D̃_{n+2}`: `2(n+3) + 2(n+2) = 4n + 10`; `Ẽ₈`: `18 + 16 = 34`. | Retain. |
| A18 §5.2 scalar-weight module | `a = E₁₀`, `a* = E₀₁` (centre `0`, leaf `1`): `aa* − a*a = E₁₁ − E₀₀`, so `λ_leaf = 1`, `λ_centre = −1`; `E₁₀, E₀₁` generate `M₂(ℂ)`: simple of dimension `2`; trace check `−1·1 + 1·1 = 0`. | Retain. |
| A19 §5.2 trace-weight exclusion | weights `(−2, +1, 0, 0, 0)`: `−2d_c + d_l = 0` with `d_c + d_l ≤ 2` forces `d_c = d_l = 0`; support on three isolated leaves with zero weight: simples of dimension `1`. Vertex-compatible version: one copy of each irreducible gives `Tr(z) = 1 + 2·(−1) = −1 ≠ 0 = Tr[x,y]`. | Retain. |
| A20 §5.1 trace versus scalar | `Q₈`, `z = e_c`: scalars `(0,0,0,0,1)`, traces `(0,0,0,0,2)`; `Tr(e_c²) = 2 ≠ 4`. Cyclic groups: `δ_i = 1`, both agree. `Tik22 line 137`: "λ has i-th entry f_i δ_i". | Retain. |
| A21 §5.3 Checks | scaling arrows by `2`: `diag(−4,4) = 4λ`, not `2λ`; Weyl algebra in char `0`: `Tr[a,a*] = 0 ≠ dim M`; `𝔽₂`: `E₀₁E₁₀ − E₁₀E₀₁ = E₀₀ − E₁₁ = I`. `C₂`, `z = c(1−g)/2`: acts by `0` on `triv`, `c` on `sign`: trace weights `(0,c)`. | Retain. |
| A22 `exists_full_corner_equiv_deformedPreprojectiveAlgebra`, sign of `λ` | `a ↦ a*, a* ↦ a` sends `ρ ↦ −ρ`, so `Π^λ ≅ Π^{−λ}`; the README's uniform-rescaling bullet (`c = −1`) says the same; only the ratio `δ_i` between vertices is invariant, which A18–A19 test. Trivial group: both sides the first Weyl algebra for `z ≠ 0`. | Retain. |
| A23 `cbhRelator` | `single 1 (xy − yx) − Σ_g z_g single g 1`: for `z = 0` the ideal is `(xy − yx)` and `CBHAlgebra ≅ Sym(V)⋊G`; `b` fixes `x = b 0`, `y = b 1`. | Retain. |
| A24 §6.2 kernel square | FKS (6.3) with `x = −x_a`: `−x_a(l(X_a) + r(X_a) − Σ l(X_b))`; `l(s_a c) − r(c)` with `c = Σ x_b X_b`: on `P_a⊗{}_aP`, `X_b⊗1 − 1⊗X_b` acts by `0` for `b ≠ a`, giving `x_a(l X_a − r X_a) + x_a(Σ l X_b − 2 l X_a)`, the same expression; on `A`, `l(c) − r(c) = 0` and `x_a(ΣX_b − 2X_a) = s_a(c) − c`. | Retain; the README's `C_{a,−x_a}` is FKS's. |
| A25 §6.2 Checks | `m_aΔ_a(1)`: `(a→b)(b→a)` (later factor first) is the loop `b → a → b`, a backtrack at `b`, equal to `Y_b`; so `ε_a(2Y_a + ΣY_b) = 2X_a − ΣX_b` since `ε_b = −ε_a`. Braid on `a–b`: `s_a s_b s_a: (x_a,x_b) ↦ (−x_a, x_a+x_b) ↦ (x_b, −x_a−x_b) ↦ (−x_b, −x_a)`; `s_b s_a s_b: ↦ (x_a+x_b, −x_b) ↦ (−x_a−x_b, x_a) ↦ (−x_b, −x_a)`. | Retain. |
| A26 §6.1 Checks | `ℚ[t]/(t²)`, `c = 0`: the disk restricts to `A/(t) ⊕ A/(t)[−1]`, not projective over `A`, so nonzero in `Mod(Ã_0)`; `d` an isomorphism between the two copies, so zero in `K(A,0)`. `ℚ[u,u⁻¹]`, `c = u`: `h = u⁻¹d/2` gives `dh + hd = u⁻¹d² = 1`; over `ℤ[u,u⁻¹]` no `1/2`. | Retain. |
| A27 §6.3 central lifts (`Q₈`) | `Σ_{(i,r)} E^i_{r1}E^i_{1r} = Σ_i z_i = 1`; `θ(Ωe_c) = Ω(E^c₁₁ + E^c₂₂)`, central: against degree-one `w` both products have exterior degree `3 = 0`; against `1#h`: `h·Ω = det(h)Ω = Ω` and `z_c` central in `ℂ[Γ]`. `θ(e) = 1`. Vertex idempotents not central: arrow `a = e_l a e_c`: `e_c a = 0`, `a e_c = a`. `w = E^c₁₂`: `ewe = E^c₁₁E^c₁₂E^c₁₁ = 0`. | Retain. |
| A28 §6.3 parameter dictionary | FKS §8.5: `c_a = Ω·p_a`, `d² = Σ ζ_{C,a} c_a`; README `c_A(t) = Ω Σ κ_i t_i z_i` with `t_i = f_i/κ_i`; §6 convention `c = −Σ ζ^Q X_a`, so `t_i = −ζ^Q_i`; FKS `C_{a,x}` has multiplication coefficient `x`, README's kernel has `−t_a`: `x = −t_a`. | Retain. |
| A29 §6.4 Fourier Check | `(δ_a/|Γ|) Σ χ_a(γ⁻¹)γ` is the primitive central idempotent (`e_χ = (χ(1)/|G|) Σ χ(g⁻¹)g`); dropping `δ_a` gives `e_χ/δ_a`, not idempotent when `δ_a > 1`. Dimensions `4δ_a`, `16δ_a²`. `t_a = 0`: `D = (0, Δ^A_a)`, `D² = 0 = l(c_A(t)) − r(c_A(t))` since `s_a t = t` and `c_A(t)` is central. | Retain. |
| A30 §6.5 `Q₈` endpoint test | `a = triv`, `b = V`; `φ_ab(v) = v⊗1`, `φ_ba(1) = y⊗x − x⊗y` (invariant: `det = 1`); `π(1⊗φ_ba)φ_ab: x ↦ x∧y⊗x`, `y ↦ −(y∧x)⊗y = Ω⊗y`: `Ω⊗id_V`, `c_ab = 1`; `π(1⊗φ_ab)φ_ba: 1 ↦ (y∧x − x∧y)⊗1 = −2Ω⊗1`, `c_ba = −2`; weighted `2·1 = 2`, `1·(−2) = −2`; rescaling multiplies both raw scalars by the same `s_ab s_ba`, so `1 + (−2) ≠ 0` persists. | Retain; `FKS05 line 1168–1170` asserts `ε(h) + ε(h̄) = 0` for these raw composites, which this instance refutes (Source issues). |
| A31 §6.5 Checks 2–3 | `(v,w) ↦ (v, rw)`: `(−(t_a/r)μ_a(rw), rΔ_a(v)) = (−t_aμ_a(w), rΔ_a(v))`. `f'_i = κ_i s_a(t)_i = f_i + κ_i(f_a/κ_a)(Adj(a,i) − 2[i=a])`; `κ_c = 2κ_l`, reflect at `l`: `f_c` changes by `2f_l`. | Retain. |
| A32 §7.1 Checks | contragredient `s`: `s⁻¹ = !![0,−1;1,0]`, `(s·x)(v) = x(s⁻¹v) = −v₂ = −y`, `(s·y)(v) = v₁ = x`. `C₂`: fibre `S/(x²,xy,y²)` has basis `1, x, y`, length `3 ≠ 2`. `−I` fixes no nonzero vector; `diag(1,−1)` fixes the first axis. | Retain. |
| A33 §7.1 freeness | finite-order `g ∈ SL₂` with eigenvalue `1` has both eigenvalues `1` (product `1`), is diagonalizable, hence `g = I`. | Retain. |
| A34 §7.2 cyclic and dihedral | `x^a y^b` invariant iff `a ≡ b (mod n)`; `n = 1`: `Z = xy = XY`. Dihedral: `A ↦ B`, `w ↦ −w`; `X² = w²(A−B)² = Z((A+B)² − 4AB) = Z(Y² − 4Z^m)`; rescaled to `X² + Y²Z + Z^{m+1}`, N8's `D_{m+2}` form `x² + y²z + z^{(m+2)−1}`. `m = 1`: the group is `C₄`, type `A₃`. | Retain. |
| A35 §7.2 Checks | Molien `C₂`: `½((1+t)² + (1−t)²)/(1−t²)² = (1+t²)/(1−t²)²`; Hilbert series of `ℂ[X,Y,Z]/(XY − Z²)`, degrees `2`: `(1−t⁴)/(1−t²)³ = (1+t²)/(1−t²)²`; without `Z`: `1/(1−t²)²`. `Q₈`, `x = 1, y = 2`: `A = 1, B = 16, w = 2, Y = 17, Z = 4, X = −30`, `900 = 4·225`. Degrees: `24 = 2·12 = 3·8 = 4·6`; `36 = 2·18 = 3·12 = 12 + 24`; `60 = 2·30 = 3·20 = 5·12`; `6·8 = 48`, `8·12 = 96`, `12·20 = 240 = 2|Γ|`. | Retain. |
| A36 §7.2 table against GSV83 | `GSV83 line 424–428`: `A_n: n+1, n+1, 2`; `D_n: 2(n−1), 2(n−2), 4`; `E₆: 12, 8, 6`; `E₇: 18, 12, 8`; `E₈: 30, 20, 12`. README: `(6,8,12)`, `(8,12,18)`, `(12,20,30)`; dihedral `Y = A+B` degree `2m = 2((m+2)−2)`, `Z = w²` degree `4`, `X` degree `2m+2 = 2((m+2)−1)`. | Retain. |
| A37 §7.3 Checks | `C₂`: blow-up of `XY = Z²`, one `P¹` with `E² = −2`, total space of `O(−2)`; `C₃`: `!![-2,1;1,-2] = −C(A₂)`, two curves = two nontrivial irreducibles; `Γ = 1`: empty. | Retain. |
| A38 §7.4 Checks | `(y − ax, x² − b)`: quotient basis `1, x`; image `(x², xy, y²) = (b, ab, a²b)`; `b ≠ 0`: orbit of `(√b, a√b)`; `(x², xy, y²)` has length `3`. Deformations over `ℂ[ε]`: tangent dimension `2`. | Retain. |
| A39 §7.5 Reynolds projector | over `ℂ[ε]/(ε²)`, `S` the swap: `P = ½!![1,1;1,1]`, `P² = ¼·2·!![1,1;1,1] = P`, image `A(1,1)`, kernel `A(1,−1)`, `det !![1,1;1,−1] = −2` a unit; `(I+S)² = 2(I+S)`. `S₃` on `O³`: `P = ⅓J`, `J² = 3J`, ranks `1 + 2 = 3`. Trivial group: `P = id`, including `F = 0`; two points: ranks `2` and `0`. | Retain. |
| A40 §7.5 ranks and the unit | `Q₈`: `Σδ_i² = 4 + 4 = 8 = |Q₈|`, `Σδ_i = 6`. Fibre of `T_i` at a geometric point: `Hom_{K[Γ]}(K⊗ρ_i, K[Γ])` of dimension `δ_i` (`GSV83 line 369`: rank equals the degree). `O_Y → T_triv`: fibre `K → K[Γ]^Γ`, `1 ↦ 1 ≠ 0`, line bundles, so an isomorphism. | Retain. |
| A41 §7.5 degrees and cycle | `C₂` on the chart: the sign summand is `V*⊗O` modulo the tautological line, `O(1)`, degree `+1`; `Hom_Γ(R, ρ_i)` gives `−1`. `Z_Γ·E_j = −Σ_{i≠0}δ_iC_{ji} = −(0 − C_{j0}δ_0) = −M_{j0} ≤ 0`. `Q₈`: `Z = 2E_c + E₁+E₂+E₃`: `Z·E_c = −4 + 3 = −1`, `Z·E_k = 2 − 2 = 0`; `E_c + ΣE_k`: `·E_c = −2 + 3 = 1 > 0`. `C₂`: `(−E)² = −2`. Highest-root coefficients are the marks (`GSV83 line 102–105`). | Retain. |
| A42 §7.5 minimality route | if `Z` anti-nef, `Y ≤ Z`, `Y·E > 0`, then `E ⊄ Z − Y` would give `Z·E ≥ Y·E > 0`; so `Y + E ≤ Z`. Each step adds a simple root `α` to a root `β` with `⟨β,α⟩ = −1`, hence a root by 9A.1a; stops at a dominant root, unique and highest by the 1.1 lemma on the connected deleted diagram. `Rei97 line 3697–3704`: existence and uniqueness of the minimal anti-nef cycle. | Retain. |
| A43 §7.6 Checks | `A₁`: `sl₂`, dimension `3`; `E₈`: `248 = 8 + 240`, `240` norm-two vectors; `Γ = 1`: empty root system, zero Lie algebra; `Σ δ_i` over `Ẽ₈` finite nodes = `29`, irrelevant to `248` (no conflation). | Retain. |
| A44 §1.1 weighted identity | RHS `Σ_{i<j} M_ij δ_iδ_j(x_i/δ_i − x_j/δ_j)² = Σ_i (x_i²/δ_i) Σ_{j≠i} M_ijδ_j − 2Σ_{i<j}M_ijx_ix_j`, and `Σ_{j≠i}M_ijδ_j = 2δ_i − M_iiδ_i`, giving `Σ_i (2 − M_ii)x_i² − 2Σ_{i<j}M_ijx_ix_j = xᵀ(2I−M)x`. `M = [2]`: `0 = 0`. `C₂`: `2(x₁−x₂)²` both sides. `2×2` minors of `C′`: `4 − M_ij² > 0 ⇒ M_ij ≤ 1`. | Retain. |
| A45 §1.1 highest-root lemma | `C₃`: `A₂`, `x = (1,1)`, `C′x = (1,1) = m`, `mᵀx = 2`, dominant root `α₁+α₂` only (`B(α₁+α₂, α₁) = 1`, `B(α₁,α₂) = −1`). `A₁×A₁`: `α₁, α₂` both dominant, different orbits. `B₂`: `α₁+2α₂` and `α₁+α₂` both dominant. Empty diagram: `Φ = ∅`. Maximal `γ`: `B(γ,α) = −2` forces `γ = −α < α`, not maximal. | Retain. |
| A46 §3.3 Checks | `k[x]`: `0 → B → B → k → 0` exact; `B --id--> B` with zero augmentation: `H₀ = 0`. `k[x]/(x²)`: `K_n` one-dimensional, periodic. `R = k(x⊗y)`: `R⊗W ∩ W⊗R = span{xyx, xyy} ∩ span{xxy, yxy} = 0`; `R = x⊗W`: `x⊗W⊗W ∩ W⊗x⊗W = x⊗x⊗W`, dimension `2` versus `4`. Counterexample `S = ℚ[t]`, `W = S⊗S`: `Hom_{Sᵒᵖ}(⊕_n S, S) = Π_n S` uncountable; `S⊗Sᵒᵖ ≅ ℚ[x,y]` countable. | Retain. |
| A47 Lean generality versus README | README §1.2 "nontrivial finite group, faithful `2`-dim, `det 1`" = `[Finite G] [Nontrivial G]`, `finrank = 2`, injective `ρ`, `det = 1`; §2.2 `Valid` = `ht`; §4.1 zigzag "`−I ∈ Γ` and graphical" = `hneg`, `hgraph`; §5.3 "central `z`, trace weights" = `hz`, `hlam`. `G : Type` in Layers 2, 4, 5 versus `Type u` in Layer 1: harmless. | Retain. |

**House style.** No LaTeX delimiters, process words, pull-request numbers or absolute paths (gate `latex=0 tex=0 prnum=0 round-labels=0 private-paths=0`); every layer ends with `### Examples` and `### Dependencies`; every definition has at least three Checks; `*Needs:*` lines name their inputs item by item; `theorem` throughout, one `import Mathlib`, nine `TauCeti.*` imports that exist at the pin, no `set_option`, no sorry'd data.

## Not verifiable

- **Ste85 §1(1)–(8)** (targets 1.1, 1.2, 2.2): the sources service found no legal copy. Tried: the citation; `https://msp.org/pjm/1985/118-2/pjm-v118-n2-p30-s.pdf`, `…-p.pdf` and the `http` variant (HTTP 404 each, though the msp article page `p30.xhtml` advertises that file as freely readable); `https://projecteuclid.org/download/pdf_1/euclid.pjm/1102706463` and `…/euclid.pjm/1102706463` (empty responses). A course-page repost exists but is not a publisher, repository or author copy, so it was not used. Recorded in `needs-references.toml`. The statements cited to it were checked by computation (A08, A10–A12).
- **McK80 Props. 1–2** (target 1.2): the DOI lands on `pubs.ams.org/ebooks/pspum/037`, a host in no licence class; no open PDF found. Recorded in `needs-references.toml`; the propositions are the standard McKay statements, verified at the instances above.
- **CBH98 Theorem 0.1 and §§3–4** (targets 4.1, 5.3): Duke, paywalled (Project Euclid page without a PDF link). Cited by locator, as in earlier rounds; the parameter normalization was cross-checked against Tik22 and CBK22 instead.
- **Crawley-Boevey's Conze paper, printed p. 3** (5.1): the service reports it uncertified (paywalled DOI prefix); by locator.
- **Spr77 §§4.4–4.5, CS03 §6.5, Isaacs Theorem 4.3, CL18**: not fetched this round (paywalled or not attempted); cited by locator, unchanged from earlier reviews. CL18 (MDPI *Symmetry*) is open access and could be added to the manifest at the author's convenience.

## Source issues

- **Error** in FKS05 at §8.3, arXiv v1 printed p. 30 (`FKS05 line 1168–1170`): the source says the raw ordered composites of the chosen intertwiners satisfy `ε(h) + ε(h̄) = 0`; it should be the dimension-weighted scalars `δ_b c_ab`, `δ_a c_ba` that are antisymmetric (the `Q₈` pair `(1, −2)` is a counterexample to the raw statement); affects a stated result (the roadmap's §6.5 already works with the weighted coefficients).

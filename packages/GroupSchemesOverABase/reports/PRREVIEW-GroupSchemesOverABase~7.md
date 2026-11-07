# Review of GroupSchemesOverABase (pull request #1522 at 6b17dff)

**Verdict:** needs changes

The head adds 4.5–4.8 (separatedness, `G_red`, the identity component and `π₀` of a group locally of finite type over a field) with seven new headline statements, and leaves the rest of the folder as the previous review read it. The worker's gate passes, `lake env lean` gives exactly the 22 `sorry` warnings, the dependency check shows no UPWARD or CYCLE line, and the one-tactic probe closes none of the 22 sorried theorems. The new targets are correct: every locator into SGA 3 VI_A checks, and the adversarial table below computes each of the seven statements on a non-example. Nine P3 findings, no blocking finding:

- six findings of the previous review (at c8d8937) are not repaired by this head (R01–R05, R07); its P2 (a second owner of Layers 1–2) is resolved on the other side, PurityForFlatCohomology's head now citing these targets, and only the consumer list remains (R08);
- one new duplication: 4.5–4.8 restate, for affine groups of finite type over an algebraically closed field, what Tau Ceti has at the pin (R06);
- the sources manifest records none of the texts 4.5–4.8 and 1.4 cite (R09).

## Repairs of the previous review (c8d8937)

- R01 (P2, PurityForFlatCohomology §§7.13a–7.13e a second owner of Layers 1–2): **resolved by the other pull request, not by this head.** `TauCetiRoadmap/PurityForFlatCohomology/README.md` at the head of #1840 (1de6822) has a contract `### From TauCetiRoadmap.GroupSchemesOverABase` (its lines 454–460) consuming §§2.1–2.3, and its §7.14 (line 2046) and *Needs:* lines (2067, 2108, 2128, 2147, 2193, 2245, 2286, 2339) cite §§1.3, 1.4, 2.1–2.3, 2.7 here; no `### 7.13` heading remains. What the repair asked of this README, naming that consumer under Downstream consumers, is not done: lines 1165–1183 name FlagVarieties, NeronModelsAndSemistableAbelianVarieties, SpringerResolutionAndCharacteristicCycles and EquivariantIntersectionTheory only. See R08.
- R02 (5.5 Check, supersingular `F = 0`): **not repaired.** Line 911 still reads "For `A_s` supersingular, `F(ω̄) = 0` and `P = x^p`." See R01 below.
- R03 (5.3 route applies 3.5 to non-affine `G`): **not repaired.** Lines 851–852 still read "prolong the torsion of a split maximal torus of the special fibre to finite étale subgroups (3.3) and take their centralizers (3.5)", under the Layer 5 heading "smooth, separated and of finite presentation over `S`, with connected fibres" (line 787). See R02 below.
- R04 (unneeded injectivity on `isKernel_diagonalizableMap`): **not repaired.** `Suggested.lean` line 142 still has `(hφ : Function.Injective φ)`; README line 327 still "For an injective `φ : N →+ M`, prove … `isKernel_diagonalizableMap`". See R03 below.
- R05 (Tau Ceti declarations for 1.3, 1.4, 3.5, 5.3 not cited): **not repaired.** The From Tau Ceti contract (lines 159–181) gained the four declarations of 4.5–4.8 and nothing for 1.3, 1.4, 3.5 or 5.3; lines 317, 327–330, 587 and 868–872 are unchanged. See R05 below.
- R06 (ReductiveGroups Layers 3, 6, 7 used without citation; Scope sentence on Layer 8's multiplicative-type clause): **partly repaired.** Layer 3 is now in the Scope (lines 63–66) and the contract (line 182), for the comparisons of 4.6 and 4.8 only. 4.1 (line 617) still cites SchemeAndStackFoundations §1.17 alone, 4.4 (line 665) still "4.2; Tau Ceti `TauCeti.HopfIdeal.IsMaximalTorus`", 5.3 (lines 871–872) no ReductiveGroups layer; the Layer 8 Scope bullet (lines 52–62) has no sentence on its field-level multiplicative-type comparisons. See R07 below.
- R07 (`isotrivial_component` is `isotrivial` applied to `U`): **not repaired.** `Suggested.lean` lines 203–208 and docstring line 24, README line 460, unchanged. See R04 below.

## R01 (P3) — 5.5 Check: supersingular does not give `F = 0` on `H¹(A_s, O)`

**Location.** `TauCetiRoadmap/GroupSchemesOverABase/README.md` line 911: "For `A_s` supersingular, `F(ω̄) = 0` and `P = x^p`."

**Claim.** For a supersingular special fibre, Frobenius kills the class `ω̄`, for every basis vector `ω`.

**Witness.** On `H¹(A_s, O)` Frobenius has rank `dim A_s − a(A_s)`. A supersingular abelian surface with `a`-number `1` has `F` of rank `1` and `F² = 0`; for `ω̄ ∉ ker F` the relation is `F²(ω̄) = 0` and `P = x^{p²}`, not `x^p`. Re-raised: r6 R02 (no repair report marked it not actionable).

**Repair.** Replace the sentence by: "For `A_s` a supersingular elliptic curve, or more generally superspecial (`F = 0` on `H¹(A_s, O)`), `F(ω̄) = 0` and `P = x^p`; when `A_s` has `p`-rank `0`, `F` is nilpotent and `P = x^{p^m}` with `F^m(ω̄) = 0`, `m ≤ dim A`." Tested on both instances: an elliptic curve of Hasse invariant `0` gives `F = 0`, `P = x^p`; the surface above gives `F² = 0`, `P = x^{p²}`.

## R02 (P3) — 5.3: the route of the four inequalities applies 3.5 to non-affine `G`

**Location.** README line 787 (Layer 5 standing hypotheses: smooth, separated, finite presentation, connected fibres) and lines 851–852: "prolong the torsion of a split maximal torus of the special fibre to finite étale subgroups (3.3) and take their centralizers (3.5)".

**Claim.** This route proves the inequalities for `ρ_ab`, `ρ_r + ρ_ab`, `ρ_n`, `ρ_u` for every `G` of Layer 5.

**Witness.** 3.5 (line 585) is for `G` smooth affine, as is its source: sga3-11 line 1150 (Prop. 5.9: "G un S-préschéma lisse et affine"), and XI 5.3 is under the standing hypotheses of XI 4.2 (sga3-11 line 819). The group of sga3-10 line 1343 (Remarque 8.3: generic fibre an elliptic curve, special fibre `𝔾_m`) is in Layer 5 and not affine. Re-raised: r6 R03.

**Repair.** Either add a target (in 3.5 or 5.3) stating that for `H` finite of multiplicative type in `G` smooth, separated and of finite presentation over `S`, `Z_G(H)` is a closed subgroup scheme smooth over `S`, with its locator, and cite it for non-affine `G`; or restrict this route to affine `G` and state the non-affine inequalities separately with their own route. In the same sentence, the prolongation of torsion is 3.1 (SGA 3 IX 3.6) and 3.3 is the density input; the Research context (lines 1185–1189) then says which inputs need affineness.

## R03 (P3) — `isKernel_diagonalizableMap` assumes an injectivity the statement does not need

**Location.** `TauCetiRoadmap/GroupSchemesOverABase/Suggested.lean` line 142: `theorem isKernel_diagonalizableMap {φ : N →+ M} (hφ : Function.Injective φ) :`; README lines 327–329.

**Claim.** The kernel of `D(φ)` is `D_S(M ⧸ φ.range)` for injective `φ` only.

**Witness.** sga3-8 lines 320–324 (proof of Thm 3.1): for every exact `M′ → M → M″ → 0`, with no zero on the left, `0 → D(M″) → D(M) → D(M′)` is exact. Instance `φ = 0 : ℤ → ℤ`: `D(φ)` is `t ↦ 1` on `𝔾_m`, kernel `𝔾_m = D(ℤ ⧸ 0)`. The binder `hφ` occurs nowhere in the conclusion (signatures file, elaborated type). Re-raised: r6 R04.

**Repair.** `theorem isKernel_diagonalizableMap (φ : N →+ M) : ∃ h : …` with the body unchanged; it elaborates on the probe copy. README 1.4: "For every `φ`, prove `isKernel_diagonalizableMap` (SGA 3, Exp. VIII, 3.1 and its proof); for `φ` injective, prove `flat_surjective_diagonalizableMap` (3.2 a))."

## R04 (P3) — `IsMultiplicativeType.isotrivial_component` is `isotrivial` applied to `U`; delete it

**Location.** `Suggested.lean` lines 203–208 (`(U : S.Opens) (hU : IsClopen (U : Set S)) [ConnectedSpace U] : IsIsotrivial ((baseChange U.ι).obj G)`), docstring line 24, README line 460.

**Claim.** A headline distinct from `IsMultiplicativeType.isotrivial`.

**Witness.** `isotrivial` applied to the scheme `U` (connected, locally noetherian, stalks those of `S`, and `(baseChange U.ι).obj G` of multiplicative type as a base change) gives the conclusion; `IsClopen` is unused: `U = 𝔾_{m,k} ⊂ 𝔸¹_k` is open, connected, not closed, and `G|_U` is isotrivial by 2.5 on `U`. Re-raised: r6 R07.

**Repair.** Delete the declaration from `Suggested.lean` and from the docstring list (the file elaborates without it). README 2.5: drop the backticked name and write "the restriction of `H` to every connected open subscheme is isotrivial (2.5 applied to it)".

## R05 (P3) — Tau Ceti declarations at the pin for 1.3, 1.4, 3.5 and 5.3 are not cited

**Location.** README lines 159–181 (From Tau Ceti), 317 (1.3 route: "`O[M_tor]` is étale iff `|M_tor|` is invertible"), 329–330 (1.4 *Needs:*), 587 (3.5 *Needs:* "3.4"), 868–872 (5.3: "Humphreys, Theorem 1.12").

**Witness.** In the pinned Tau Ceti: `TauCeti.DiagonalizableGroup.isShortExact_mapDomainBialgHom` (`Algebra/AlgebraicGroup/DiagonalizableGroup/Exact.lean` line 69, over every ring); `TauCeti.MonoidAlgebra.etale_of_isUnit_card` (`Algebra/MonoidAlgebra/Etale.lean` line 66); `TauCeti.MonoidAlgebra.faithfullyFlat_mapDomainRingHom_of_injective` (`Algebra/MonoidAlgebra/FaithfullyFlat.lean` line 31); `BialgHom.centralizerHopfIdeal` (`Centralizer/Basic.lean` line 206) and `BialgHom.smoothCommHopfAlgProperty_quotient_centralizerHopfIdeal` (`Centralizer/Smooth.lean` line 290); `BialgHom.weylGroup` (`Normalizer/WeylGroup.lean` line 93); `TauCeti.stabilizer_eq_closure_wallReflections` (`LinearAlgebra/RootSystem/FundamentalDomain.lean` line 201) with `RootPairing.exists_mem_dominantChamber` (`Chamber.lean` line 304). Re-raised: r6 R05.

**Repair.** Add them to the contract with their files and to the *Needs:* lines: 1.3 `etale_of_isUnit_card` (and `smooth_iff_isUnit_card`, `Algebra/MonoidAlgebra/Smooth.lean` line 37, over a field); 1.4 `isShortExact_mapDomainBialgHom` and `faithfullyFlat_mapDomainRingHom_of_injective` as the affine case that base change globalises; 3.5 `centralizerHopfIdeal`, `smoothCommHopfAlgProperty_quotient_centralizerHopfIdeal`, `weylGroup`; 5.3 `stabilizer_eq_closure_wallReflections` with `exists_mem_dominantChamber` on the flipped root pairing on `X_*(T′)`, Humphreys 1.12 staying as the locator.

## R06 (P3) — 4.5–4.8 restate the affine case that Tau Ceti and Mathlib have at the pin

**Location.** README lines 677–678 (4.5 route: "its unit section is a closed immersion"), 717–720 (4.6: "for `G` affine of finite type, it is the identity component of ReductiveGroups Layer 3"), 778–780 (4.8: "For `G` affine of finite type, `π₀(G/k)` is the component group `π₀(G)` of ReductiveGroups Layer 3"); the From Mathlib and From Tau Ceti contracts (lines 143–181).

**Claim.** The affine comparison of 4.6 and 4.8 is a roadmap's (ReductiveGroups Layer 3), and the closed immersion of the unit section is a step to prove.

**Witness.** Mathlib at the pin: `instance (G : Over (Spec (.of K))) [GrpObj G] : IsClosedImmersion η[G].left` (`Mathlib/AlgebraicGeometry/Group/Abelian.lean` line 35). Tau Ceti at the pin, for a finite-type Hopf algebra `H` over an algebraically closed field: `TauCeti.FiniteTypeCommHopfAlgCat.identityComponentSpec` with `identityComponentSpecι` a closed immersion and `geometricallyConnected_identityComponentSpec` (`Algebra/AlgebraicGroup/Connected/GroupScheme.lean` lines 141–181); `componentGroupScheme`, `isFinite_componentGroupScheme`, `etale_componentGroupScheme` (`Connected/ComponentGroup/FiniteEtale.lean` lines 51–75); `componentGroupFppfGroupObjectIso`, the fppf quotient by the identity component represented by the finite constant group (`Representable.lean` line 408); `componentEtaleHomEquiv`, the universal property for étale targets (`UniversalProperty.lean` line 96). ReductiveGroups Layer 3 on main (line 242) plans this bullet in prose; the pinned declarations are the earlier owner.

**Repair.** In 4.5 cite the Mathlib instance for the unit section (the target is then the diagonal argument). In 4.6 and 4.8 write "for `G` affine of finite type over an algebraically closed field, `G⁰` is Tau Ceti's `identityComponentSpec` and `π₀(G/k)` its `componentGroupScheme`, with `componentGroupFppfGroupObjectIso` and `componentEtaleHomEquiv`; 4.6 and 4.8 extend them to every field and to groups locally of finite type, and agree with ReductiveGroups Layer 3 on affine groups". List the five declarations under From Tau Ceti with their files and the Mathlib instance under From Mathlib.

## R07 (P3) — Layers 4–5 use ReductiveGroups Layers 3, 6, 7 without citing them

**Location.** README line 617 (4.1 *Needs:*), 665 (4.4 *Needs:*), 871–872 (5.3 *Needs:*), 182–186 (contract), 52–62 (Layer 8 Scope bullet).

**Witness.** `TauCetiRoadmap/ReductiveGroups/README.md` on main: Layer 3 owns the fppf quotient `G/H` and its representability (lines 237–240), Layer 6 the radical (467–470), Layer 7 the conjugacy of maximal tori and the root datum with its Weyl group (628, 644), Layer 8 extends "the field-level … multiplicative-type comparisons of Layers 3–4" (1048). 4.4 uses the radical and the conjugacy of maximal tori; 5.3 uses `d_s = |Φ| + rank Φ` and the Weyl group. Re-raised: r6 R06 (partly repaired).

**Repair.** 4.1: "For `G` affine this is ReductiveGroups Layer 3's quotient; 4.1 extends it to `G` of finite type", Layer 3 in *Needs:*. 4.4: Layers 6 and 7 in *Needs:*. 5.3: Layer 7. Contract: list Layers 3 (also for 4.1), 6 and 7. Scope, Layer 8 bullet: "Layer 8 extends the multiplicative-type comparisons of its Layers 3–4 to affine Noetherian bases as far as its constructions need; Layers 1–3 here state that theory over an arbitrary base and agree with it there."

## R08 (P3) — Downstream consumers omits PurityForFlatCohomology

**Location.** README lines 1165–1183.

**Witness.** `TauCetiRoadmap/PurityForFlatCohomology/README.md` at the head of #1840: contract lines 454–460 and *Needs:* lines 2067, 2108, 2128, 2147, 2193, 2245, 2286, 2339 consume §§1.3, 1.4, 2.1–2.3, 2.7 here. Remainder of r6 R01.

**Repair.** Add: "PurityForFlatCohomology consumes 1.3, 1.4, 2.1–2.3 and 2.7 (diagonalizable groups, groups of multiplicative type and tori over a base, their character sheaf and the largest subtorus) for its kernel-of-tori presentations and its flat cohomology of tori."

## R09 (P3) — the sources manifest records none of SGA 3 VI_A, VII_A, VIII, EGA II or Milne

**Location.** README lines 1201–1216 (References: SGA 3 Exp. VI_A, VII_A, VIII; Milne 2017; EGA II 7.1.9) against `packages/GroupSchemesOverABase/sources.toml`, whose ids are `conrad-rgs`, `conrad-chevalley`, `steinberg1965`, `fga3`, `sga3-6b`, `sga3-9`, `sga3-10`, `sga3-11`, `sga3-12`, `sga3-19`, `sga3-22`–`sga3-25`, `ega4-4`, `ega4-3`, `sansuc1981`.

**Claim.** Every cited work is recorded in the manifest.

**Witness.** 4.5–4.8 cite SGA 3 VI_A eleven times and Milne thirteen times; 1.1–1.4 cite VIII; the Scope cites VII_A; 5.3 cites EGA II. None has a manifest key, so the gate's source check cannot see them and the next reviewer fetches them again (I fetched VI_A, VII_A and VIII from the editor's page, author-page class, and Milne's preliminary version from the author's page; the published Milne resolves only to a paywalled landing page).

**Repair.** Add to the manifest: `sga3-6a` (Exp6A-13oct24.pdf), `sga3-7a` (Exp7A-13oct24.pdf), `sga3-8` (Exp8-8nov09.pdf) from the editor's SGA 3 page, licence class author-page; `ega2` from Numdam (PMIHES_1961__8__5_0); `milne-ag`, doi 10.1017/9781316711736, status `uncertified`, with a `version_note` that the author's preliminary version 2.00 (jmilne.org, iAG200.pdf) numbers the same statements 1.12, 1.14–1.19 and A.82–A.84.

## Verified sound

### Gate, build, dependency check, signatures, probe

- Worker's gate at 6b17dff: every check passes (`set_option=0 … sorry-data=0 … readme-ids-missing=0 … depcheck=0 … stray-files=0 … build=0 OK`).
- Dependency check with the candidate order and `--movable`: `depcheck: 240 roadmaps, 2437 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The candidate order lists this roadmap at line 52 after AlgebraicModuliForArithmeticGeometry (36), AbelianSchemesAndArithmeticModuli (45), InverseGaloisAndArithmeticFundamentalGroups (48), FiniteFlatGroupsAndIntegralPadicHodgeTheory (50), NeronModelsAndSemistableAbelianVarieties (51). EquivariantIntersectionTheory and PCurvature are open pull requests not yet in the order, cited by section only (EIT for 6.1–6.2, PCurvature as the owner of restricted Lie algebras in the Scope).
- `lake env lean TauCetiRoadmap/GroupSchemesOverABase/Suggested.lean`: 22 `declaration uses sorry` warnings (lines 82, 115, 121, 128, 135, 142, 178, 195, 203, 218, 234, 242, 252, 270, 282, 289, 294, 301, 311, 320, 328, 340), nothing else, exit 0.
- Signatures: `#check @name` for all 30 declarations in one scratch copy, elaborated once; every README binder is present: the seven new theorems carry `[Field k]`, `[PerfectField k]` (4.5 `smooth_of_isReduced`, `exists_reduced_subgroup`), `[LocallyOfFiniteType G.X.hom]` (all of 4.5–4.8 except `isSeparated_of_field`, which the source states without finiteness), `[IsReduced G.X.left]`, `[QuasiCompact X.hom]` (4.7); the 23 older ones as in the previous review. Nothing lost; the only unused binder is R03's.
- One-tactic probe: each of the 22 sorried theorems replaced by `first | infer_instance | simp | rfl | assumption` on the scratch copy: all 22 fail (22 errors, no declaration closes). Padding by reading: only R04.
- Nothing changes outside the folder (`git diff --stat origin/main...HEAD` without the folder is empty); `metadata.toml` is `topic = "math.AG"`; no `set_option`, no `lemma`, imports are `Mathlib` plus two existing `TauCeti.*` modules.

### Seeded sample of locators (15 targets) and the new targets

| Target | Passages read | Result |
| --- | --- | --- |
| 0.2 | sga3-6b 808–810 (Prop. 3.9: `G⁰ → G` open immersion, quasi-compact, for `G` locally of finite presentation), 821–826 (Thm 3.10 (i)⇔(iv)) | correct |
| 1.4 | sga3-8 304–310 (Thm 3.1 (i)), 320–324 (kernel for any `φ`), 329–339 (Cor. 3.2 a), `S` nonempty) | correct; R03 |
| 1.6 | SchemeAndStackFoundations main §2.3 (line 3330), §2.11 (3656); Kummer and `H¹(ℤ, μ₂)` recomputed (rows 8–9) | correct |
| 2.1 | sga3-9 11–23 (Déf. 1.1: fpqc-locally diagonalizable; isotrivial = finite étale surjective); FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.4 at #879 (line 805) | correct |
| 2.4 | sga3-10 45–54 (Cor. 1.2), 61–67 (Prop. 1.4) | correct |
| 2.6 | sga3-10 89–100 (1.6: rank-two non-isotrivial torus on a nodal curve from the connected `ℤ`-torsor glued from copies of the normalisation); InverseGalois… IG.0.3 (674), IG.0.4 (858) at #850 | correct |
| 3.2 | sga3-9 732–735 (Thm 5.1: `S` locally noetherian or `G` of finite presentation, `u_s` central), 783–785 (Cor. 5.3: `G` separated, locus open and closed); `H′` of multiplicative type is commutative and of finite presentation, so both hypotheses hold | correct |
| 3.5 | sga3-11 1046–1048 (Cor. 5.3), 1101–1104 (5.3 bis), 1150–1157 (Prop. 5.9: `G` smooth affine) | correct; R02 for its use in 5.3 |
| 4.4 | sga3-10 1486–1500 (8.7: `ρ_ab`, `ρ_r`, `ρ_n`, `d_s`, `ρ_u = ρ_n − ρ_r − ρ_ab`); sga3-12 106–112 (Déf. 1.5, invariance under extension) | correct |
| 4.5 | sga3-6a 59–68 (0.3, separatedness by the unit section and `(x, y) ↦ xy⁻¹`), 41–47 (0.2: `G_red` a subgroup over a perfect field, not normal, the `D_k(ℤ/3) ⋊ (ℤ/2)_k` example), 220–242 (Prop. 1.3.1: reduced over the perfect closure ⇔ smooth), 250–256 (1.3.2 (1): `X^{p²} − tX^p`, `G_red = Spec k[X]/X(X^{p(p−1)} − t)`); sga3-6b 1026–1029 (5.2), 1417–1421 (5.6.4); milne-iag 767 (Prop. 1.12 separated), 830–836 (Prop. 1.18), 843–850 (Ex. 1.19, `Y^p − aX^p`) | correct (published Milne numbers not verifiable) |
| 4.6 | sga3-6a 388–389 (2.3.1: open invariant subgroup), 390–402 (2.4: irreducible, geometrically irreducible, quasi-compact; proof via `(G_k̄)_red` smooth and 0.5.1), 403–404 (2.4.1), 284–286 (2.1.1), 127–130 (0.5.1); milne-iag 785–812 (1.14–1.17) | correct |
| 4.7 | milne-iag 21039–21054 (A.82–A.84: `π₀(X)` universal among maps to zero-dimensional varieties, fibres the connected components, base change, products), 788–806 (Lemma 1.15) | correct (published numbers not verifiable) |
| 4.8 | sga3-6a 1449–1454 (5.5.1 (i) étale, (ii) constant over `k̄`), 1091–1111 (3.3.2: `F\G` separated, `p` faithfully flat, group structure for `F` invariant) | correct |
| 5.2 | sga3-12 124–135 (Thm 1.7 b)), 213–218 (Cor. 1.10), 1189–1203 (Thm 7.1 a), b)); 113–118 (1.6: the `𝔾_m`/`𝔾_a` group with no maximal torus) | correct |
| 5.4 | sga3-12 127–129 (Thm 1.7 a), `G` affine smooth) | correct |
| 6.2 | EquivariantIntersectionTheory 1.3 at #1685 (line 312); SchubertGeometry main S7 first item (95); Popov, Sansuc not read | sequence recomputed (row 27) |
| 6.3 | own route; SchemeAndStackFoundations §3.4 (4789) | recomputed (row 28) |
| 7.6 | steinberg1965 42–43 (Thm 1.1: regular iff finitely many Borel subgroups); Slodowy not read | correct |
| Scope (VII_A) | sga3-7a 1873–1880 (6.1), 2086 (Thm 7.2), 2271–2290 (7.4), 2402–2404 (8.1.2) | correct |

### Library declarations opened at the pins (14, beyond the 30 checked)

- Mathlib: `smooth_of_grpObj` (`AlgebraicGeometry/Group/Smooth.lean` 62: `[GeometricallyReduced f]`, `[LocallyOfFiniteType f]`, over a field); the unit-section closed-immersion instance (`Group/Abelian.lean` 35); `GeometricallyConnected`, `GeometricallyIrreducible`, `GeometricallyReduced` (`Geometrically/{Connected,Irreducible,Reduced}.lean` 40, 42, 44: for every `Spec K ⟶ Y`, `K` a field, the base change is connected / irreducible / reduced).
- Tau Ceti: `smoothCommHopfAlgProperty_of_geometricallyReduced` (`Smooth/GeometricallyReduced.lean` 79), `geometricallyConnectedCommHopfAlgProperty.irreducibleSpace` (`Connected/Irreducible.lean` 92), `galoisFiber` (`RingTheory/Etale/Galois.lean` 277), `isEquivalence_galoisFiber` (467, `[IsSepClosed Ω] [IsGalois K Ω]`), `FiniteEtaleScheme.galoisEquivalence` (`FiniteEtale/Galois/Basic.lean` 95), `galoisEquivalenceGrp` (179); and the component-group files of R06.

### Cross-roadmap citations resolved (26)

On main: ReductiveGroups Layer 2 `Lie(G)` (228), Layer 3 identity-component bullet (242–247), Layers 3/6/7 (237, 467, 628, 644), Layer 8 bullet (1028), 9B; SchemeAndStackFoundations §§0.6, 0.9, 1.17, 2.3, 2.9, 2.11, 3.4 (678, 848, 2624, 3330, 3582, 3656, 4789); ModularCurves 0B, 0C, 0E; SchubertGeometry S3 first item (48), S7 first item (95); FlagVarieties (19). At open heads: EquivariantIntersectionTheory #1685 1.1 (268), 1.3 (312), consumer note (588); PCurvature #1747 Layer 0 (145, 176: restricted Lie algebras); PurityForFlatCohomology #1840 (454–460, 2046–2067); FiniteFlatGroups… #879 R07.1.4 (805); InverseGalois… #850 IG.0.3 (674), IG.0.4 (858); NeronModels… #852 2.3 (1232), GS4.2 note (47); AbelianSchemes… #849 A0.1 (589), A4.1 (1822); AlgebraicModuli… #853 §7.9 (9792); SpringerResolution… #1828 (10–11).

### Ownership against open pull requests

Searched the 468 open heads and main by object: `π₀(X/k)`, "scheme of connected components", "largest étale subalgebra", `G_red` as a subgroup, with the roadmap grep: only this roadmap states them. The previous round's searches (multiplicative type, isotriviality, Steinberg map and section, universal centralizer, Grothendieck–Springer, specialization inequalities, affinization, Chevalley) stand; the second owner found then (PurityForFlatCohomology) now consumes these targets (R08).

### Adversarial table

| # | Statement | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| 1 | `exists_identityComponent` (0.2) | `𝔾_{m,S}`; `(ℤ/2)_S`; `μ₂/ℤ` | `G⁰ = G`; unit component of `S ⊔ S`; `μ₂` not smooth (fibre at `2` is `𝔽₂[t]/(t−1)²`), and the union of fibrewise identity components has complement `V(t+1)` minus its point at `2`, not closed | ok |
| 2 | `bijective_diagonalizableMap` | `Spec(k×k)`; `∅`; `Hom(μ₂, 𝔾_m)` | `ℤ²` vs `ℤ`, excluded by `ConnectedSpace`; one map vs many, excluded; `{ζ ↦ ζ^a} = Hom(ℤ, ℤ/2)` | ok |
| 3 | `smooth_diagonalizable_iff`, `etale_diagonalizable_iff` | `ℤ/6` over `ℤ`, `ℤ/p` over `𝔽_p`, `M = ℤ`, `M = 0` | `6 = 0` in `𝔽₂, 𝔽₃`; `𝔽_p[t]/(t−1)^p` non-reduced; `𝔾_m` smooth never étale; `D(0) = S` | ok |
| 4 | `flat_surjective_diagonalizableMap` | `n·id`; `0 → ℤ`; `ℤ → 0` | `ℤ[t^{±1}]` free on `1, …, t^{n−1}` over `ℤ[t^{±n}]`; `𝔾_m → S`; unit section not flat, excluded by `hφ` | ok |
| 5 | `isKernel_diagonalizableMap` | `φ = 0 : ℤ → ℤ`; `ℤ → 0`; `ℤ² → ℤ` sum | `ker(t ↦ 1) = 𝔾_m = D(ℤ/0)`; `ker(S → 𝔾_m) = S`; `ker(t ↦ (t,t)) = 1 = D(ℤ/ℤ)`: true without `hφ` | R03 |
| 6 | 1.1 vs ModularCurves 0B | `ℤ/N` | `O_S[t]/(t^N − 1)` both sides | ok |
| 7 | `IsMultiplicativeType`, `IsTorus` | `μ_p/𝔽_p`; `𝔾_a`; norm-one torus/`ℝ`; `M = 0` | `ℤ/p` not free; `Hom(𝔾_a, 𝔾_m) = 0`; split by `ℂ`, no nontrivial character over `ℝ`; rank-`0` torus | ok |
| 8 | 1.6 Kummer | `k`, any `n` | `1 → μ_n → 𝔾_m → 𝔾_m → 1` fppf-exact, `H¹(k, 𝔾_m) = 0`, so `H¹(k, μ_n) = k^×/k^{×n}` | ok |
| 9 | 1.6 `H¹(ℤ, μ₂)` | `ℤ` | `ℤ^×/ℤ^{×2} = {±1} → H¹ → Pic(ℤ)[2] = 0` | ok |
| 10 | `exists_etale_cover` | `μ_n/ℤ`; Kummer over `𝔽₂` | identity cover; `t ↦ t²` fppf, not étale | ok |
| 11 | 2.3, 2.4 | `Spec(k×k)` with `𝔾_m ⊔ 𝔾_m²`; `μ₃/ℚ` | ranks `1, 2`, non-constant; `σ ∘ ι ∘ σ⁻¹ = ι`, trivial action on `X*(μ₃)` | ok |
| 12 | `IsMultiplicativeType.isotrivial` | `Spec k`; nodal curve; `Spec(k×k)` | split by finite separable `k′`; not normal, excluded; not connected, excluded | ok |
| 13 | `isotrivial_component` | `U = 𝔾_{m,k} ⊂ 𝔸¹_k` | isotrivial by `isotrivial` on `U`; `IsClopen` unused | R04 |
| 14 | `exists_torus_not_isotrivial` | `n`-cycle cover; infinite chain; identity gluing | monodromy `[[1,n],[0,1]] ≠ 1`; split; `𝔾_m²` | ok |
| 15 | `bijective_baseChange_map_of_thickening` | `Spec k ↪ Spec k[ε]`; `Spec k ↪ 𝔸¹`; `𝔾_a` | `End(𝔾_m) = ℤ` both sides; not surjective, excluded; `t ↦ (1+ε)t` lifts the identity, excluded | ok |
| 16 | `hom_eq_of_eq_fibre` | `t, t⁻¹` on `𝔾_m/ℤ`; `Spec(k×k)`; `GL₂`-valued subtori over `𝔸¹` | differ on every fibre; agree at one point, excluded; `diag(t,1)` and its `g_a`-conjugate agree at `a = 0`, excluded by the target | ok |
| 17 | `eq_of_eq_on_torsion` | `n = 0`; `μ_n`; `𝔾_a`, char `0` | `H[0] = H`, excluded by `0 < n`; `H[n] = H`; `𝔾_a[n] = 1`, excluded | ok |
| 18 | `chevalley`, 4.2 Check 3 | `A × 𝔾_m`; `A[2] × 𝔾_m`, char `3` and char `2` supersingular | `L = 𝔾_m`; `2^{2g}` components, excluded; `A[2]` infinitesimal, connected, not smooth | ok |
| 19 | `affinization` | `(ℤ/2)_k`; `α_p`; non-split extension of `A` by `𝔾_a`, char `0` | `O = k × k`; `k[t]/(t^p)`; `O = k`, `G → Spec k` faithfully flat | ok |
| 20 | `isSeparated_of_field` | trivial group; `ℤ_k`; the VI_B 5.6.4 group | `Spec k` separated; disjoint union of `Spec k`, diagonal closed; non-separated only over a base with a non-isolated closed point, excluded by the field | ok |
| 21 | `smooth_of_isReduced` | `μ_p/𝔽_p`; `Y^p = tX^p` over imperfect `k`; `ℤ_k` | not reduced, excluded; reduced (`Y^p − tX^p` irreducible, `t ∉ k^p`), `(Y − t^{1/p}X)^p` over `k(t^{1/p})`, not smooth, excluded by `PerfectField`; étale | ok |
| 22 | `exists_reduced_subgroup` | `μ_p/𝔽_p`; `μ₃ ⋊ ℤ/2` over `𝔽₃`; `X^{p²} = tX^p` over imperfect `k` | `H = Spec 𝔽_p`, surjective onto the one point; `H = ℤ/2`, smooth, not normal; `k[X]/(X(X^{p(p−1)} − t))` reduced (each root has inseparable degree exactly `p`), not a subgroup, excluded by `PerfectField`; a reduced closed subscheme with the same underlying space is `G_red`, so `H` is determined | ok |
| 23 | `exists_identityComponent_of_field` | `μ₃/ℚ`; `ℤ_k`; `μ_p/𝔽_p` | `G⁰ = Spec ℚ`, other component `t² + t + 1 = 0` splits over `ℚ(ζ₃)`; `G⁰ = e`, quasi-compact though `G` is not; `G⁰ = μ_p`, one point, geometrically irreducible; an open connected subgroup is closed (VI_A 0.5.2), hence `G⁰` | ok |
| 24 | `isIrreducible_connectedComponent` | `Spec k[x,y]/(xy)`; `O_n`, char `≠ 2` | connected reducible, not a group, excluded; components `SO_n` and its coset, irreducible | ok |
| 25 | `exists_connectedComponentScheme` | `∅`; `Spec ℚ(i)`; `Spec k[x]/(x²)`; `Spec k(t^{1/p})`; `Spec ℝ[x,y]/(x²+y²)` | `P = ∅`, fibres vacuous, `Hom(∅, E)` singleton both sides; `P = X`, `P = Spec ℚ` fails (`Hom(Spec ℚ, Spec ℚ(i)) = ∅`); `P = Spec k`, fibre `X` connected, `Hom(Spec k, E) ≅ Hom(X, E)` by formal étaleness; `P = Spec k`, fibre `Spec(k′ ⊗ K)` one prime; irreducible over `ℝ`, two lines over `ℂ`, `P = Spec ℝ` | ok |
| 26 | `exists_componentGroup` | `ℤ_k`; `μ₃/ℚ`; `μ_p/𝔽_p`; `𝔾_m ⋊ ℤ/2` | `E = ℤ_k`, `q = id`, kernel `e`; `E = μ₃`, `E = 1` fails universality (`id` does not factor); `E = Spec 𝔽_p`, every map `μ_p → E′` étale lands in the open `Spec 𝔽_p ∋ e`, kernel `μ_p` connected; `E = ℤ/2`, kernel `𝔾_m` open connected; `E = G` for `𝔾_m` fails `Etale` | ok |
| 27 | 6.2 | `SL₂`; `PGL₂`; `GL_n`; torus | `P/X*(T_der) = 0`; `ℤϖ/2ℤϖ = ℤ/2`; `0`, kernel `ℤ det`; `Pic(Spec k) = 0`, `X*(G) = X*(T)` | ok |
| 28 | 6.3 | `Spec k`; `SL₂`; `GL₂` | 6.2; `Pic(ℙ¹_S) = Pic(S) ⊕ ℤ`; `det ↦ 0`, `O(D_α) ↦ 1`, big cell `𝔸^N_S` with `Pic = Pic(S)` for `S` normal | ok |
| 29 | 4.4 Checks, Layer 4 Examples | elliptic curve; `𝔾_m`, `𝔾_a`; `GL_n`; `B ⊂ GL₂`; `O_n` | `(ρ_ab, ρ_r, ρ_n, ρ_u, d_s) = (1,0,1,0,0)`; `(0,1,1,0)`, `(0,0,1,1)`; `(0,n,n,0,n²−1)`; `(0,2,2,0,0)`; `G⁰ = SO_n`, `π₀ = μ₂` by `det` (`O₁ = μ₂`, `SO₁ = 1`) | ok |
| 30 | 5.2, 5.4 Checks | `G^(p)` over `ℤ_p`; `G^(λ)` | XII 1.6 is this group, no maximal torus; `t ↦ 1 + λt` gives `𝔾_m` on `D(λ)`, `𝔾_a` on `V(λ)` | ok |
| 31 | 5.3, non-affine route | X 8.3 group (elliptic curve → `𝔾_m`) | `(ρ_ab, ρ_r, ρ_n, ρ_u)`: `(1,0,1,0) → (0,1,1,0)`, inequalities hold; 3.5 needs `G` affine | R02 |
| 32 | 5.5 Check | class `ω`, supersingular surface with `a = 1` | `F` of rank `1`, `F(ω̄) ≠ 0` for `ω̄ ∉ ker F`, `P = x^{p²}` | R01 |
| 33 | 7.6 Checks | `SL₂` regular semisimple `x` (eigenvalues `t ≠ t⁻¹`); regular unipotent | fibre of `t ↦ t + t⁻¹` is `{t, t⁻¹}`, two Borel subgroups; fibre over `2` is `k[t]/(t−1)²`, one Borel subgroup | ok |
| 34 | 4.8 Check (`μ₃/ℚ`) | `μ₃` | two connected components, `π₀ = μ₃` of order `3` | ok |

## Not verifiable

- **Milne, Algebraic groups (CUP 2017), published numbering** (Props. 1.22, 1.26, 1.29–1.31, 1.34, 2.37; Ex. 1.27; Rem. 1.33; Cors. 1.35, 1.39; Summary 1.36): the DOI resolves only to a paywalled landing page. The statements were checked in the author's preliminary version 2.00 (jmilne.org, author page), where they are Prop. 1.12 (separated), 1.14–1.17 (identity component), 1.18 (reduced and perfect ⇒ geometrically reduced ⇒ smooth), Ex. 1.19, A.82–A.84 (`π₀(X)`); the published numbers are cited by locator only.
- **Popov 1974 §4, Sansuc 1981 §6** (6.2): the cached `sansuc1981` is the GDZ landing page without the article; the sequence was checked on examples (row 27).
- **Book sources cited by locator only**: Humphreys Thm 1.12 (the pinned Tau Ceti theorem of R05 supplies it), Jantzen II.1.8, II.4.4, Bourbaki Lie VI §3 no. 4 Thm 1, Demazure–Gabriel III §3 5.4, 8.2, Slodowy ch. 3–4, EGA II 7.1.9 (not re-read this round; checked in the previous review).
- **SGA 3 VI_A 3.2** as cited in 4.1: the re-edition's statement numbered 3.3.2 (sga3-6a lines 1091–1111) carries the content; the heading "Théorème 3.2" did not survive extraction, and 4.1 is outside the sample.

## Source issues

- **Gap** in sga3-10 at Remarques 8.7, printed pages 97–98 (lines 1501–1515, editors' notes (69) at 1489 and (71) at 1515): the source states the five specialization inequalities for every smooth group over a discrete valuation ring without proof, and its editors ask for a reference; it should give a proof or a reference (the seminar proves only the affine `ρ_r`, `ρ_n` cases, lines 1520–1523); affects a stated result.

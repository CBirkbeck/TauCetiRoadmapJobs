<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1109#issuecomment-6409687830 -->
Red team round 1 pass b (claude) of 74a0736

Verdict: accepted

1. **F01** (P3) Exposé VIII §1.2 cited at the line of Exposé X Theorem 3.1.5

   **Location.** `packages/AdicCoefficientsAndComparisonsPartII/README.md` line 1043: "ilo14, Exposé VIII, §1.2, arXiv v1 p. 86 (ilo14 line 7194)".

   **Claim.** The line locator does not point at VIII §1.2.

   **Witness.** ilo14 line 7194 is X Theorem 3.1.5 (the inertia-specializing extension, already cited separately in the same parenthesis); VIII 1.2(a), the ±1-on-A² example that the paragraph at line 1045 restates, is ilo14 line 3705.

   **Repair.** Replace "(ilo14 line 7194)" at the end of line 1043 by "(ilo14 line 3705)". Tested: lines 3705–3712 contain the trivial-log sign action with T = {0}, the blow-up f and the log regular pair (X′, Z′) used at line 1045; nothing else changes.

2. **F02** (P3) temkin17 §1.2.7 cited at the line of Remark 1.2.6

   **Location.** `packages/AdicCoefficientsAndComparisonsPartII/README.md` lines 95, 963, 974: "temkin17 §1.2.7, pp. 99–100, temkin17 line 117".

   **Claim.** Line 117 is not in §1.2.7.

   **Witness.** temkin17 lines 114–118 are Remark 1.2.6(i)–(ii) (the dependence on the Cossart–Piltant preprint); "1.2.7. Log smoothness" begins at line 119, and the boundary structure O_X ∩ i_*O_U^× with the remark that it need not be fine, cited at lines 95 and 974, is at lines 126–128.

   **Repair.** Replace "temkin17 line 117" by "temkin17 line 119" at lines 95 and 963, and by "temkin17 line 126" at line 974 (where the non-fineness of the cusp boundary is the cited fact). Tested against the cusp Check at line 969: the cited passage is the one that states the boundary structure is in general not fine.

3. **F03** (P3) temkin10 §3.2 cited at a §3.1 line

   **Location.** `packages/AdicCoefficientsAndComparisonsPartII/README.md` lines 465, 523, 633: "temkin10, §3.2, arXiv v3 (temkin10 line 665)".

   **Claim.** Line 665 lies in §3.1.

   **Witness.** temkin10 line 665 is the limit argument on P-morphisms of §3.1 (EGA IV 9.7.7); "3.2. Absolute Riemann-Zariski spaces" is line 679, Corollary 3.2.4 (stalks are valuation rings) line 735, and the definition of Val_K(S) line 742. This is finding F01 of the accepting review of this head, not yet applied.

   **Repair.** Replace "temkin10 line 665" by "temkin10 line 679" at lines 465 and 633 and by "temkin10 line 742" at line 523. Tested: the objects cited there (modifications of a pointed scheme, the valuative points, the cofinality of projective models) are stated at those lines.

4. **F04** (P3) Log blow-up universal property asserted as supplied beside its gap

   **Location.** `packages/AdicCoefficientsAndComparisonsPartII/README.md` line 103: "The fine log blow-up of a coherent log ideal I is universal among maps on which its pullback becomes invertible; its saturated form is the fs saturation."

   **Claim.** Inside the LefschetzPencilsAndVanishingCycles contract this sentence reads as a property §0.10 already supplies; line 105 declares exactly this property as `gap:log-blowup-universal-property`.

   **Witness.** LefschetzPencilsAndVanishingCycles at its open head, §0.10 (roadmap-service print line 725): "On this carrier build log blow-ups and finite-group actions"; no universal property and no saturation statement in lines 697–830. Finding F02 of the accepting review of this head, not yet applied.

   **Repair.** Begin line 103 with "Through gap:log-blowup-universal-property, the fine log blow-up of a coherent log ideal I is universal …", keeping the ilo14 VIII §§3.3.7–3.3.11 locator. Tested on the unit ideal (identity) and the empty ideal (empty blow-up) of line 105: unchanged.

5. **F05** (P3) Constructible continuity used in §1.7 is stated only under finite type

   **Location.** `packages/AdicCoefficientsAndComparisonsPartII/README.md` line 609: "Val_K(X)′ is the image of the constructibly compact Val_K(X) (§PA.1.4) under a continuous map, hence constructibly compact"; line 552 (§1.5) states only "a compatible morphism of locally ringed spaces RZ_L(Y) → RZ_K(X)"; line 580 (§1.6) gives constructible continuity only when Y → X is of finite type.

   **Claim.** §1.7 needs continuity of Val_K(X) → Val_K = Val_K(Spec Z) in the constructible topology for every qcqs X (its hypotheses at line 596 are "K a field; ε a pointed scheme"), but no target states it at that generality: §1.5 gives Zariski continuity (a morphism of locally ringed spaces) and §1.6 assumes X → Spec Z of finite type.

   **Witness.** X = Spec Z_(p), K = Q (Check at line 527) or X = Spec of any field extension of Q of infinite type: neither is of finite type over Spec Z, so §1.6 does not apply, while the compactness of Val_K(X)′ is asserted. The fact itself is true: for tight modifications Y_j → X_i the map is qcqs, and preimages of constructible sets under qcqs morphisms are constructible (the same reduction to preimages from tight modifications is the opening of temkin17's proof of Lemma 3.1.6, lines 717–720).

   **Repair.** Add to the API list of §1.5 (after line 561) the bullet "The limit map RZ_L(Y) → RZ_K(X) is continuous for the constructible topologies as well: a constructible subset π_i⁻¹(C) of RZ_K(X) pulls back to λ_j⁻¹(g⁻¹(C)) for a tight Y_j → X_i, and g is quasi-compact and quasi-separated, so g⁻¹(C) is constructible", and in §1.7 (line 609) replace "under a continuous map" by "under the map of §PA.1.5, continuous in the constructible topology". Tested on X = Spec Z_(p), K = Q: ψ sends {Q, Z_(p)} into Val_Q by the identity on each element, and the preimage of the constructible {V : 1/p ∈ V} is {Q}, open and closed in the two-point constructible topology.

6. **F06** (P3) Functoriality of the monoidal desingularization phrased as a strict transform

   **Location.** `packages/AdicCoefficientsAndComparisonsPartII/README.md` line 1010: "for monoidally smooth φ : Y → X, F̃^log(Y) is the contraction of the strict transform of F̃^log(X), and for strict φ it is the pullback".

   **Claim.** ILO's functoriality is the contraction of the pullback (fs base change) of the saturated log blow-up tower, for every monoidally smooth φ; "strict transform" names a different operation (the closure of the preimage of the complement of the centre), and the clause "for strict φ it is the pullback" repeats the special case r = 0 as if it were a different rule.

   **Witness.** ilo14 line 4851–4853 (Theorem 3.3.15): F̃^log(X, M) "is the contraction of c^*(F̃^fan(F))" for a fan chart c; lines 4867–4868 and 4886–4890 (its proof): the claim compared for a monoidally smooth f is the equality of the contracted pullbacks d^*(F^fan(G)) and c^*(F^fan(F)). No strict transform appears.

   **Repair.** Replace the quoted clause at line 1010 by "for monoidally smooth φ : Y → X, F̃^log(Y) is the contraction (removal of the empty blow-ups) of the fs pullback along φ of the saturated log blow-up tower F̃^log(X); for strict φ the pullback is already contracted". Tested on the strict closed immersion Spec k → A¹_k of the Check at line 1026 (both towers are the identity) and on the projection (A²_k, V(xy)) → (A¹_k, V(t)) of line 1027 (F̃^log(A¹) is the identity, its pullback is the identity of A², which is F̃^log(A²) since V(xy) is already snc): both agree with the repaired wording.

7. **F07** (P3) Downstream consumers omit the earlier roadmap that consumes §PA.6.3

   **Location.** `packages/AdicCoefficientsAndComparisonsPartII/README.md` line 1621 (Downstream consumers) names Jannsen's argument, LogicAndDefinabilityInNumberTheoryPartII §2.1 and EtaleDualityAndPerverseSheavesPartII.

   **Claim.** MotivesAndAlgebraicCycles §0.5c (open head, roadmap-service print lines 168–176) constructs `pAlterationSupport` by "Apply Temkin's perfect-field theorem over the perfection and descend", citing temkin17 Theorem 4.3.1 (its line 1694), with no supplier named; that theorem is §PA.6.3 here. MotivesAndAlgebraicCycles is at merge-order position 86, this roadmap at 122, so the consumption runs upward; the README does not record the consumer, and the intake cannot see the inversion from this package.

   **Witness.** ORDER.txt lines 86 and 122; MotivesAndAlgebraicCycles §0.5c text as quoted; no occurrence of "PrimeToDegreeAlterations" or "AdicCoefficientsAndComparisonsPartII" in that README (roadmap-service grep).

   **Repair.** Add to line 1621, after the LogicAndDefinabilityInNumberTheoryPartII sentence: "MotivesAndAlgebraicCycles §0.5c (`pAlterationSupport`) consumes the perfect-field separable alteration of §PA.6.3, applied over the perfection of its ground field." The merge-order inversion is for the intake, not for this README; nothing here depends on MotivesAndAlgebraicCycles, so the dependency check is unchanged (output below).

Reviewed at the pull request's current head `74a0736` (checkout equal to the head of the board pull request, working tree clean). Seven findings, all P3; no P1 or P2. No pass-a report exists on the pull request: the only red-team comment is the pass-a brief posted by the board (job RT-AdicCoefficientsAndComparisonsPartII~1a), with no `Red team round 1 pass a` reply, so there are no pass-a findings to confirm. The two P3 findings of the accepting review of this head (F01 temkin10 locator, F02 line 103) are unrepaired at `74a0736`; both are confirmed below as R03 and R04.

## Verified sound

Counts: 0 Lean declarations (the file declares only the namespace; its module docstring lists 31 headline families, each read against its README section); 64 README sections read in full (PA.0.1–0.12, PA.1.1–1.8, PA.2.1–2.6, PA.3.1–3.7, PA.4.1–4.8, PA.5.1–5.6 with 5.2a, 5.2b, 5.5a, PA.6.1–6.12 with 6.11a, 6.11b) plus Summary, Scope, Conventions, the seven supplier contracts, Downstream consumers and Worked examples; 138 line locators opened in the cached texts (temkin17 41, ilo14 46, temkin10 21, dejong96 7, moretbailly89 10, cjs 2, cp19 3, dp23 1, jannsen16 1, stacks 13 across the Fields, Varieties, More on Flatness, More on Morphisms and Resolution of Surfaces extractions); 52 Checks recomputed (table below); 71 cross-roadmap citations resolved (SchemeAndStackFoundations 20 sections and 14 names on main, LocalFieldsRamificationPartII 18 slugs in the board design, CrystallineCohomology 13 target names at its open head, LefschetzPencilsAndVanishingCycles 3 names and §0.10, ClassicalAdicEtaleCohomology §2.4, EtaleCohomologyFoundations §F.0.A1 and 2 names, StableReduction Layers 2–4, AdicCoefficientsAndComparisons L5); 54 pinned declarations grepped (41 Mathlib, 13 Tau Ceti) at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (the lake-manifest pins, checked out locally and confirmed by `git rev-parse`).

### Statements against their sources

| Section | Source statement opened | Agreement |
|---|---|---|
| 0.1 | temkin17 lines 71–73 (char(X)); §4.3.2 lines 1107–1117 (finiteness of char(S) ∖ char(X)) | Exact; the finiteness proof route (Chevalley plus Krull on characteristic-zero components) recomputed below |
| 0.2, 0.3 | temkin17 lines 971–981 (§§4.1.1–4.1.2); ilo14 lines 7288–7292 (X 3.3.1) | Alteration = proper, surjective, maximally dominating, generically finite; both sources agree with line 201 |
| 0.4 | temkin17 line 71; ilo14 7291 (ℓ′-alteration by residue degrees at maximal points) | Exact |
| 0.5 | ilo14 lines 7223–7244 (3.1.6, Remark 3.1.7(ii)); temkin17 992 | Separated pseudo-projective ⇔ quasi-projective, proper ⇔ projective, as at line 267 |
| 0.6 | stacks More on Flatness 4197–4206 (0815), 4250–4255 (081R) | Hypotheses (i) and (ii) at line 298 are the sources' lists verbatim in content |
| 0.7 | ilo14 7246–7249 (X 3.1.8), 7259–7262 (3.1.9) | Exact, including "blow up along a finitely generated ideal with nowhere dense support" |
| 0.8, 0.9 | ilo14 7304–7310 (X 3.3.3); temkin17 986–991 (4.1.4) | Projective sense is ILO's, proper sense Temkin's, as line 356 says |
| 0.10, 0.11 | ilo14 7318–7322; stacks Resolution of Surfaces 1880 (0BGP), 488 (0BBS), 1752 (0BGL); cjs 131–142 (Cor. 0.4), 39–43 | Lipman (4) ⇒ (3) with the three conditions; CJS Corollary 0.4 for regular excellent Z of any dimension and reduced X of dimension ≤ 2 |
| 0.12 | cp19 93–102 (Thm 1.1), 111–113 (Cor. 1.2), 124–132 (Remark 1.4) | Separated, reduced, qe, dim ≤ 3, proper birational; projective over a *specified* affine cover, so a one-member cover for affine Y is legitimate |
| 1.1–1.4 | temkin17 645–662, 663–666, 667–680 (Lemma 3.1.3); temkin10 679, 735, 742 | Exact (R03 for the temkin10 lines) |
| 1.5, 1.6 | temkin17 686–706, 707–720 (Lemma 3.1.6: Y → X of finite type) | Exact; R05 on the continuity used in 1.7 |
| 1.7, 1.8 | temkin17 760–771; ClassicalAdicEtaleCohomology §2.4 at its head (print lines 918–928: integral X, f projective in EGA's sense, g dominant) | The limit of projective integral models is the cited object; no second Zariski–Riemann carrier |
| 2.1–2.4 | temkin17 772–777, 778–802 (incl. Lemma 3.2.5, Remark 3.2.6 at 796), 803–816 (3.2.8), 817–849 (3.2.10) | Exact |
| 2.5 | temkin17 858–882 (Theorem 3.2.12 and proof) | Statement and the "moreover" clause exact; the proof's finite-stage step (line 875–876) is restated at line 747 at the same generality |
| 2.6, 3.7 | derived variants, declared as such at lines 763 and 930 | The derivation uses GF.0/separably-p-closed and GF.2/perfection-tame-tower; separable P-closedness ⇔ P-closedness of the perfection recomputed below |
| 3.1 | temkin17 889–893 (3.3.2); ilo14 7160–7191 (X 3.1.1–3.1.4) | Tameness and inertia as in both; the noetherian hypothesis at line 791 is the roadmap's correction of ILO X 3.1.3 (source issue below) |
| 3.2 | temkin17 884–899 (3.3.1, 3.3.3); dejong96 1447 (7.3) | Galois with G = Aut_X(Y), exactly Temkin's convention; ILO's separable G-alteration (7293–7296) restated at line 820 |
| 3.3–3.6 | temkin17 936–938, 850–855, 903–906 (3.3.4: noetherian universally Japanese integral), 939–943 (3.3.6), 960–963 (3.3.7) | Exact |
| 4.1 | ilo14 3050–3075 (VI 1.2–1.4), 7271–7275 (X 3.2.1); temkin17 126–128 | Exact (R02) |
| 4.2, 4.3 | ilo14 4761 (3.3.7), 4910–4940 (3.4.2, 3.4.6), 4451 (3.1.19), 4847–4868 (3.3.14–3.3.15), 4967 (3.4.9) | Exact except the wording of functoriality (R06) |
| 4.4–4.6 | ilo14 3681–3692 (VIII 1.1), 7194–7215 (X 3.1.5), 6149 (X 1.2), 6117 (X 1.1), 6778 (1.11) | Hypotheses at lines 1037, 1051 and 1073 are the sources' (inertia specializing replacing separatedness as X 3.1.5 states) |
| 4.7, 4.8 | ilo14 7655 (3.5.2), 6965–6970 (2.3 Step 3), 6994–7000 (2.4(ii)), 7127–7138 (2.6 Step 3) | Local form exact, total boundary V(t₁⋯t_m) versus horizontal V(t_{r+1}⋯t_m) distinguished correctly at lines 1099 and 1494 |
| 5.1, 5.2 | temkin10 57–78 (multipointed curves, modifications, semistability, exceptional components), 104–106 (Thm 1.1) | Exact, including "contracted to a point of C_s" |
| 5.2a, 5.2b | temkin10 313–316, 2011–2024 (types), 2025 (k-split), 2031–2040 (6.2.1, 6.2.2), 1773–1788 (S_{a,s}, split, critical, special), 1990 (6.1.6), 445–449 (2.1.8), 460–467 (2.1.10), 2339 (6.3.1), 2487 | Definitions and the three theorems restated exactly; the coset Checks recomputed below |
| 5.3, 5.4 | temkin10 140–143 (1.2), 144–148 (1.3), 153–158 (1.5, 1.6) | Exact; generically étale alteration of the (integral qcqs) base as at line 1286 |
| 5.5, 5.5a | ilo14 7276, 3126 (VI 1.9); stacks Fields 1718 (037J), Varieties 528 (04KV), 886 (020H) | Exact |
| 5.6 | temkin17 999–1020 (4.2.1), 1021–1036 (Step 0) | Temkin assumes char(X) ⊆ P; the README states char(S) ⊆ P as the main form and keeps the char(X) form as the full variant (line 1360), so nothing is narrowed |
| 6.1–6.3 | temkin17 1078–1096 (4.3.1(i)–(iii)); ilo14 7486, 7561–7581 | Exact |
| 6.4, 6.5, 6.6 | temkin17 108–118 (1.2.5, 1.2.6), 149–160 (1.2.9), 1121 (4.3.4) | The split projective/proper by dim S is the README's deliberate restriction (source issue already on record) |
| 6.7, 6.8 | ilo14 6790–6795 (X 2.1), 6985–7001 (X 2.4) | Exact, including (iii) |
| 6.9, 6.10 | jannsen16 1052–1059 (2.11); dp23 374–379 | Exact; dp23 uses the henselization R and ILO X 2.4 with ℓ = 2, as line 1526 does |
| 6.11, 6.12 | dejong96 1447–1458 (7.3), 1545–1550 (8.1, S-variety), 1551–1563 (8.2), 1582, 1604 | Exact |
| 6.11a | moretbailly89 55–64 (conditions (F), (T)), 81–83 (Thm 1.7: R excellent with (T)), 42 (1.3), 89 (1.9), 95 (1.10), 175–189 (2.1–2.3), 291–313 (§3, 3.1.1, 3.1.2) | Conditions (a), (b) are (T)(i), (T)(ii); the boundary theorem at line 1558 is Théorème 2.3 for Z of relative dimension 0 in Fulton's sense (horizontal quasi-finite dominant or vertical curve) |
| 6.11b | dejong96 1582–1603 (8.6); moretbailly89 81, 89 | Sections through every component and the projection as in 8.6; every Dedekind R ⊆ K with fraction field K is an overring of the ring of integers or of a smooth affine curve's ring (R integrally closed contains the integral closure of Z or of F_q), hence a localization with finite class group, so line 1589's reduction is correct |

### Supplier resolution, ownership and direction

| Supplier or object | Resolved where | Result |
|---|---|---|
| SchemeAndStackFoundations §§0.9, 0.16–0.22, 1.17, 2.4, 2.6, 2.11, 3.3, 3.4, 3.6, 4.11–4.20 | main README lines 848, 1099–1462, 2624, 3364, 3437, 3656, 4713, 4789, 4905, 5528–6411 | All headings exist; `IsAlteration` (§4.16: proper, dominant, finite over a nonempty open, theorems on integral schemes), `genericDegree`, `genericDegree_comp`, `IsGenericallyEtale`, `IsModification` (§4.11), `generic_flatness`, `flattening_by_blowup` (proper f, noetherian integral S), `chow_lemma` (separated finite type over noetherian), `resolution_of_curves`, `serre_normality_criterion`, `bertini_smoothness` (§4.13), `IsStrictNormalCrossings` (§4.17), `Excellence.IsQuasiExcellentRing.isNagata` (§0.20), `IsJ2`, `regular_map_completion` (§0.21), `finiteGroupQuotient_projective` (§1.17), `nonJapaneseDVR` (§0.22), `hilbert90` (§2.11), `jacobian`/`picardSheafPoints` (§3.6) are stated there with the hypotheses the README repeats |
| LocalFieldsRamificationPartII GF.0–GF.6 | board design README (1059 lines): GF.0 lines 54–224, GF.1 226–292, GF.2 294–639, GF.5 806–935, GF.6 937–1015 | All 18 cited slugs occur (prime-supported-degree, p-extensions, separably-p-closed, maximal-p-extension, normalization-and-prolongations, tame-extension, unramified-extension, tower-laws, unramified-etale-criterion, perfection-tame-tower, unramified-composition, abhyankar-and-rank, general-tameness, separable-p-closed-tameness, `IsTame.baseChange`); the alias PrimeToDegreeAlterations occurs 6 times there; merge order 14 < 122 |
| CrystallineCohomology CR.5:log-algebra.1–4 | open head print lines 7525 (.1), 7555, 7677, 7700, 7724, 7749 (.2), 7848, 7879 (.3), 7881, 7907, 7929, 7975 (.4), 7977, 8011, 8022 (`LogCrystalline.IsLogRegular.trivial_iff`), 8037, 8162 | Every named target sits in the subsection the README cites; order 23 |
| LefschetzPencilsAndVanishingCycles §0.10 | open head lines 697–816: log blow-ups 725, `veryTameQuotient` 729–731, `equivariantLogResolution` 781–792 (separated, absolute and relative), `regularLogResolution` 811 | Contract at lines 99–107 matches except R04; order 64 |
| ClassicalAdicEtaleCohomology §2.4 | open head lines 918–928 | As cited; order 65. Its line 3741 applies stable modification over a rank-one valuation ring inside a proof route without naming a supplier; this roadmap owns that theorem (§PA.5.3) and is later in the order, an inversion on that roadmap's side, not a defect here |
| EtaleCohomologyFoundations §F.0.A1 | main lines 284–299 | `SchemeInertia.decomposition`, `.inertia` with the hypotheses at line 126 |
| StableReduction Layers 2–4 | main lines 354–406 (projective morphisms, relative Proj, relative ampleness, Gorenstein dualizing with base change and component degrees), 406–468 (prestable families), 468–491 (blow-ups of finite-type ideals as relative Proj, universal property, projectivity, strict transforms, charts; Lipman only for normal proper models of smooth curves over a DVR) | The contract at lines 20 and 122 is exact; the README's uses of Layer 4 are general blow-ups, which Layer 4 states generally |
| AdicCoefficientsAndComparisons L5 | open head lines 1694–1745 | Uses SchemeAndStackFoundations §4.19 alterations without prime control; the Scope sentence at line 9 is exact; order 121 |
| Merge order and direction | ORDER.txt: suppliers at 2, 14, 20, 23, 64, 65, 121; this roadmap 122; consumers EtaleDualityAndPerverseSheavesPartII 125, LogicAndDefinabilityInNumberTheoryPartII 312; MotivesAndAlgebraicCycles 86 (R07) | No upward citation in any `*Needs:*` line |

Dependency check (authorized command, `--movable`):

```text
depcheck: 56 roadmaps, 643 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Citation resolver: one lead, LogicAndDefinabilityInNumberTheoryPartII §2.1, a board design cited only as a consumer (line 1621); no Lean-name lead.

Ownership by object (roadmap service over main and the indexed open heads, and the sibling checkouts named in the brief): "pseudo-projective", "pointed Riemann–Zariski", "universally resolvable", "monoidally smooth", "maximally dominating", "inertia specializing" occur nowhere else; "tame distillation" and "p-alteration" occur in CrystallineCohomology only as source citations of temkin17 for Kummer étale maps (its lines 7836–7995) and in MotivesAndAlgebraicCycles §0.5c as a consumer (R07); "stable modification" occurs in ClassicalAdicEtaleCohomology as a consumer (above); the 83 "Rumely" hits in ArithmeticDynamics are the resultant and capacity results of a different paper, not the integral-point theorem; "multipointed" in HeegaardFloer is a different notion. This roadmap is therefore the owner of every object it states, and `Suggested.lean` declares no name that could collide.

Declared gaps: the five slugs of `design/plan.json` equal the five README contracts (lines 69, 81, 93, 101, 105), each with a named supplier earlier in the order; each `needs` sentence carries its hypotheses; none asks for what a supplier already has (checked against the SchemeAndStackFoundations §0.9 text on main, the LocalFieldsRamificationPartII design §GF.0 (maximal P-extensions at line 150, no separable form), and the CrystallineCohomology and LefschetzPencils heads above).

### Pinned library audit

| Declaration | File:line at the pin | Note |
|---|---|---|
| `Scheme.Hom.residueDegree`, `residueDegree_id`, `residueDegree_eq_finrank` | Mathlib/AlgebraicGeometry/ResidueField.lean:147, 152, 377 | ℕ-valued, 0 for an infinite residue extension, as line 40 says |
| `Scheme.Hom.normalization`, `toNormalization`, `fromNormalization`, `normalizationObjIso` | Mathlib/AlgebraicGeometry/Normalization.lean:122, 132, 169, 215 | No finiteness, as line 42 says |
| `Scheme.Hom.image`, `imageι`, `toImage` | Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean:659, 662, 707 | Kernel-ideal image |
| `Algebra.IsEtaleAt.exists_isStandardEtale` | Mathlib/RingTheory/Unramified/LocalStructure.lean:376 | Finitely presented algebra étale at a prime, as line 55 requires |
| `compactSpace_withConstructibleTopology` | Mathlib/Topology/Spectral/ConstructibleTopology.lean | Compact, quasi-sober, prespectral, quasi-separated hypotheses, as line 55 says |
| `LocalSubring.exists_le_valuationSubring` | Mathlib/RingTheory/Valuation/LocalSubring.lean:116 | Any rank |
| `IsProper.eq_valuativeCriterion`, `IsSeparated.valuativeCriterion` | Mathlib/AlgebraicGeometry/ValuativeCriterion.lean:330, 274 | |
| `Flat.generalizingMap`, `isOpenMap_of_generalizingMap`, `Scheme.Hom.isConstructible_image` | Mathlib/AlgebraicGeometry/Morphisms/UniversallyOpen.lean, FinitePresentation.lean | Finite presentation needed for openness, as line 584 uses |
| `algebraicClosure` | Mathlib/FieldTheory/AlgebraicClosure.lean:39 | `IntermediateField F E`, the relative algebraic closure, as line 40 says |
| `IsNoetherian`, `IsProper`, `IsFinite`, `IsDominant`, `IsOpenImmersion`, `IsSeparated`, `Flat`, `Etale`, `Smooth`, `Scheme.functionField`, `IsRegularLocalRing`, `Module.finrank`, `ringChar`, `Nat.primeFactors`, `Algebra.IsSeparable`, `IsGalois`, `IsPurelyInseparable`, `MulAction.stabilizer`, `ValuationSubring`, `WithConstructibleTopology` | present | |
| `GeometricallyIrreducible` | Mathlib/AlgebraicGeometry/Geometrically/Irreducible.lean:42 | Present at the pin; see the statability note below |
| Absent | recursive grep of both libraries | No `IsExcellent`/`QuasiExcellent`, no projective or quasi-projective morphism predicate (the only `Projective` in AlgebraicGeometry is the elliptic-curve coordinate type), no log structure, no normal crossings, no alteration, no arbitrary-rank tameness |
| `TauCeti.ValuationSpectrum`, `.comap`, `.comap_comp`, `.continuous_comap` | TauCeti/AlgebraicGeometry/AdicSpace/ValuationSpectrum/Basic.lean:212, 253, 241 | |
| `patchTopology`, `compactSpace_patchTopology` | TauCeti/AlgebraicGeometry/AdicSpace/PatchPresentation.lean | |
| `residueDegree_comp`, `residueDegree_pos_iff` | TauCeti/AlgebraicGeometry/ResidueDegree.lean:47, 65 | |
| `AffineInvariantQuotient.quotient`, `.projection`, `projection_eq_iff_exists_smul`, `isFinite_projection`, `isFinite_projection_of_finiteType` | TauCeti/AlgebraicGeometry/Quotient/Affine.lean:55, 59; FiniteGroup/Affine.lean | Finite-type hypothesis over the invariants, as line 63 says |

### Headline theorems, Lean form and padding

`Suggested.lean`: single `import Mathlib`, one module docstring of the required form, `namespace TauCetiRoadmap.AdicCoefficientsAndComparisonsPartII` with no declaration; no `set_option`, `lemma`, `#eval`, sorry'd data or stand-in (grep). The `#check @name` signature audit and the one-tactic padding probe have an empty domain. Every headline family of the README (0.6, 0.7, 0.10–0.12, 1.4, 1.6, 2.5, 2.6, 3.6, 3.7, 4.2–4.6, 5.2, 5.2b, 5.3–5.4, 5.6, 6.1–6.12 with 6.11a, 6.11b) is named in the docstring with its missing carrier, and each named carrier is indeed absent at the pins (table above); each declaration the docstring names as existing exists. Statability re-examined family by family: every one needs (quasi-)excellence, projective or quasi-projective morphisms, log structures, snc divisors, arbitrary-rank henselian tameness, the Riemann–Zariski limit, or alterations with prime-supported degrees. The one family I weighed separately is PA.6.11a: its number-ring instance is statable now (Mathlib has `GeometricallyIrreducible`, `NumberField.RingOfIntegers`, separated finite-type morphisms), but the README's theorem is for excellent Dedekind rings with (T), which is also what moretbailly89 line 81 proves; stating only the number-ring case would narrow the headline below its source, so its absence is not a defect and the docstring's reason ("Excellent rings are absent") is accurate.

### Computed adversarial pass

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.1 unit criterion | X = ∅; X = ⊔_p Spec F_p; X = Spec Z_(2) | Γ(∅) is the zero ring, every element a unit, char = ∅; in ∏ F_p the prime p is 0 in the p-th factor, not a unit, char = all primes; 3 is a unit of Z_(2), 2 is not, char = {2} | Pass |
| 0.1 finiteness | Spec Q → Spec Z; Spec Z[1/6] → Spec Z; Spec F₂ ⊔ Spec Z[1/6] → Spec Z | first not of finite type (excluded); second: image D(6), char(S) ∖ char(X) = {2, 3}, the two codimension-one points of Spec Z outside the dense open; third: the F₂ component maps into the closure of (2), which stays in char(X) | Pass |
| 0.2 maximal domination | 𝔾_m → A¹; Spec k → A¹ at 0; A¹ ⊔ Spec k → A¹; ∅ → S | generic point to generic point; closed to non-maximal; the extra point maps to the origin, so surjective and dominant but not maximally dominating; vacuous | Pass |
| 0.3, 0.4 degrees | Spec k[t] → Spec k[t², t³]; Frobenius of A¹_{F_p}, p = 2, 3; P¹_k → Spec k; Spec Z[i] → Spec Z; t ↦ t² on A¹_Q | degree 1 (modification of a non-normal target); degrees 2, 3, inseparable, {p}-alteration and not p′; generic fibre P¹_k not finite; degree 2, separable, {2}- and 3′-alteration; degree 2 with char(A¹_Q) = ∅ so not a char-alteration | Pass |
| 0.5 pseudo-projective | identity; doubled-origin plane; its blow-up at one origin | two identity arrows; the two charts into P² form a local isomorphism; the DVR at the exceptional curve's generic point has two k-maps agreeing generically (ILO 3.1.7(i)) | Pass |
| 0.8 snc supports | V(xy); ∅; origin of A²; nodal cubic, char ≠ 2; V(xy(x−y)) | two regular branches meeting in codimension 2; empty divisor; codimension 2; the single component is singular at the node; three branches through a point of a surface cannot be transverse | Pass |
| 0.9 negative control | A = k(x, y^p) ∩ k[[x]], y ∈ k[[x]] transcendental (ilo14 7328–7338) | A′ = k(x, y) ∩ k[[x]] has e = f = 1, m_A A′ = m_{A′}, flat and not finite; A′ ⊆ Γ(Y′₀, O), a finite A-module integrally closed in k(Y′₀), would force A′ finite | Negative control passes |
| 0.10 | S = Spec of an excellent Dedekind domain; Y = Spec k[t²,t³] ⊔ Spec k; Z a closed point of the cusp | normalization finite, regular, projective; Z avoids the isolated component; preimage one closed point, a reduced divisor | Pass |
| 0.11 | S = Y = Spec k[[x,y]], Z = closed point; uw = v², Z = ∅; V(xz, yz), Z = origin; the dimension-2 points of a 2-dimensional noetherian scheme | Lipman sequence empty, D of codimension 2, CJS blows it up, exceptional P¹; one blow-up with regular charts k[u, v₁], k[w, v₂], k[v, s, s⁻¹]; A² ⊔ A¹ with D = origin in each, Bl₀A² ⊔ A¹; dim O_y + dim closure{y} ≤ 2 forces closed points, finitely many | Pass |
| 0.12 | reduced complete local ring of dimension 3; doubled zero section over Z; regular S with Z = ∅ | Cossart–Piltant Corollary 1.2 gives a projective good resolution; non-separated qe threefold excluded by hypothesis; identity | Pass |
| 1.1, 1.2 | Spec F_p → Spec Z at (p); 𝔾_m → A¹; Bl₀A² with the generic point; X = Spec R, R a DVR, ε generic | closed immersion is a tight modification; not proper; tight; every tight modification is finite birational over the DVR hence an isomorphism, RZ = Spec R with stalks R and K | Pass |
| 1.2 rank two | A²_k, ε generic | lexicographic valuation ring of k(x, y) containing k[x, y], rank 2, non-noetherian | Pass |
| 1.3 | Spec Z_(p), K = Q; P¹_k, K = k(t); K = F_p; doubled-origin line | {Q, Z_(p)}; all valuation rings of k(t)/k; one element; k[t]_(t) has two centres, so the forget-the-centre map is not injective | Pass |
| 1.4 | ε non-dominant: Spec F_p → Spec Z | RZ is a point with stalk F_p, a valuation ring of K = F_p; Val_K(X) has one element | Pass |
| 1.5 | Z[i]_(1+i); the two primes over 5; M/L/K | 2 = −i(1+i)², restriction Z_(2); both restrict to Z_(5); (O ∩ L) ∩ K = O ∩ K; uniqueness of the factorization through Spec(O ∩ K): Spec O → Spec(O ∩ K) is surjective (flat local) and schematically dominant, hence an epimorphism even for non-separated X | Pass |
| 1.7 | Val_Q; Val_{F_q}; Spec Z[1/p], K = Q; ψ_{Q(i)/Q} | {Q} ∪ {Z_(p)}; one point; Val_Q ∖ {Z_(p)}; fibre sizes 1 over 2 and 5 over Z_(5) gives 2; continuity for arbitrary X is R05 | Pass (R05) |
| 2.1, 2.2 | Q(i)/Q at (1+i), (2+i); trivial valuation; u^p − u = t⁻¹, p = 2, 3; K = F₂(t), L = K(t^{1/2}), P = ∅ | e = 2 wild, e = 1 unramified; tame iff separable; v(u) = −1/p, e = p wild; ∅-tame vacuously, Spec L has no map to Spec Q = Spec Z_{∅′} | Pass |
| 2.2 pointed comparison | char K = 0 or char K ∈ P | valuations centred on Spec Z_{P′} are those of residue characteristic 0 or in P; residue characteristic 0 is always tame; so P-tame ⇔ tame on that centred set | Pass |
| 2.3, 2.4 | Q(i, √3)/Q(i)/Q; L = Q(i) | point over 3 tame, over 2 wild; tame locus = Val_L minus one closed point, open | Pass |
| 2.5 | S ⊆ Val^t; Q(i)/Q with S = Val_L | P = ∅, K′ = K; P = {2}, K′ = Q(i), L′ = K′ | Pass |
| 2.6 | separably P-closed ⇔ perfection P-closed, p ∈ P and p ∉ P | finite extensions of K^perf are the separable extensions of K with the same degrees; purely inseparable degrees are p-powers, P-numbers only when p ∈ P | Pass |
| 3.1 | ±1 on A², char ≠ 2; conjugation on Z[i] at (1+i), (2+i), (3); Z/p on A¹_{F_p}; S₃ on six points; doubled-origin plane; glued Spec ∏ F₃ | inertia 2 at 0, trivial elsewhere; orders (2, 2), (1, 1), (2, 1); t^p − t − a irreducible for a ≠ 0 with decomposition Z/p and trivial inertia; all inertia trivial; the axis generic point has inertia 2 and its origins 1, X^G not closed; every point closed, inertia specializing holds, X^{C₂} = U = ℕ ⊂ βℕ open dense not closed, X not quasi-separated | Pass |
| 3.1 admissibility conventions | orbit in an affine U, X arbitrary | ∩_g g(D(f)) for f vanishing on U ∖ ∩ gU and not on the orbit is a G-stable affine open (intersections of affine opens of U are affine), so "orbit in an affine open" and "orbit in a G-stable affine open" agree, consistent with LefschetzPencils §0.10 | Pass |
| 3.2 | Spec Z[∛2]; Frobenius; Spec Z[1/2, i] | Aut = 1 ≠ Gal of the closure; purely inseparable with trivial Galois part; tame after removing 2 | Pass |
| 3.3 | T³ − T − 2 | discriminant −4(−1)³ − 27·4 = −104 = −8·13, Z[α] maximal since −26 ≢ 0, 1 mod 4; mod 2: T(T+1)², local degrees 1 and 2, the quadratic one wild; 13 tame; P^w = {2}, 2 ≤ 3 and 2 ∤ 3 | Pass |
| 4.1 cusp | étale stalk over any k; Zariski over F₂ | A^sh ∖ 0 modulo units: classes (n, a), n ≥ 2, a ∈ k^s, with (2, a) indecomposable and k^s infinite; over F₂ Zariski: generators (2,0), (2,1), (3,0), (3,1), and (1,0) in the group with 2(1,0) = (2,0), not saturated | Pass |
| 4.1 A₁ cone | (k[u,v,w]/(uw−v²), V(v)) | P = {(a,b) : a + b even}, saturated; V(v) = V(u) ∪ V(w) is the toric boundary; 2 = 0 + 2 at the vertex | Pass |
| 4.2 | (A², V(xy)), ideal (x, y); unit ideal; empty ideal on Spec F₂; disjoint union; A₁ ideal (u, w) | Bl₀A²; identity; empty Proj; one point survives; chart k[u, v, s]/(v² − u²s) with (v/u)² = s integral and absent, saturation k[u, v/u] | Pass |
| 4.3 | Spec k → A¹ strict; (A², V(xy)) → (A¹, V(t)); square map in characteristic 3 | 0 → 0, r = 0; ℕ → ℕ², 1 ↦ (1,0), r = 1 at the origin, identity on x = 0, 0 → ℕ on y = 0; ℕ → ℕ, 1 ↦ 2, cokernel Z/2, Kummer étale, not monoidally smooth | Pass (R06 is wording only) |
| 4.8 | xy = π; π = u t^p | chart 1 ↦ (1,1), cokernel Z; exponents (p, 1), cokernel Z²/⟨(1, p)⟩ ≅ Z torsion-free | Pass |
| 5.1 | A¹_S; uv = π; cusp; blow-up of a smooth special point; genus-one curve with a rational tail | semistable, identity stable; node; not nodal; exceptional degree −2 + 1 = −1; p_a = 1 + 0 + (1 − 2 + 1) = 1, degrees 1 and −1 | Pass |
| 5.2a cosets in F_p((t)), ρ = |t| | b = 0; a = 0, b = t⁻¹, s = ρ⁻¹; a = 1, b = 1, s = 1 in F₂((t)); a = t, b = t⁻¹; a = 0, b = t⁻¹, s = 1 | split; in characteristic p the constraint |p c^p| < s is vacuous, c^p has valuation in pZ so −1 is never cancelled, infimum ρ⁻¹ attained, special; c² − c has residue 0 for integral c and valuation 2v(c) < 0 otherwise, infimum 1 attained, special; integral c leaves valuation −1, v(c) < 0 gives p v(c) < v(c) + 1, critical not special; infimum ρ⁻¹ > 1, nonsplit not critical | Pass |
| 5.2a fields | Q₃ with unramified quadratic α; tame closure of Q_p; Q_p(p^{1/p^∞})^ | inf over k of |α − c| = 1, over k^a = 0; value group Z_(p) lacks 1/(pℓ), so Frobenius on k°/p k° misses p^{1/ℓ}; deeply ramified with residue field F_p and an unramified quadratic | Pass |
| 5.2a types | Gauss field; radius r ∉ |k^×|^Q; nested discs with empty intersection, radii ↓ r > 0 | (E, F) = (0, 1), (1, 0), (0, 0); inf |T − k| = r > 0 so T ∉ k̂^a; z = T² over Q₃ with radius r: (e, f, degree) = (2, 1, 2) tame, over Q₂ wild | Pass |
| 5.3 | rank-two V with v(x) = (1,0), v(y) = (0,1); DVR; P¹_K → Spec K | identity is an alteration in the integral carrier though V is non-noetherian ((a, b) > (a, b − 1)); identity; generic fibre dimension 1 excluded | Pass |
| 5.5a | A = Q(∛2), B = A(ω); S₅ fields; F = F₂(u), E = F(u^{1/2}) | A ⊗_Q A = A × B with degrees 1, 2 over A; S₄ orbits on 2-subsets of 5 points have sizes 4 and 6 over A, and S₂×S₃ orbits on 5 points sizes 2 and 3 over B, so B ⊗_F A has two factors of B-degrees 2 and 3, neither a {5}-number; E(T) is a field of degree 2 over F(T), while F(u^{1/2})(T) ⊗ E has the square-zero element u^{1/2} ⊗ 1 − 1 ⊗ u^{1/2} | Pass |
| 5.6 variant | S = Spec Z_(2) ⊔ Spec Q, X = A¹_Q, P = ∅ | char(S) = {2} ⊄ ∅ but char(X) = ∅ ⊆ ∅; identity alterations suffice | Pass |
| 6.1, 6.2 | S = Spec Q; f = id_S, Z snc; S = X = Y = Spec of a regular 2-dimensional local ring, Z the closed point | degrees 1; a = b = id; without the blow-up, the identity with W′ = Z′ = V(xy) satisfies §6.1 but b⁻¹(Z) is a point | Pass |
| 6.4, 6.5 | Spec Q[ε]/(ε²); S = Spec Z; S = Spec Z_p[[u, v]]; S = Spec Z_p[[u]] | reduction, degree 1; (i), any dim X; dim 3 separated, only (ii); dim 2, (i) | Pass |
| 6.8, 6.10 | xy = p over Z_p; degrees 3 and 2 on Z/2 and Z/4 | Σ = {(p)}, exponents (1, 1), horizontal boundary empty; 3 is a unit mod 2 and mod 4, restriction injective, 2 ≡ 0 | Pass |
| 6.11a boundary theorem | E: y² = x³ + x + 1 over F₅; P¹_{F₅}; E × Spec R, R = O(E ∖ O); E × Spec F₅[ε]/(ε²) | Δ ≡ −16·31 ≡ 4 ≠ 0; values 1, 3, 1, 1, 4 with 3 a non-residue give 2, 0, 2, 2, 2 affine points, 9 with ∞; Pic⁰(P¹) = 0 and O(1) of infinite order; O(P − O) has relative degree 0 and infinite order since [n] has degree n² > 0; kernel H¹(E, O) ≅ F₅, classes killed by 45 | Pass |
| 6.11a hypotheses | Spec Z[1/2] → Spec Z; A¹_R; x² + y² = −1 over Z | not surjective, 2 would be a unit of R′; zero section with K′ = K; points over Z[i] | Pass |
| 6.11b | P^d_S with N = d; a fibre with two components | empty centre, π = id, one section; two disjoint sections since d ≥ 1 | Pass |
| Gap statements | unit, invertible and empty log ideals; P = ∅ separable P-extension | identities and the empty blow-up (line 105); K itself with local degree 1 (line 85) | Pass (R04 is presentation) |

House style and policy: no LaTeX delimiters, no process words, pull-request numbers, job ids or local paths in the README, the Lean file or the manifest (grep for the brief's word list: only "Chow's lemma", "preparation lemma" as prose, no `lemma` keyword); every target carries a locator; no `set_option`; no computational algorithm; the package changes only its own folder (`git diff --stat origin/main...HEAD`: README.md, Suggested.lean, design/plan.json, metadata.toml, sources.toml and the reports folder). `sources.toml` parses and records every cited work once; no `needs-references.toml` exists and none was needed (every locator is in the cache).

## Not verifiable

- Ownership against open pull requests the brief lists without checkout paths was checked only through the roadmap service's indexed heads (index of 2026-10-26T05:20:43Z) and the board packages; the sibling checkouts named with paths in the brief were consulted where the object searches pointed at them (ArithmeticDynamics for "Rumely"; none of them states an object of this roadmap).
- The five declared gaps are future contracts; their precision, minimality and placement were checked, not their implementation.
- `Suggested.lean` declares nothing, so no elaboration certifies any mathematics; the module docstring's statability claims were checked by grep at the pins, not by attempting statements.
- Cossart–Piltant's 2014 preprint relied on by temkin17 for projectivity in dimension 3 was not opened; the published cp19 text was used, as the README does.
- The step inside temkin17's proof of Theorem 3.2.12 (line 875–876) that tameness of L K̄/K̄ at a point descends to a finite subextension K_x/K was checked only as a limit statement about the tame closure; the README restates it at the same generality (line 747) and relies on LocalFieldsRamificationPartII GF.2 for the definition of tameness of infinite extensions.

## Source issues

- **Error** in ilo14 at Exposé X, Lemma 3.1.3, arXiv v1 page 156 (ilo14 lines 7177–7180): the source says an action is inertia specializing exactly when every fixed subscheme X^H is closed, for an arbitrary scheme, because a subscheme is closed when stable under specialization; the forward direction fails for a non-quasi-separated scheme (two copies of Spec ∏_n F₃ glued along the open dense set of principal ultrafilters, swapped by C₂: all points closed, X^{C₂} the non-closed open set); it should assume X noetherian, or X^H constructible; affects nothing (the roadmap adds the noetherian hypothesis at line 791 and records the counterexample at line 808).
- **Misprint** in ilo14 at Exposé X, §2.6 Step 3, arXiv v1 page 155 (ilo14 lines 7131–7138): the source says P^* = Z^µ and P₁ = N^ν and then writes P = Z^ν ⊕ N^µ and P = Z^s ⊕ N^r ⊕ Z^{ν−s} ⊕ N^{µ−r}; the exponents µ and ν are interchanged between the first display and the next two; it should read P^* = Z^ν, P₁ = N^µ throughout; affects nothing (the roadmap's Conventions at line 32 and §PA.4.8 fix the ranks).
- **Gap** in temkin17 at Theorem 1.2.5 and §4.3.2, printed pages 99 and 124: the source says a finite-type scheme over a qe S with dim S ≤ 3 has a projective char(X)-alteration, with S universally resolvable by Cossart–Piltant; the published Cossart–Piltant theorem assumes S separated and gives projectivity only over a specified finite affine cover; it should be proper for separated S of dimension 3 and projective for dim S ≤ 2; affects a stated result (already on the register; re-verified at cp19 lines 93–102).
- **Gap** in ilo14 at Exposé X, Remark 3.3.4(ii), arXiv v1 page 159: the source says every quasi-excellent scheme of dimension at most two is universally resolvable, citing Cossart–Jannsen–Saito; that paper's theorems assume excellence, so the quasi-excellent case needs Lipman's theorem (Stacks 0BGP) before the snc step; affects nothing (already on the register; re-verified at ilo14 lines 7320–7322 and cjs lines 39–43).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "74a0736", "job": "RT-AdicCoefficientsAndComparisonsPartII~1b", "model": "fable", "worker": "fable-rt209"} -->

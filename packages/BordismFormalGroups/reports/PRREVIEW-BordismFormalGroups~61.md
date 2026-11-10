# Review of BordismFormalGroups (pull request #1807 at d796110)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/BordismFormalGroups/README.md` and `Suggested.lean` at `d796110`. The folder changed by 848 lines since `edec751`.

- **Gate.** The worker's gate passes every check, including the targeted build. My rerun fails only `outside-folder`, with 26 files: the README and `Suggested.lean` of each of the 13 sibling folders that the brief names as this pull request's own. That is not a finding. `git diff --stat origin/main...HEAD` shows no change outside the 14 folders.
- **Dependency check.** `depcheck: 236 roadmaps, 2284 edges, 0 problem(s)`, so there is no UPWARD or CYCLE line.
- **Lean.** `lake env lean Suggested.lean` gives three `sorry` warnings and nothing else.
- **Findings.** One blocking finding is carried over: a second owner among the open pull requests. There are three P3 findings: build order, a restated AlgebraicTopology step (the seeded sample) and incomplete *Needs:* lines.

## Previous findings (review of edec751)

| Id | Status | Evidence at d796110 |
|---|---|---|
| R01, invariant-prime headline | repaired | `isPrime_and_invariant_iff_eq_heightIdeal` is stated (`Suggested.lean` line 86), with the README target, route and four Checks at lines 1454–1511. It is stated as an iff over n≥0 with `heightIdeal p 0 = ⊥` (pinned `heightIdeal_zero`), which is stronger than the requested implication and correct (table rows 4–9). |
| R02, two owners (TangentialBordism, HomotopySpheres) | **not repaired** | No change in the description or the folder. Both open heads still claim the objects. Raised again as R01. |
| R03, Lubin–Tate `∃!` nesting and uncited rigidity | repaired | Line 124 now reads `∃ e …, IsStarIso π e`. Rigidity is cited in the docstring (lines 107–109), in the contracts (README lines 183–187), as an API bullet (1648–1656) and in *Needs:* (1709–1710). |
| R04, change of rings and locators | repaired | Lines 697–707 now give A1.3.13 in its cotensor form, the Lemma 3.1.8 comodule-algebra form and Corollary A1.1.20 for A_*≅P_*⊗E_*. Lines 762–764 attribute the b_i clause to the indecomposable count. Checked at `ravenel-green` lines 3763–3792, 18098–18116 and 18732–18735. |
| R05, docstring's not-statable list | repaired | F6.1 and F6.7 are named with their missing carriers (`Suggested.lean` lines 39–41 and 54–55). |
| R06, order with #1854 | repaired | The description's merge-order block says "`BordismFormalGroups`: **this pull request** → #1808 → #1854." |
| R07, README shape | mostly repaired | Subsections F1.1–F6.7 exist. There are 29 *Needs:* lines and 35 `**Checks.**` lists, and F4.1, F6.6 and F6.7 have three Checks each. No inline "Checks:" prose remains, and a grep finds no unspaced locator. The Lean section comments read `## Layer 1: F1. …` and `## Layer 5: F5. …`. What remains: the *Needs:* lines of F6.3–F6.5 omit inputs that their text uses (R04). |

## R01 (P2) — Steenrod/Adams/MO, the James construction and the Toda brackets still have second owners among the open pull requests

Not repaired from the previous review's R02.

**Location.** `TauCetiRoadmap/BordismFormalGroups/README.md`:
- lines 59–72: "The ordinary-operation items of TangentialBordism's Layer 4 and its additive MO splitting are F2 targets, which TangentialBordism consumes";
- line 1180: "Own the three-fold Toda brackets of pointed spaces";
- line 1909: "Own the James construction".

**Claim.** For each of these objects, this roadmap and an open roadmap each name themselves as owner and the other as consumer. So none of them has a single owner.

**Witness.**
- #942 at `b2c841c`, `TauCetiRoadmap/TangentialBordism/README.md`:
  - lines 76–77: "Owned here: the mod p Steenrod algebras and Adams towers (B4.1–2, B4.7), which BordismFormalGroups consumes";
  - lines 3434–3435: "BordismFormalGroups consumes the ordinary operation and Adams interfaces, B4's MO coefficients".
- #1287 at `7fbf648`, `TauCetiRoadmap/HomotopySpheres/README.md` lines 3316–3317: "BordismFormalGroups consumes the James stages of 3B in F6.2 and the Toda brackets of 3C.3 in F4".

**Repair.** This folder's text is already correct: BordismFormalGroups is on main, it may consume neither open roadmap, and HomotopySpheres is never a supplier. Do one of the following:
- **Option (a).** Add to this pull request's merge-order paragraph that #942 and #1287 are rebased after it and replace their items by citations:
  - TangentialBordism B4.1–B4.2 and B4.7 → F2.2;
  - TangentialBordism B4.4 → F2.5;
  - HomotopySpheres 3C.3 → F4.1;
  - HomotopySpheres 3B → F6.2's James construction.
- **Option (b).** In the repair report, mark this finding "not actionable in this package", with the main-first rule as the reason. That reason is correct, so the finding is then settled.

## R02 (P3) — Build order: F3.4 needs F4.5, and three sections need later sections of their own layer

**Location and claim.**
- **F3.4 and F4.5.** The F3.4 *Needs:* line (lines 1143–1145) and the F3 Dependencies (lines 1173–1174) list "F4.5's BP-homology Atiyah–Hirzebruch spectral sequence". F4.5 needs F4.4 and F3.1 (lines 1391–1393), and the F4 Dependencies list F3 (line 1417). This gives a layer-level cycle F3→F4→F3, and F3.4 sits before its own input.
- **Within a layer:**
  - F2.4 needs "F2.5's π_*MO" (lines 840–841);
  - F4.3 needs "F4.4's MU/BP cobar complexes and Adams–Novikov tower" (lines 1326–1327);
  - F5.1 needs "F5.2's computation of Ext⁰_Γ(A,A/I_n)" (lines 1435–1437);
  - F5.1's Lazard-ring form needs "F5.3's p-typical comparison" (lines 1491–1492).

**Witness.** Nothing in F4 or F5 uses F3.4. F2.5 does not use F2.4, and F4.4 does not use F4.3. A `roadmaps grep` finds no roadmap on main or in an open pull request that cites F2.4, F2.5, F3.4, F4.3–F4.5 or F5.1–F5.3 by number. So a renumbering needs no old → new mapping.

**Repair.**
- Move F3.4 to F4 as F4.6, after F4.5. Then delete F4.5 from the F3 Dependencies and add F4.6 to F4's Examples and Dependencies.
- Swap F2.4 and F2.5.
- Place F4.3 after F4.5.
- In F5, move the primitive computation (η_R(v_n)≡v_n mod I_n and Ext⁰_Γ(A,A/I_n)=𝔽_p[v_n], the opening of F5.2) to the start of F5.1. Then move the Lazard-ring classification paragraph (lines 1454–1511, with its Checks) after F5.3.
- Recheck: no *Needs:* line names a later section.

## R03 (P3) — F6.6 restates AlgebraicTopology Stage 8.7's finite CW type of compact smooth manifolds (seeded sample)

**Location.**
- Lines 3160–3164: "Obtain the smooth finite CW models from GeometricTopology's **The smoothing-and-triangulation comparison**, item 1 **Smooth implies PL**, … followed by the pinned `TauCeti.IsTriangulable.finiteCWType`".
- The same pair is cited at lines 221–223 (contract), 3303–3305 (*Needs:*) and 3378–3379 (Dependencies).

**Claim.**
- The step is supported mathematically: see table row 19.
- But it plans again a theorem that a supplier already owns.
- It also cites a GeometricTopology heading that no longer exists on main. The heading resolves only through GeometricTopology's anchor table (lines 776–781) to Layer 11.3 (line 7887).

**Witness.**
- On main, `TauCetiRoadmap/AlgebraicTopology/README.md` line 1811 (Stage 8, item 7) owns this step: "every finite-dimensional Hausdorff second-countable smooth manifold … has countable locally finite CW type by consuming GeometricTopology's smoothing-and-triangulation comparison item1 … The compact case has finite CW type".
- At this head, the same item (AlgebraicTopology README lines 2760–2765) names `compactManifoldFiniteCWType` "proved through the native `TauCeti.IsTriangulable.finiteCWType`".

**Repair.**
- In F6.6, write "Obtain the finite CW models of C and D from AlgebraicTopology Stage 8.7 (the compact case)". AlgebraicTopology is already a supplier, so no new roadmap edge appears.
- Replace the GeometricTopology contract entry and the `finiteCWType` clause by that citation, and update F6.6's *Needs:* and the F6 Dependencies.
- C and D are compact closed smooth manifolds, so they meet Stage 8.7's hypotheses.
- #1808's head already makes exactly this change. Either adopt it here or say in the description that #1808 carries it.

## R04 (P3) — *Needs:* lines of F6.3–F6.5 omit inputs their text uses; F6 credited with the Johnson–Wilson theories

The rest of the previous review's R07.

**Location, claim and witness.**
- **F6.3.** Its *Needs:* (lines 2581–2587) omits:
  - AlgebraicTopology Stage 8.8, used at line 2331 ("using AlgebraicTopology Stage 8.8's bar/CW model");
  - F4.1, used at lines 2458–2459 ("work in F4's actual derived right-module category over strict MU_(p)").
- **F6.4.** Its *Needs:* (lines 2882–2886) omits:
  - F3.2 and F5.5, used at lines 2749–2750 ("F3's height-m Honda law …, F5's formal-group automorphism/deformation carriers");
  - F4.4, used at lines 2723–2724 ("comparisons to F4's MU/BP resolutions").
- **F6.5.** Its *Needs:* (lines 3135–3140) omits:
  - F6.3, used at lines 3019, 3040, 3075 and 3095;
  - F4.1, used at lines 3105–3106;
  - G5.1, for the finite duality used at lines 3030–3031 and 3071.
- **Johnson–Wilson theories.** Scope and ownership (line 39) lists "Johnson–Wilson theories" under F6, but F3.3 builds E(n) and the Summary credits F3.

**Repair.**
- Add the listed items to the three *Needs:* lines.
- Where one *Needs:* line covers targets with different needs, split it per target. For F6.3, use separate lines for the class comparisons, the type and strong-type construction, the self-maps and thick classification, and the telescopes and pro-recovery.
- At line 39, write "the Johnson–Wilson Bousfield classes".

## Verified sound

**Headline theorems.** These are read from the Summary and the Scope, with their status at the pins.

Stated in `Suggested.lean`:
- Lazard's height classification (F1.5, `nonempty_formalGroupIso_iff_height_eq`);
- the invariant prime ideal theorem on L (F5.1, `isPrime_and_invariant_iff_eq_heightIdeal`);
- the Lubin–Tate universal deformation (F5.5, `lubinTate_universal_deformation`), with its one definition `IsStarIso`, which has a real body.

Named in the module docstring as not statable, each with the carrier it lacks:
- Quillen's L≅MU_*;
- Thom's π_*MO;
- Bousfield localization (F6.1);
- the Conner–Floyd and graded Eilenberg–MacLane comparisons;
- the Landweber exact functor theorem;
- Devinatz–Hopkins–Smith nilpotence;
- Hopkins–Smith thick subcategories and periodicity;
- the Hopkins–Ravenel smashing theorem;
- the chromatic fracture square;
- the K(n)-local completion;
- Greenlees–Sadofsky/Kuhn Tate vanishing;
- F6.6 and F6.7.

I checked the carrier claims at the pin. `TauCeti/AlgebraicTopology/Spectra/` has only point-set symmetric spectra, limits, colimits, smash powers and mapping spaces. It has no model structure, stable homotopy groups, Thom spectra or Morava K-theories, and the pinned Tau Ceti has no Steenrod operations.

**Lean form.**
- `module`, `public import Mathlib` and four existing `TauCeti.*` modules; no `set_option`, no sorry'd data, `theorem` only, one module docstring.
- The file has no `variable` block. I elaborated the four `#check @name` once (scratch `SignatureCheck.lean`), and every binder matches the README statement (lines 512–520, 1454–1462, 1632–1638 and 1675–1689).
- **One-tactic probe.** I ran `simp`, `aesop` and `infer_instance` on each theorem in a scratch copy. None closes:
  - `simp` makes no progress on the first two theorems and leaves goals unsolved on the third;
  - `aesop` fails after an exhaustive search;
  - `infer_instance` reports that no type class instance is expected.
- **Duplication at the pin.** A grep of `TauCeti/RingTheory/FormalGroup` for `IsSepClosed`, `Nonempty (…FormalGroupIso`, `IsHomogeneous`/`IsPrime` and Lubin–Tate finds:
  - only the infinite-height case of the classification (`Logarithm/InfiniteHeight.lean:278`);
  - rigidity (`Rigidity.lean:229`);
  - no headline already proved.

**Pinned declarations opened (36).** All in Tau Ceti `RingTheory/FormalGroup/` unless a path is given:
- `Height/Ideal.lean`:
  - `heightIdeal` (74), the span of the coefficients of [p] below degree pⁿ;
  - `heightIdeal_le_iff` (81), `heightIdeal_eq_bot_iff` (98), `heightIdeal_zero` (104), `heightIdeal_mono` (110), `heightIdeal_smul` (138), `heightIdeal_one` (190), `heightIdeal_eq_span` (195), `heightIdeal_eq_bot_iff_le_height` (218).
- `CoordinateChange/HopfAlgebroid.lean`: `map_rightUnit_heightIdeal` (390).
- `CoordinateChange/Lazard.lean`: `coordinateChangeLift` (77), `rightUnit` (130, classifying `universalStrictCoordinate • formalGroup.map C`) and `map_rightUnit` (136).
- `Rigidity.lean`: `FormalGroupHom.eq_of_map_residue_eq` (186) and `FormalGroupIso.eq_of_map_residue_eq` (229). Their hypotheses: `IsLocalRing`, `IsHausdorff 𝔪`, `CharP (ResidueField A) p`, both laws commutative, and finite height of the source's reduction. This matches README lines 183–187.
- `Height/Basic.lean`: `height` (200), `height_eq_natCast_iff` (211), `one_le_height` (228), `height_map` (263), `FormalGroupHom.height_eq` (316), `FormalGroupIso.height_eq` (346), `height_smul` (356).
- `Logarithm/InfiniteHeight.lean`: `existsUnique_logarithm_of_nsmulSeries_eq_zero` (249) and `height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ` (278).
- Elsewhere in `RingTheory/FormalGroup/`:
  - `Obstruction.lean` (386, 400);
  - `LeadingDifference.lean` (112);
  - `Frobenius/Factorization.lean` (180);
  - `SymmetricCocycle/Classification.lean` (420);
  - `LazardRing/Basic.lean`: `grading` (390), with a_ij in degree 2(i+j−1) as in the Conventions;
  - `CoordinateChange/Basic.lean` (149, the action φ•F).
- `RingTheory/PowerSeries/Coordinate/Universal.lean`: `universalStrictCoordinate` (58, X+Σb_iX^(i+1)) and its coefficient lemma (64).
- `Topology/Triangulable/FiniteCWType.lean`: `IsTriangulable.finiteCWType` (`[CompactSpace X]`, `IsTriangulable X` ⇒ `FiniteCWType X`). `Topology/Triangulable/Basic.lean`: `IsTriangulable` (38).

**Cross-roadmap citations resolved (31).**
- **GeneralizedCohomology, at this head.**
  - G2.11 (line 1072), with the five headings that F6.5's old → new list maps to it: lines 1083, 1128, 1360, 1484 and 1547.
  - G2.3–G2.10 (667–1008), G3.1 (1941), G3.8 (2194), G3.9 (2300), G4.3 (2715), G4.5 (2765), G5.1 (3131), G5.3 (3190), G5.4 (3226; KU, KO, ku, ko and the Bott equivalence are present), G5.5 (3367) and G5.7 (3972).
- **AlgebraicTopology, at this head:**
  - Stage 5 item 5 (line 1456), Serre fibrations, with the Serre spectral sequences at 1537 and 1555;
  - Stage 8 item 3 (2563), Hurewicz;
  - item 7 (2760);
  - item 8 (2784), bar/classifying spaces;
  - item 10 (3072), EM representability.
- **On main:**
  - GeometricTopology's anchor table (776–781) and Layer 11.3 (7887);
  - AlgebraicTopology Stage 8 item 7 (1811) and `compactManifoldFiniteCWType` (`Suggested.lean` 1155).
- **Overlap and ownership.**
  - TangentialBordism (#942) and HomotopySpheres (#1287) at their heads: see R01.
  - ChromaticHomotopyTheory (#1643) consumes F6.1–F6.4 and "the pointwise Kan-extension formula of BordismFormalGroups F6.5", which resolves through lines 85–110. It owns no F-target.
  - The board package LubinTateFormalModulesAndQuasiCanonicalLifts cites §F1 and §F5 as suppliers and keeps an O_K-module variant of its own.
  - CompletedCohomologyAndLocalGlobalCompatibility (line 342) and VectorBundlesAndIsocrystals use Lubin–Tate spaces and covers of formal O_F-modules, which are different objects.
  - The overlap report lists no dropped or revision-only ids.
  - #1808 and #1854 have a stated order.

**Seeded sample: the smoothing-and-triangulation comparison.**
- On main, GeometricTopology lines 776–781 map "*The smoothing-and-triangulation comparison*: its item 1 (smooth triangulations, smooth implies PL)" to Layer 11.3.
- Layer 11.3 proves the Cairns–Whitehead theorem: every smooth manifold has a smooth triangulation (Whitehead 1940; Munkres, Theorems 10.5–10.6). GeometricTopology's standing hypotheses (real, finite-dimensional, Hausdorff, second countable) hold for C and D.
- Compactness and the pinned `finiteCWType` then give finite CW type.
- The statement is supported, but it is AlgebraicTopology Stage 8.7's: see R03.

**Other locators read at the text.**
- `ravenel-green`:
  - Theorem 1.3.16 (lines 1338–1347, p. 17);
  - Theorem 4.3.2 with its proof (lines 6801–6825, pp. 120–121);
  - Lemma 3.1.4 and Theorem 3.1.5(ii), where h(x_i)=−pb_i if i=p^k−1 (lines 3741–3755);
  - Lemmas 3.1.6–3.1.8 (lines 3763–3792, pp. 63–64);
  - Corollary 3.1.10 (lines 3816–3819);
  - Corollaries A1.1.18–A1.1.20 (lines 18098–18116);
  - Corollary A1.3.13 (line 18732).
- `lubin-tate-1966`:
  - the ⋆-isomorphisms (lines 34–40, p. 49);
  - the normal-form remark and Proposition 1.1 (lines 57–73, p. 50; R a ring with a maximal ideal J, R/J≅k);
  - Proposition 2.4 with its finite-height uniqueness clause (lines 148–159, p. 52);
  - Theorem 3.1 (lines 284–289, p. 56; o a complete noetherian local R-algebra with m⊇Jo), whose proof gives uniqueness of the ⋆-isomorphism;
  - §3.2 (lines 323–330, p. 57).

**Adversarial pass.**

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1. `nonempty_formalGroupIso_iff_height_eq` | 𝔾ₐ vs 𝔾ₘ over 𝔽̄_p | heights ⊤ and 1; an iso would preserve height (`FormalGroupIso.height_eq`) | both sides false | — |
| 2. same | X+Y+uXY vs 𝔾ₘ, u a unit | u(X+Y+uXY)=uX+uY+(uX)(uY); [p]=u^(p−1)x^p, height 1=1 | both sides true | — |
| 3. same, `IsSepClosed` dropped | 𝔽_p: 𝔾ₘ vs a twist whose Frobenius is pu, u≠1 in ℤ_p^× | heights 1=1; an 𝔽_p-iso would force p=pu in End=ℤ_p | hypothesis needed; README Check present | — |
| 4. `isPrime_and_invariant_iff_eq_heightIdeal` | I=⊥ | `heightIdeal p 0`: the coefficients below degree 1 are {0}, so ⊥; L a domain, so ⊥ is prime and invariant | iff holds | — |
| 5. same | p=2, (2) and (2,a₁₁) | [2]=2X+a₁₁X²+2a₁₂X³+⋯; I_(2,1)=(2), I_(2,2)=(2,a₁₁,2a₁₂)=(2,a₁₁); quotients 𝔽₂[x₁,…] and 𝔽₂[x₂,…] | listed and prime | — |
| 6. same | (a₁₁) | φ=X+b₁X²: XY coefficient of φ(F(φ⁻¹X,φ⁻¹Y)) is a₁₁+2b₁; 2b₁∉(a₁₁)Γ | not invariant, excluded | — |
| 7. same, homogeneity dropped | (2,a₁₁−1) | η_R(a₁₁−1)=a₁₁−1+2b₁∈(2,a₁₁−1)Γ; quotient 𝔽₂[x₂,…], a domain; every `heightIdeal` is generated by homogeneous coefficients | invariant prime not listed: hypothesis needed | — |
| 8. same | (4) | homogeneous; η_R(4)=4; in L/(4), 2·2=0 with 2≠0 | not prime, excluded | — |
| 9. same, route for I⊇I_(p,∞) | L/I_(p,∞) | [p]=0, so a strict log to 𝔾ₐ exists; then q(I)·(L/I_∞)=ε(I)·(L/I_∞)=0; the quotient is 𝔽_p[x_i : i+1≠p^k], with x₂≠0 at p=2 | I=I_(p,∞); not maximal, as stated | — |
| 10. `IsStarIso` | [1+p] on 𝔾ₘ over ℤ_p | (1+x)^(1+p)−1 ≡ x+x^p+x^(p+1) mod p, ≠ X | not ⋆ | — |
| 11. same | 2x on 𝔾ₐ over ℤ_p, p odd | reduction 2x≠x | not ⋆ | — |
| 12. same | x↦ux, X+Y+uXY→𝔾ₘ, u≡1 mod p | reduction x | ⋆ | — |
| 13. rigidity bullet | 𝔾ₐ over 𝔽_p[ε], x+εx^p | (X+Y)^p=X^p+Y^p, so an automorphism; reduction X; ≠ X | two ⋆-automorphisms at height ∞: finite height needed (pinned `hF`) | — |
| 14. `lubinTate_universal_deformation` | h=1, `Fin 0` | `MvPowerSeries (Fin 0) R`≅R; θ=algebraMap only; ⋆-iso exists (no moduli) | holds | — |
| 15. same | uniqueness of θ among all R-algebra maps | θ(f)≡Σ_(|α|<N)c_αθ(t)^α mod 𝔪^N; `IsAdicComplete` includes `IsHausdorff` | θ is determined by θ(t_i), so `∃!` is well posed | — |
| 16. same | R=k, A=k[[s]], G=F₀⊗A | θ(t_i)=0 for all i; e=X | holds | — |
| 17. same, F₀=𝔾ₐ (excluded by `hF₀`) | X+Y+εC_(p^j) over 𝔽_p[ε] | a ⋆-change shifts the cocycle by Σg_nd_nC_n, with d_(p^j)=p=0; infinitely many classes vs p^(h−1) maps | finite height needed | — |
| 18. same, vs the source | Lubin–Tate Thm 3.1 | source: R/J≅k, o complete noetherian local, m⊇Jo; Lean: ρ surjective, ker π=𝔪, π∘algebraMap=ρ ⇒ J·A⊆𝔪 | matches | — |
| 19. smoothing/triangulation (seeded) | compact closed smooth C, D | Layer 11.3 gives a smooth triangulation; compactness gives finitely many vertices; `finiteCWType` gives `FiniteCWType` | supported; duplicate of AT 8.7 | R03 |
| 20. Ravenel 1.3.16(iv) vs README | n=0 | source lists 0<n≤∞ (line 1346); ⊥ is invariant and prime | README right to include n=0 | Source issues |
| 21. F2.2 splitting | p=2 Poincaré series | ∏(1+t^d)/(1−t^(2d))=∏(1−t^d)⁻¹, d=2^i−1 | holds | — |
| 22. F2.3 Hurewicz | i=1,…,6 | 2b₁, 3b₂, 2b₃, 5b₄, b₅, 7b₆; source −pb_i iff i=p^k−1 | holds | — |
| 23. F2.1 K-theory law | x_K=u⁻¹([L⁻¹]−1) | u⁻¹((1+ux)(1+uy)−1)=x+y+uxy; restriction u⁻¹β=1; dual −x/(1+ux) | holds | — |
| 24. F2.5 π_*MO | degree 5 | 7=1·1+1·2+1·0+2·1+2·0+2·1 | holds | — |
| 25. F3.1 generators | v₁, Araki vs Hazewinkel | ℓ₁=v₁/p vs v₁/(p−p^p); ratio 1−p^(p−1)≡1 mod p; η_R(v₁)=v₁+pt₁ | holds | — |
| 26. F3.4 range | K(ℤ_(2),3) | Sq³ι₃=Sq¹Sq²ι₃=ι₃²≠0, so 2-torsion in H⁶ and in H₅ | holds | — |
| 27. F4.3 Massey Checks | ⟨h₀,h₁,h₀⟩, ⟨h₁,h₀,h₁⟩ | value−h₁²=d[ξ₁ξ₂]; value−h₀h₂=d[ξ₁²ξ₂]+d[ξ₁⁵] (C(5,k) mod 2 = 1,1,0,0,1,1); Ext^(1,3)=0 | holds | — |
| 28. F4.2 | ⟨2,η,2,η⟩ | inner ⟨2,η,2⟩={η²}∌0 | no defining system | — |
| 29. F4.5 | fibre F of S_(p)→BP | π₀F=ker(ℤ_(p)≅ℤ_(p))=0, so F^(∧s) is (s−1)-connected | holds | — |
| 30. F5.4 Checks | ℤ[u^(±1)], x+y+uxy | [p]=((1+ux)^p−1)/u ≡ u^(p−1)x^p mod p | v₁ is a unit | — |
| 31. F6.4 fracture | X=S_(p), n=1 | ℤ_p⊕ℚ→ℚ_p onto, kernel ℚ×_(ℚ_p)ℤ_p=ℤ_(p) | holds | — |
| 32. F6.5 | Hℤ, trivial C_p | π_(−2k)=Ĥ^(2k)(C_p;ℤ)=ℤ/p≠0; L_(K(n))Hℤ=0 | consistent | — |
| 33. F6.6 | χ=[2] | lowest coefficient 2 (MU), v₁ mod 2 (BP_*/I₁), [2]=0 over HF₂ | regular / regular / fails | — |
| 34. F6.3 self-maps | p=2; p odd | 8=2·4·(2−1), a=4; 2(p−1), a=1 | holds | — |
| 35. Build order | F3.4 | F3.4 needs F4.5 (1144); F4.5 needs F4.4 and F3.1 (1391–1393) | layer cycle F3↔F4 | R02 |

## Not verifiable

- **Munkres and Whitehead.** Munkres, *Elementary Differential Topology*, Theorems 10.5–10.6, and Whitehead, *On C¹-complexes* (1940): GeometricTopology's locators for Layer 11.3. Both are paywalled and not in this roadmap's manifest. I checked the citation chain, not the text.
- **Sources settled as uncertified.** I cited these by locator only and did not read them:
  - Thom 1954, Ch. IV;
  - Bousfield 1979, Thm 6.6;
  - Toda 1962, Ch. I;
  - James 1955;
  - Devinatz–Hopkins–Smith;
  - Hopkins–Smith;
  - Johnson–Wilson, Prop 4.14;
  - Würgler;
  - Symonds;
  - Hovey–Strickland;
  - Greenlees–Sadofsky;
  - Adams;
  - Wilson;
  - Landweber–Ravenel–Stong;
  - Quillen 1971.
- **Cached but outside the seeded sample.** Lurie HTT/HA, Nikolaus–Scholze, Clausen–Mathew, Kuhn, Hovey–Sadofsky, Hovey (MString), Carrick–Davies–van Nigtevecht and Bauer are in the cache, and I did not check them.

## Source issues

- **Misprint** in ravenel-green at Theorem 1.3.16(iv), p. 17: the source says the invariant primes of L are the I_n for 0<n≤∞; it should be 0≤n≤∞, since the zero ideal is invariant and prime in the polynomial ring L (as Theorem 4.3.2(iv), p. 121, has); affects nothing.
- **Gap** in ravenel-green at Theorems 1.3.16(iv), p. 17, and 4.3.2(iv), p. 121: the classification is stated for all invariant prime ideals, but (p,v₁−1) is invariant and prime and not listed; it should be restricted to homogeneous ideals, which the proof's lowest-degree argument presupposes; affects a stated result.
- **Misprint** in ravenel-green at Corollary 3.1.10, p. 64: the source says a_i is represented by [ξ_i] at p=2; it should be [ξ_(i+1)], since a_i lies in Ext^(1,2^(i+1)−1) and |ξ_(i+1)|=2^(i+1)−1; affects nothing.

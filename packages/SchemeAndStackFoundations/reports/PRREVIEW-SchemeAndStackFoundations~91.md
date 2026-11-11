# Review of SchemeAndStackFoundations (pull request #1656 at 85395e0)

**Verdict:** needs changes

:robot: Independent AI review. This is a full review of `TauCetiRoadmap/SchemeAndStackFoundations/` at `85395e0`; the folder is byte-identical to the head the previous report read. The gate passes, the dependency check reports no problem, `Suggested.lean` elaborates with `sorry` as its only warning, and the padding probe closes nothing. There are four findings, R01–R04. R01 (P2) is a missing hypothesis in a §1.13 API statement, with a counterexample. R02 corrects a set of Deligne 1985 page numbers in §4.15. R03 is a backtick convention the README breaks itself. R04 carries the previous report's description finding, which is partly repaired.

## R01 (P2) — §1.13: *Action.constantEquiv* is false for presheaves that are not Zariski sheaves

**Location.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3189–3193`: "`Action G X := ModObj G X` for `X` over `h_S` … *Action.constantEquiv* (actions of Tau Ceti's constant group scheme `Γ_S` on `X` are homomorphisms `Γ → Aut X`)". The same section's Check at `:3210–3211` relies on it.

**Claim.** For every `X` in `Over h_S`, actions of the constant group space `Γ_S` on `X` correspond to group homomorphisms `Γ → Aut X`. The Lean carrier `Groups.Action.IsFree` (`Suggested.lean:332`) also takes an arbitrary `X : Over (yoneda.obj S)`.

**Witness.** Take `S = Spec k`, `Γ = ℤ/2 = {e, σ}`, `X = h_S ⊔ h_S` (presheaf coproduct, `X(T) = Hom(T,S) × {1,2}`), and `ρ(σ) = swap`. For `T = S ⊔ S` with `φ = (e, σ)`, naturality along `j₁` forces `a_T(φ, 1) = 1`, but along `j₂` it forces `2`. So no action extends `ρ`.

**Repair.** State *Action.constantEquiv* for `X` whose underlying presheaf is a Zariski sheaf, e.g. `IsAlgebraicSpace X.left`, which is the setting of Stacks Definition 78.8.1 (043Q). Its inverse glues `ρ(γ)` over the decomposition `T = ⨿_γ T_γ` that a point of `Γ_S` determines. Add the witness as a negative-control Check. Tested on the witness: `X(S ⊔ S)` has 2 elements, while `X(S) × X(S)` has 4, so `X` is not a sheaf and is excluded. For the sheaf `h_{S ⊔ S}`, gluing defines the action extending the swap.

## R02 (P3) — §4.15: Deligne 1985 page numbers are one too low, and "§2.2" does not exist

**Location.** `README.md:7109` "(Deligne §3.3, p. 137)"; `:7119–7120` "(Deligne §3.4, pp. 137–138)"; `:7128–7129` "Proposition 3.5 and its automorphism lemma, pp. 138–140; Corollary 3.6, p. 140"; `:7231` "Deligne §3.7, p. 140"; `:7256` "Deligne §2.2, p. 135"; `:7283` "proof of Deligne Lemme 1.6, p. 133"; `:7289` "Lemme 1.6, pp. 132–133"; References `:8874` "§§3.3–3.7, pp. 137–140".

**Claim.** These are the printed pages of *Le lemme de Gabber*, Astérisque 127, pp. 131–150.

**Witness.** In the Numdam copy (`AST_1985__127__131_0`, cached extraction), printed page = PDF page + 129. The page footers put 3.3 and 3.4 on p. 138 (lines 288, 295), 3.5 on p. 139 (line 325), 3.6 and 3.7 on p. 141 (lines 377, 382), and Lemme 1.6 on p. 133 (line 122).

Further, the Isom-cover extension (`I := Isom(pr₁*X, pr₂*X)`, closure of its image) is on p. 134 (lines 137–146). §2, "DÉMONSTRATION", has no numbered subsections; the pointed genus-one definition is its last paragraph, on p. 136 (lines 229–233). Finally, §3.3 (lines 288–294) says nothing about projectivity; "projectif (Mumford)" is in §3.7 (line 388).

**Repair.** Make these replacements:

- `:7109` becomes "(Deligne §3.3, p. 138, for the finite étale level cover; §3.7, p. 141, for projectivity)".
- §3.4 becomes "pp. 138–139".
- Proposition 3.5 becomes "pp. 139–141", and Corollary 3.6 becomes "p. 141".
- §3.7 becomes "p. 141".
- "§2.2, p. 135" becomes "§2, last paragraph, p. 136".
- The Isom-cover extension in the proof of Lemme 1.6 becomes "p. 134", and Lemme 1.6 itself "pp. 133–134".
- In the References, "§§3.3–3.7, pp. 138–141".

Each new page was read at its footer.

## R03 (P3) — README-only names inside `Suggested.lean`'s namespaces are set in backticks

**Location.** The README's own Convention 5 (`README.md:391–395`): "Proposed names of such README-only items inside the strands of `Suggested.lean` are set in italics … so that they are not mistaken for declarations of that file." It is broken at:

- `:3159` `Spaces.QCoh`;
- `:3194–3199` `GroupSpace.ofGroupScheme`, `ofGroupSchemeFunctor`, `ofGroupScheme_obj`, `ofGroupScheme_forget` and `ofGroupScheme_faithful`;
- `:3783–3784` `QCoh.pullback` and `QCoh.pullbackPushforwardAdjunction`, and `:3802` `QCoh.pushforward`, inside a Check;
- `:5010` `PseudoCoherence.IsPseudoCoherentComplex`;
- `:5182` `Coherent.IsLocalCompleteIntersection`;
- `:7422`, `:7446` `DeJong.IsSplitPrestable`;
- `:8077` `Chow.c1`, `:8104` `Chow.chernClass` and `:8186–8187` `Chow.externalProduct`, `Chow.gysin`, `Chow.IsRegularImmersion`;
- `:8296` and after, `Chow.graphPullback`, and `:8329` and after, `Chow.intersect`.

**Claim.** Each backticked name reads as a declaration of `Suggested.lean`.

**Witness.** None of these names is declared in `Suggested.lean` (`#check` audit below, 100 declarations). The README itself italicises three of them elsewhere: *GroupSpace.ofGroupScheme* at `:3290`, *PseudoCoherence.IsPseudoCoherentComplex* at `:5030` and `:5362`, and *Chow.intersect* at `:8285`. §1.13's *Lean:* line (`:3221–3223`) calls the comparison functor README-only.

**Repair.** Italicise every occurrence listed. The Check at `:3802` should also not name a Lean counterpart: write "the quasi-coherent pushforward of `O` along `j`". No Lean edit is needed.

## R04 (P3) — The `roadmap-summary` block still says quasi-compactness is dropped (carried from the previous report, partly repaired)

**Location.** Pull-request description, generated block `roadmap-summary`: "The curve dichotomy drops quasi-compactness …" and "Quasi-compactness follows from the other curve hypotheses." In the free text: "The shared-folder revisions merge in the order #1656 → #1807 → #1808 → #1854".

**Claim.** The summary says the head drops a hypothesis, and the free text lists #1807 as a revision of this folder.

**Witness.** `Suggested.lean:735` keeps `[QuasiCompact (X ↘ Spec (.of k))]`, and README `:5758–5760` says the same. #1807's 25 changed files include none in this folder. The regenerated `merge-order` block correctly reads "**this pull request** → #1808 → #1854".

**Repair.** Regenerate `roadmap-summary` from this head. Replace the two sentences with "The curve dichotomy retains main's statement; finite type is `LocallyOfFiniteType` together with `QuasiCompact`." In the free text, write "#1656 → #1808 → #1854". No roadmap edit is needed. The last repair report answered this as "not editable from this repair". That is not the "not actionable in this package" marker, and the merge-order half was regenerated since, so the finding is carried rather than settled.

## Previous findings

- R01 (previous report) — partly repaired. The `merge-order` block is regenerated: "`SchemeAndStackFoundations`: **this pull request** → #1808 → #1854", with no #1276. The `roadmap-summary` block still reads "The curve dichotomy drops quasi-compactness", while `Suggested.lean:735` keeps `QuasiCompact`. This is carried as R04.

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

- Gate rerun (`gate … --base origin/main`), exit 0, every counter zero:

      gate SchemeAndStackFoundations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

  The worker's gate on this head also reports `build=0`.
- Dependency check (`--movable --pr 1656`), exit 0, with no UPWARD, CYCLE or `moved:` line:

      depcheck: 235 roadmaps, 2133 edges, 0 problem(s)

- Every roadmap named as a supplier is on main: AlgebraicVectorBundles, StableReduction, JacobianChallenge, ClassFieldTheory, ProfiniteCohomology, QuadraticFormInvariants and GrothendieckEulerForms. ModularCurves and AlgebraicCurves are named as non-suppliers. The settled SchemeAndStackFoundations ↔ JacobianChallenge mutual supply was not re-raised.
- Pins: Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, identical to main's manifest. `git merge-tree origin/main HEAD` is clean. Main's only changes to the folder since the merge base are PROGRESS/STATUS.
- `lake env lean …/Suggested.lean`: exit 0, 48 warnings, all "declaration uses `sorry`", in 50 s.
- `#check @name` for every declaration in one scratch file importing the module: 100 of 101 elaborate. The failure is `Formal.DeJong.map`, a signature-generator artifact, not a declaration. The source carries every binder explicitly; the only section `variable` is `Curve`'s `(k) [Field k]`. `structureModule` correctly drops `k`; `cohomologyDim`, `baseChange` and every `Curve` theorem keep it. The signatures agree with the README statements read below. Nothing changed.
- One-tactic probe: every `sorry` replaced by `first | rfl | infer_instance | simp | trivial` on a scratch copy. All 48 fail: 33 at `assumption`, 15 with unsolved goals. I also searched both pins for Serre's affineness criterion, Grothendieck vanishing, Tsen, generic flatness, Nagata for complete rings, `LineBundleClass ≃ CommRing.Pic` and a linear Noether normalization. None exists, so no headline restates a pinned theorem.
- Headlines. The README summary (`:17–23`) lists them; all are accounted for:
  - Stated: `exists_linear_normalization`, `Ring.IsJapanese.of_complete_local`, `Ring.IsNagata.of_complete_local`, `IsQuasiExcellentRing.isNagata`, `artinBootstrap`, `grothendieck_existence` (with `_fullyFaithful`), `algebraize_hom`, `alteration_theorem`, `semistable_alteration_theorem`, `hodge_index` and `weil_bound`.
  - Named in the docstring as not statable: `K_0 → G_0`, Keel–Mori, coherent duality, the Brauer class, Picard torsors, Schlessinger and GRR.
  - Rechecked at the pins: no algebraic stack, coarse space, Chern character or Todd class, and no Schlessinger hull. `relativePicardFppfSheaf` exists with no representability (`PicardFunctor/Fppf.lean:23`).

### Library declarations opened at the pins

- §0.29: all 50 Tau Ceti names and lines (`Scheme/Characteristic.lean`, `Frobenius/{Basic,Relative,UniversalHomeomorphism,Finite,Etale,Smooth,AffineSpace,Iterate,Twist,FiniteField,Coherence}.lean`). Tau Ceti has only constant-rank `finrank_relativeFrobenius_of_openCover` (`AffineSpace.lean:218`), so the non-constant-rank target is not a restatement.
- §3.2: nine Tau Ceti names at their lines (`Curves/HighDegree.lean:73, :88`, `LineBundle/Effective.lean:57`, `RiemannRoch/Basic.lean:181`, `Curves/GlobalGeneration.lean:48`, which assumes `IsAlgClosed k` as the README says, `FlatBaseChange.lean:173`, `Descent/MorphismProperty.lean:165`, `Elliptic/Basic.lean:97`, `GenusOne.lean:147`).
- §2.3: `Torsor.trivial :159`, `trivialHomEquiv :179`, `NonabelianH1 :226`.
- A mechanical sweep of all 117 "`name` (`file.lean:N`)" pairs in the README found every pair correct. Ordered lists such as "`a`, `b` (`:60`, `:84`)" were paired by position and checked by hand (Kernels/Cokernels/Images/Colimits, Depth, PseudoCoherent, CohenMacaulay, RelativeProj, Annihilator, StrictTransform, Principal, MvPolynomial).
- Mathlib: `Scheme.Hom.finrank` (`Morphisms/FlatRank.lean:89`). At the generic point of an integral `Y` under a finite dominant map it is `[K(X):K(Y)]`, as `vectorBundleDegree_pullback`'s docstring says. Also `IsAzumaya` (`Algebra/Azumaya/Defs.lean:60`: projective, faithful, finite, `mulLeftRight` bijective) and `NoetherNormalization.lean:279, :292`, which give parameters not linear in the generators.

### Sources read at their locators (the seeded sample)

| Target | Locator | Text read | Result |
|---|---|---|---|
| §0.1 | Stacks 01LM, 01LN, 01LC, 02KH (30.5.2, starts p. 2591), §26.7 01I6 | Stacks book extraction, lines 110572–110593, 110231, 123108–123123, 108558 | matches; `i = 0` of flat base change |
| §0.28 | Stacks 26.17.6 (1) (01JU), Example 26.4.3 (01HM) | lines 109567–109574, 108256 | the ideal of a base-changed closed immersion is `Im(g*I → O_Y)` |
| §0.29 | §33.36 0CC6, Def 33.36.4 0CC9, Lemmas 33.36.5–8, Rem 33.36.11 0CCG, 41.14.3 0EBS, 29.37.21 054L | lines 137070–137230, 174972, 119101 | matches |
| §1.6 | Thm 65.10.5 02WW, Lemma 65.10.4 0265, Lemma 65.9.1 0262, Def 65.9.3 0263 | lines 252333–252560 | matches |
| §1.12 | Ex 65.14.1 02Z1, Lemma 66.34.1 071S, Ex 65.14.8 02Z7, Lemma 66.3.3 0AHR | lines 252806, 256130, 252943, 253396 | matches; ℤ acts freely on `T`-points over ℚ |
| §1.13 | Def 78.5.1 043H, 78.8.1 043Q, 78.8.2 06P8, Lemma 78.8.3 06P9 | lines 287788–287953 | matches; 78.8.1 takes `X` an algebraic space (see R01) |
| §1.22 | Def 96.11.1 06WG, Prop 96.14.3 06WT, Prop 103.11.1 077A, Lemma 103.11.2 0GQQ, §103.11 070A | lines 325052, 325287, 342538–342630 | matches; the `𝔸² ∖ 0` Check is 070A's example |
| §1.24 | Kisin 2017 (3.1.1)(1) pp. 34–35, (3.2.1) p. 40; Milne iAG2017 A.64 pp. 580–581; Stacks 0CDQ | kisin-2017 lines 1550–1577, 1770–1780; iAG2017 extraction lines 23790–23840 (PDF 592–593 = printed 580–581) | matches |
| §2.5 | 21.7.1 03F3, §20.30 0FKR, 20.30.1–2 (0FKS, 0FKT), 20.12.3–6 (09SV), 20.20.7 02UZ, 21.16.1 0739 | lines 92363, 88753–88792, 86470–86516, 87310, 93129–93145 | matches; 0739's hypotheses are restated exactly |
| §2.11 | 59.24.1 03P8, 59.28.1/3/4/5 (03PL, 040N, 040O, 040Q), 59.63.1 0A3K, 59.55.1–4 (03QN) | lines 229140–229392, 232346–232362, 231713–231787 | matches |
| §3.2 | 0C1C, 0C1D, 0C1F, 0AYZ, 0C6M, 0C6T, 0C6N, 0C6U, 0E3A–0E3D, 0H2V, 0AYY, 0B5E, 02L6 | lines 211702–211775, 211975–212015, 213362–213427 | matches; `d_x ≥ e_x − 1` with equality iff tame |
| §3.8 | Stacks 047I; Milne AV III Props 2.1, 2.2, pp. 91–92 | lines 170069–170075; milne-av lines 3702, 3737 (printed 91, 92) | matches |
| §4.12 | 052A, 051R, 051S, 0815, 081R, 080K, 080L, 081S, 081T, 081M, 080B, 0200, 0201, 0202 | lines 117622, 167083–167195, 124901–124995 | matches; 0201(1) gives projective `π` |
| §4.15 | DM 1969 (1.5) p. 81, (1.6)–(1.9) p. 83, (1.11) p. 84, (5.1)–(5.2) p. 104; Knudsen II 2.6–2.7 p. 179; CLM 1.10 p. 9, 1.29–1.33 pp. 23–28, §6 pp. 29–38, 1.43 p. 38, 1.44–1.45 pp. 38–41; de Jong 2.23–2.24 pp. 61–62, 4.17 pp. 71–72, 5.13 pp. 80–81; Stacks 0CQM, 0E9C, 088U, 035I, 0BEV/0BEW | Numdam PMIHES 36 (printed = PDF + 73); Math. Scand. 52 OCR line 594–596; NSF PAR text of CLM (fetched without manifest, PDF = printed); Numdam PMIHES 83 | all match except Deligne 1985 (R02) |
| §5.11 | Milne AG Ch. 11 (2024): Def 11.12 p. 9, Thm 11.53, Cor 11.54, Ex 11.55 p. 37, Frobenius p. 38 | AG11 extraction lines 326, 1461–1495 | matches; the subscript swap is stated correctly |

All 46 Stacks tags cited in `Suggested.lean` resolve with matching numbers (02UZ, 01XF/01XG, 0A3K, 03RD, 03RC, 06Z0, 0D66, 0D67, 0D6C, 02H0, 02H6, 02HG, 02HM, 07E8, 0AIF, 088C, 088E, 0899, 09ZT, 0A42, 0AB0, 02RW, 0BEP, 0BEM, 0BEV, 064Q, 08E4, 025Y, 04TY, 04EX, 0AYR, 0A27, 0A26, 0BY9, 0C1C, 0C1D, 0C1F, 0FDI, 0FDJ, 04SK, 04S6, 0AUW, 03RV, 04MF, 032W, 07QV, 04DZ, 02X2). The README flags no locator as unverified.

### Ownership and overlaps

- New objects of this revision, searched by object on main and at the open heads (`roadmaps grep`):
  - Strict local rings: AdicEtaleGeometry's are Huber's, on adic spaces.
  - Étale topological invariance: EtaleCohomologyFoundations §F.0.4 on main consumes §0.23a's `universalHomeomorphismEtaleEquivalence` and owns only the sheaf transport. InverseGalois and NeronModels cite that transport.
  - `toProEt`/`proetaleComparison`: AdicCoefficientsAndComparisons' `schemeEtaleToProEt` is the left-completed adic embedding, a consumer.
  - Linear Noether normalization and `Etale.overEquiv`: no second owner.
- Overlaps: #1808 and #1854 change this folder, in the stated order #1656 → #1808 → #1854. No cited id is dropped, none is defined only by an open revision, and this pull request drops none.
- The resolve tool's 135 "found nowhere" names are this roadmap's own declarations or README-only names; the three Tau Ceti `Torsor` names it flagged are at their stated lines.

### Adversarial table

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| §0.1 Checks (direct images) | `⨿_{n≥0} Spec k → Spec k[t]`, char 0 and char `p`; `⨿_{n≥1} Spec k[t]/(tⁿ)`; `⨿ Spec k → Spec k`, `g = Spec k(s)` | `M_g → ∏_{g(n)≠0} k` bijective even when `{g(n)=0}` is infinite. `t^r·(1)` has coordinate `r+1` nonzero, so `M_t ≠ 0 = O(∅)`. `(sⁿ)` lies in no finite `k`-span of coordinates | Pass |
| §0.28 comparisons | `ℙ¹`, two rational points; `𝔸² ∖ 0 → 𝔸²`, `I = (x,y)`; `I = ⊤, ⊥` | `Γ/ker = k` vs `k×k`. Extended quotient `k` vs section-kernel quotient `0` (`V(I) ×_Y X = ∅`): onto, not injective. Zero sheaf; `O_X` | Pass |
| §0.29 Frobenius | `𝔽_{p²}`; `𝔸¹`; `𝔸¹ ⊔ 𝔸²`; `𝔽_p[ε]`; `∅` | `a ↦ a^p ≠ id`, square `id`. `A[t]⊗_{F}A ≅ A[t′]`, `t′ ↦ t^p`, rank `p`. Ranks `p`, `p²`. `ε ↦ 0`. Zero ring, identity | Pass |
| §1.6 presentations | fold `U ⊔ U → U`; identity atlas; `Δ ⊔ Γ`, char ≠ 2 | quotient `h_U`; `R = X ×_X X = Δ`; `R` quasi-compact, so quasi-separated, and `j` not an immersion (02Z1) | Pass |
| §1.12 `𝔸¹_ℚ/ℤ` | `T`-points; `𝔸¹ ×_X 𝔸¹` | `x + n = x` forces `n = 0` in `Γ(T,O) ⊇ ℚ`, so free; `⨿_{n∈ℤ} 𝔸¹` not quasi-compact, so not quasi-separated | Pass |
| §1.13 *Action.constantEquiv* | `X = h_S ⊔ h_S`, `ρ = swap`, `T = S ⊔ S` | along `j₁`: `a_T(φ,1) = 1`; along `j₂`: `= 2` | **Fail** (R01) |
| §1.13 `Action.IsFree`, `free_iff_mono` | left translation; `𝔾_m` on `𝔸¹` | `gx = x ⇒ g = 1`; `c·0 = 0` for `c ≠ 1`, not free; `(g,x) ↦ (gx,x)` injective iff free on every presheaf | Pass |
| §1.22 pushforward | `j : 𝔸² ∖ 0 → 𝔸²`; `BZ/p` over `𝔽_p` | raw `j_*O(Spec k → 0) = O(∅) = 0` vs `k[x,y] ⊗ k = k`; flat tests agree (02KH). Invariants not exact, `H¹ = 𝔽_p` | Pass |
| §1.24 crossed modules, semilinearity | `∂ = id`; `H̃ = 1`; `SL₂(ℂ) → PGL₂(ℂ)`; `S₃ → S₃` trivial action; `ℂ/ℝ` | one arrow per pair; discrete; coker 1, ker `μ₂` central; `∂(x)·y = y ≠ xyx⁻¹`; `id(i) = i ≠ −i` | Pass |
| §2.5 Checks | Sierpiński, skyscraper `ℤ`; `ℙ^d`; discrete `ℕ`; fold `X ⊔ X → X` | `Γ(G⁰) = ℤ`; `H^d(O(−d−1)) = k`; `⊕ℤ → ∏ℤ` not onto; `Hom_{Over U}(j₁, j₂) = ∅` while `X.Etale` has `id`, so not full | Pass |
| §2.10–2.11 Kummer, Artin–Schreier | `𝔽_p[t^{±1}]`, `μ_p`; `Spec ℝ`, `μ₂`; `n = 1`; `𝔽_p`, `ℤ/p` | `H¹_fppf = 𝔽_p^×·t^ℤ / p-th powers = ℤ/p`, `H¹_ét = 0` (reduced); `ℝ^×/ℝ^{×2} = ℤ/2` vs Zariski `0`; `μ₁ = 1`; `𝔽_p/℘(𝔽_p) = ℤ/p` | Pass |
| §3.1 `isAffine_or_isProper`, `genus_baseChange` | `𝔸¹`; `ℙ¹`; doubled origin; `ℙ¹_L/k`; `y² = x^p − t` over `𝔽_p(t)` | affine, not proper; proper, not affine; excluded by separated; `H⁰ = L`, excluded; after `t^{1/p}`, `y² = (x−s)^p`: arithmetic genus `(p−1)/2`, normalization genus `0` | Pass |
| §3.2 Riemann–Hurwitz, degree bounds | `z ↦ z²`; étale double cover of genus 2; `O(O)`, `O(2O)`, `O(3O)`; real conic | `−2 = 2(−2) + 2`; `g − 1 = 2`, so `g = 3`; `h⁰ = 1` vanishing at `O`; degree-2 map; plane cubic; `ω⁻¹ = O(1)|_X`, degree 2, `h⁰ = 3` | Pass |
| §3.3 `vectorBundleDegree_pullback`, `genus_of_finite_etale` | `z ↦ z²`, `E = O(1)`; `[n]` on `E` | `2 = 2·1`; `0 = n²·0` | Pass |
| §3.8 differentials | `𝔾_m`; elliptic `E`; `g = 0` | `dt/t` free; `dx/(2y + a₁x + a₃)`; `J = 0`, both `Γ(Ω¹) = 0` | Pass |
| §4.12 flattening, Chow | `Bl₀𝔸² → 𝔸²` | flat over `𝔸² ∖ 0`; strict transform along `S′ = Bl₀𝔸²` is the diagonal `≅ S′`; Chow's `π` H-projective (0201) | Pass |
| §4.15 level covers | `m = 4`, `m′ = 60`; `3 = −ζ²(1−ζ)²`; `D(3) ∪ D(5)`; `(0,2)`; constant family | `Γ = GL_{2g}(𝔽₃) × GL_{2g}(𝔽₅)`; `(1−ζ)² = −3ζ`, so `−ζ²(−3ζ) = 3`; all of `Spec ℤ`, while `3, 9` miss `(3)`; `Aut ⊇ 𝔾_m`; rank `(2r−1)(g−1)` | Pass (locators: R02) |
| §5.11 `weil_bound` route | table (i)–(iv); `g = 0`; Hermitian curve over `𝔽_{q²}` | `Γ₀² = q(2−2g) − 2q − 2q + 2q = −2gq`, `Δ₀² = −2g`, `Γ₀·Δ₀ = N − q − 1`; `N = q + 1`; `q³ + 1 = q² + 1 + q(q−1)q` | Pass |
| `exists_linear_normalization` | `n = 0`; `k[x]/(x²)`; `k[x,y]/(xy)`, `y₁ = x+y`; `𝔽₂[X,Y]/(XY(X+Y))` | `d = 0`, `A = k`; `d = 0`, dimension 2; `x² = (x+y)x` integral, `d = 1`; every linear form divides the relation, excluded by `Infinite k` | Pass |
| `Ring.IsNagata/IsJapanese.of_complete_local`, `IsQuasiExcellentRing.isNagata` | `k[[x,y]]`; `ℤ_p`; `ℤ` | complete, so Nagata; G-ring and J-2, so Nagata | Pass |
| `smallEtaleBaseChange_isEquivalence` | `Spec k → Spec k[ε]`; `Spec ℂ → Spec ℝ` | universal homeomorphism; homeomorphism but `Spec ℂ ×_ℝ Spec ℂ` has 2 points, so not universal and excluded | Pass |
| `artinBootstrap`, `torsorRepresentability`, `Torsor.trivial_iff_section` | `a = 𝟙_U`; `P = G`; `Spec ℂ/ℝ` under `ℤ/2` | `F = U`; unit section; no `ℝ`-point, nontrivial | Pass |
| `galois_descent_affine` | `A = 0`; `A = L`; `A = L ⊗ B₀` | `B = 0`; `B = k`; `B = B₀` | Pass |
| `noetherianSpace_vanishing`, `isAffine_of_H1_vanishing` | `∅`; `ℙ^d`, `p = d`; `ℙ¹`; `𝔸² ∖ 0` | `⊥ ≤ d`; `H^d ≠ 0` but `p > d` fails; `H¹(O(−2)) = k`; `H¹(O)` infinite-dimensional | Pass |
| `artinSchreier_vanishing`, `brauer_functionField_curve_trivial` | `Spec 𝔽_p`; `k = ℝ`, `K = ℝ(t)` | `cd_p = 1`, `H² = 0`; `(−1,−1) ≠ 0`, excluded by `IsAlgClosed` | Pass |
| Azumaya theorems | `M_n(R)`; `A = 0`, `R ≠ 0`; `R = 0` | rank `n²`; fibres rank 0 and `FaithfulSMul` both false; both sides vacuous | Pass |
| `alteration_theorem`, `semistable_alteration_theorem` | `𝔸¹`, `Z = {0}`; `Spec k`, `Z = ⊤`; `ℤ_p[x,y]/(xy−p²)` | `ℙ¹`, `B = {0,∞}`; `B = ∅`, SNC vacuous; one blow-up, `uv = p` | Pass |
| `CH_coprod`, `intersectionNumber`, `hodge_index` | `I = ∅`; `ℙ¹×ℙ¹`, `H = (1,1)`, `D = (1,−1)`; `D = 0` | zero cycles; `χ(O) − 2χ(O(−1,−1)) + χ(O(−2,−2)) = 1 − 0 + 1 = 2`, `D·H = 0`, `D² = −2`; equality and numerically trivial | Pass |
| `weil_bound` | `ℙ¹/𝔽_q`; `y² + y = x³` over `𝔽₂` | `0 ≤ 0`; points `(0,0), (0,1), ∞`, `|3 − 3| = 0 ≤ 2√2` | Pass |
| Not statable (Keel–Mori, duality, Brauer class, `Pic^d`, Schlessinger, GRR, `K_0 → G_0`) | pins, by object | no carrier at either pin (searched as above) | Pass |

## Not verifiable

- `kempf-1978` and `hartshorne-1977`: the manifest records both as uncertified, so they are settled and were not requested. The sampled targets cite neither directly.
- Huber 1996 (interface (iii)), SGA 4 XVI and Grothendieck 1966: no sampled target cites them, so they were not read.

## Source issues

- none

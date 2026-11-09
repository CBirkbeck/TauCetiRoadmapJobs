# Review of AlgebraicTopologyPartII (pull request #1694 at ed88288)

**Verdict:** accepted

This is an incremental re-review of the 2 README lines changed since 4855915. The only change is on line 30.

- **Gate.** It passes on this head.
- **`Suggested.lean`.** It is byte-identical to 4855915 and elaborates with `sorry` as its only warning.
- **Dependency check.** It reports 0 problems.

No finding remains:
- Previous R02 is repaired exactly as prescribed, and the repair introduces nothing new.
- Previous R01 is withdrawn rather than carried, for the reasons under "Previous findings". The author disputed it twice with reasons, and both reasons hold when checked against the supplier's text.

The acceptance is conditional on the 14 declared supplier gaps. They are listed in the verdict file.

## Previous findings

- R01 — not repaired: line 132 still reads "What EtaleDualityAndPerverseSheaves must provide (gap:configuration-cover-comparison): Expose §§3.5–3.7 on the ordered-root S_m torsor … compatible in one comparison diagram with InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T4." **Withdrawn, not carried.**
- R02 — repaired: line 30 now reads "Their full consumed statements, coefficient conventions and Checks are in Exact supplier contracts; §§8.1, 10.1, 12.1 and 15.6 apply those interfaces."

**Why R01 is withdrawn.** R01 asked for line 132 to equal the plan's `needs` word for word. Four facts show that the README sentence is the correct contract.

1. **Wording differences are not a finding category.** For declared gaps the review rules allow only four findings:
   - an unowned supplier;
   - a vague or compound `needs`;
   - a gap asking for what is already provided;
   - a supplied-looking citation of a section that does not exist.

   A README contract worded differently from `plan.json` is none of these. The contract also counts as declared: the same slug, `configuration-cover-comparison`, with the same supplier, is in `plan.json` and in the README.
2. **The plan's two extra sections do not apply.** The plan's text adds EtaleDualityAndPerverseSheaves §3.8 and §6.5. At that roadmap's head (23180d4):
   - §3.8 (README line 3627) is "Analytic smooth trace compatibility". It works over a complete, nontrivially valued, non-archimedean field k, with Huber analytifications over Spa(k,k°).
   - §6.5 (line 6935) defines contracting correspondences and their Frobenius twists.

   Neither one is used by this roadmap's configuration strand. Lines 428–616 (Layers 1–3) contain no occurrence of "contracting", "correspondence", "Huber", "nonarchimedean", "§3.8" or "§6.5". The whole README contains no occurrence of "§3.8", "§6.5" or "3.5–3.8".
3. **The README contract asks for something real, in the right direction.** It asks for compatibility with InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T4.
   - These sections exist at that roadmap's head (9432671), at lines 532, 567 and 589.
   - They supply the descended compact-support Frobenius trace formula, which the §2.3 trace route consumes (line 505).
   - InverseGalois is at line 54 of the merge order and EtaleDuality at line 107, so asking EtaleDuality for this compatibility points down the supply direction.
4. **No correct repair exists inside the folder.** Copying the plan's text would make the README cite §3.8 and §6.5 for statements they do not make, which is itself supplier drift. `plan.json` does not change after the design stage. So line 132 is the precise and minimal contract.

The intake-side wording is a matter for the operator; see the last remark under "Verified sound".

## Verified sound

**Gate, build and order**
- **Gate**, run on this head: `gate AlgebraicTopologyPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate on this head also reports `build=0`.
- **Dependency check:** `depcheck: 239 roadmaps, 2320 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Merge order:** AlgebraicTopologyPartII is at line 225, after its suppliers:
  - InverseGaloisAndArithmeticFundamentalGroups at 54;
  - MotivesAndAlgebraicCycles at 91;
  - EtaleDualityAndPerverseSheaves at 107.
- **Outside the folder:** `git diff --stat origin/main...HEAD` lists 3 files, all in the folder (`README.md`, `Suggested.lean`, `metadata.toml`). `git diff --stat 4855915 HEAD` changes only `README.md`, by 1 insertion and 1 deletion.

**Elaboration and signatures**
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/AlgebraicTopologyPartII/Suggested.lean` gives exactly 14 ``declaration uses `sorry` `` warnings, at lines 69, 108, 165, 174, 189, 215, 231, 250, 374, 403, 418, 472, 489 and 505, and no other message. The file is unchanged since 4855915: `git diff --quiet` is clean.
- **Sorried theorems.** They are:
  - `configurationTraceFormula`, `stableConfigurationDiagonal`, `tameFibreBouquet`, `rationalBouquetRanks`, `doubleLoopBetti`, `phamStrongRetraction`, `fermatDoubleLoopSimplyConnected`;
  - `equivariantEhresmannTransport`, `ControlData.exists_flow`, `ControlData.exists_isControlledVectorField_lift`, `ControlData.exists_trivialization`, `exists_controlData_isCompatible`, `firstIsotopyLemma`, `equivariantStratifiedTransport`.

  The module docstring's "Not statable at the pins" list (line 15) is unchanged. The headline coverage and the padding probe (14 of 14 one-tactic attempts fail) are carried from r8 and r9, because the file is unchanged.
- **Dropped-binder leads.** `signatures.md` flags 7 declarations as possibly missing binders: `ControlData`, `IsCompatible`, `IsInvariant`, `IsNormalized`, `IsControlledSubmersion`, `WhitneyB` and `IsWhitneyStratification`. All 7 leads are false. I checked mechanically that each elaborated type contains `[inst : (i : ι) → TopologicalSpace (S i)]` and `[(i : ι) → ChartedSpace (EuclideanSpace ℝ (Fin (d i))) (S i)]`.
- **Citation leads.** The 4 Lean-name leads in `citations.md` are this roadmap's own declarations, at `Suggested.lean` lines 357, 374, 394 and 403.

**The changed line 30, item by item**
- **Consumer list.** An awk pass over every `*Needs:*` line found the lines naming one of the three interfaces (finite Borel approximation, the Steenrod-conjugated real pushforward, Ext stalks):
  - 953 (§8.1);
  - 1066 (§10.1);
  - 1250 (§12.1);
  - 1509 (§15.6).

  That set equals line 30's {§8.1, §10.1, §12.1, §15.6}.
  - §14.2 (line 1389) and §16.4 (line 1713) cite SchemeAndStackFoundations §2.23 for generic equivariant sheaves and for `forget_injective`/`coind_injective`, not for Ext stalks.
  - `gap:finite-group-ext-stalk` occurs only in its contract (line 100). §15.6 consumes it through the §7.6a specialization.
- **Ownership sentence.** It matches the supplier contracts:
  - finite Borel approximation, §7.6b (line 219);
  - Steenrod-conjugated pushforward, §7.6b (line 193);
  - SchemeAndStackFoundations §2.23 (line 100);
  - the §7.6a specialization (line 203).
- **Cross-roadmap citations, resolved:**
  - MotivesAndAlgebraicCycles §7.6a (line 1402) and §7.6b (line 1413) at head b8e693e;
  - SchemeAndStackFoundations §2.23 on main (line 4558).
- **Style.** The changed line has no process words, no LaTeX and no pull-request numbers.

**Gaps.** `plan.json` and the README carry the same 14 slugs with the same suppliers. A mechanical comparison finds 13 identical `needs` sentences. The one that differs is `configuration-cover-comparison`, discussed under "Previous findings". None of the 14 gaps is unowned, and none asks for what its supplier already states.

**Ownership and overlaps.**
- `overlaps.md` lists no open pull request that changes this folder and no dropped id.
- This head drops no id; line 30 renames nothing.
- The roadmaps citing AlgebraicTopologyPartII are MorseNovikov (§13.3) and StratifiedSpacesAndTameTopology (§§16.1a–16.1e). Neither cites line 30.

**Seeded sample, within reach of the change.** Line 30 now names §10.1. The sampled targets that depend on it, plus the §9.2 class used throughout Layer 10, were read at their locators. All three hold.

| Target | Source line(s) read | Agreement |
|---|---|---|
| 10.4 Real boundary trace formula | BW line 901 (Lemma 1.13, printed p.23; its proof runs to p.24, page marker at line 928) | The source's composite δ_2d from H⁰⊕…⊕H^(2d−1) to ℤ/2 equals deg(zγ⁻¹). The README restricts to geometrically connected X with d≥1. When X(R)≠∅, smooth and irreducible already imply geometric irreducibility; when X(R)=∅ both sides are 0. No case is lost. |
| 10.5 Self-duality of corrected localization | BW line 876 (Theorem 1.12, printed p.22); lines 878–879 (the duals of u_i, v_i, w_i are w_(2d−i), v_(2d−i), u_(2d−i)); lines 864–875 (the pairing deg(xyγ), (1.47)) | Adjoints and pairing as in the README. The README's "degree-i left window" is the source H^(i−d)⊕…⊕H^(i−1) of u_i (BW line 851). Its degree-(2d−i) right window is H^(d−i+1)⊕…⊕H^(2d−i). That is BW's (1.47) with i↔2d−i. |
| 9.2 Real-locus self-intersection class | BW line 663 (Definition 1.4, p.17), line 668 (Lemma 1.5), line 699 (Remark 1.6, p.18) | γ is the image of the equivariant fundamental class; its degree-0 component is 1. Remark 1.6(i) cites Krasnov for γ=w(TX(ℝ)), as the README records. |

The other sampled targets lie outside the changed passages and do not cite line 30: 3.1, 4.5, 4.6, 7.4, 11.3, 12.2, 13.1, 14.3, 15.4, 16.1, 16.1e and 16.3. They were not re-read; earlier rounds checked them (12.2 and 16.3 in r9).

**Adversarial table.**
- Rows marked "r9" are carried from PRREVIEW-AlgebraicTopologyPartII r9 for statements this diff leaves untouched.
- Rows marked "r8 via r9" were carried by r9 from r8.
- The other rows were computed in this review.

| Statement | Instances | Values (left / right) | Result |
|---|---|---|---|
| Line 30 consumer list (changed) | every *Needs:* line naming the three interfaces | {§8.1 (953), §10.1 (1066), §12.1 (1250), §15.6 (1509)} / line 30: {§8.1, §10.1, §12.1, §15.6} | equal |
| Line 30 owners (changed) | contracts and supplier headings | Borel approximation, §7.6b: contract line 219, heading at b8e693e line 1413. Steenrod-conjugated pushforward, §7.6b: line 193. Ext stalk, SchemeAndStackFoundations §2.23: line 100, main line 4558. Semialgebraic Ext stalk, §7.6a: line 203, heading at b8e693e line 1402. | all resolve |
| §10.1 route against finite Borel approximation (depends on the change) | BW proof of Proposition 1.10, lines 816–821 | Uses (1.8) (line 380), (1.9) (line 382), (1.16) (line 453). The Borel approximation (1.17)–(1.18) at lines 469 and 478 is not used. / The line 1066 *Needs:* lists §7.6b "(finite Borel approximation)" and the plan lists `AT2.8/finite-borel` | consistent with the README's own graph; remark below |
| Gap `configuration-cover-comparison` (R01) | README line 132 against `plan.json` | 13 of 14 `needs` equal. Plan extras: §3.8 (non-archimedean k, Spa(k,k°)) and §6.5 (contracting correspondences). Uses in Layers 1–3 (lines 428–616): 0 and 0. IG §§IG.0.T2–T4 at 9432671 lines 532, 567, 589. Order: IG 54 < EDPS 107. | README contract minimal; R01 withdrawn |
| §10.4 Check (sampled) | ℙ² with z=a; ℙ¹ with z=generator of H¹ and z=1; X(R)=∅ | ℙ²: γ⁻¹=1+a, zγ⁻¹=a+a², degree 1, against deg z=0. ℙ¹: γ=w(TS¹)=1, giving 1 and 0. X(R)=∅: 0 / 0 | holds |
| §10.5 Check (sampled) | RP², d=i=2, x=1 ∈ H⁰⊕H¹, y=a ∈ H¹⊕H² | deg(xyγ)=deg(a+a²)=1 / uncorrected deg(a)=0. (1+a+a²)(1+a)=1+2a+2a²+a³ ≡ 1 mod (2, a³) | holds |
| §9.2 γ on RP² (sampled) | w(T RP²)=(1+a)³ | 1+3a+3a² ≡ 1+a+a² / README γ=1+a+a², γ⁻¹=1+a | holds |
| Layer 14 Dependencies (r9) | union of the §§14.1–14.3 *Needs:* lines | 5 items / 6 items, the extra being §7.2; H¹(C₂,ℤ(1))=ℤ/2 | holds |
| §15.6 *Needs:* (r9) | against the plan's `AT2.15/circle-extension` | {15.1, 15.5, 7.3, 12.2, gap} / the same five prerequisites | equal |
| Layer 15 Dependencies (r9) | union of 6 *Needs:* lines | 12 / 12 | holds |
| Ext-stalk gap as consumed by §15.6 (r9) | stalks ℤ[C₂], ℤ, ℤ(1); q=0,1,2 | ℤ,0,0; ℤ,0,𝔽₂; 0,𝔽₂,0 / contract Checks, lines 208–209 | holds |
| §15.6 Check, n=2 (r9) | E=(𝔽₂⊕ℤ)/⟨(1,2)⟩ | (0,1) has order 4 / ℤ/4 | holds |
| §15.1 at n=2 (r9) | (Tr,π): (a,b)↦(a+b, a−b) | determinant −2, index 2 / \|ℤ/2\|=2 | exact |
| §12.1 surfaces (r9) | RP², torus, Klein bottle | deg w₁²: 1, 0, 0 / χ mod 2: 1, 0, 0 | holds |
| §14.1 (r9) | split and connected double covers of S¹ | monodromy +1, −1 / L constant and sign | holds |
| §16.3 (r9) | T=pt; S² with trivial action, j=0 | index 1, 1 / 1, 1 | holds |
| Layer 16 opening (r9) | topics against headings | 7 ↔ §§16.1, 16.1a–e, 16.2, 16.3, 16.4 | holds |
| `configurationTraceFormula` (r8 via r9) | q=2, m=2, χ≡1; χ=sgn; m=3; m=0 | 2/2; 0/0; 4/4; χ(∅)/χ(∅) | holds |
| `eulerExponent` (r8 via r9) | (4,2,r), (5,2,r), (5,1,r); r=0 | −2,−1,−2; 2,−3,2; 1,−1,0,0 / BS (7.2); 0 | holds |
| §3.1 product (r8 via r9) | N=1, n even and odd | 1−T / 1+T | holds |
| `doubleLoopFactor` (r8 via r9) | n=5, N=1, r=1,2 | (1−t²)⁻¹, 1+t⁵ / (1+t⁵)/(1−t²) | holds |
| `stableConfigurationDiagonal` (r8 via r9) | (0,3,2,2); (0,3,3,3); (1,1,2,1); (0,1,1,0) | 3/3; 4/4; 1/1; 0 against 1 | `hd` needed |
| `tameFibreBouquet` (r8 via r9) | z^k; x³−3x+y²; n=0 | k points; μ=2; empty against S⁰ | `hn` needed |
| `rationalBouquetRanks` (r8 via r9) | s=1, N=2, k=1,2,3; s=0 | 2,0,1 / Hilton; 2,3,2 / the same | holds |
| `doubleLoopBetti` (r8 via r9) | S⁴; N=0 | 1,0,1,0,1,1,1 / (1+t⁵)/(1−t²); 1 / 1 | holds |
| `phamStrongRetraction` (r8 via r9) | n=0; n=1, k=3; k=(2,2) | ∅/∅; μ₃=S; (√2,i)∈X∖S | holds |
| `fermatDoubleLoopSimplyConnected` (r8 via r9) | n=5; n=4 | π₂S⁴=π₃S⁴=0; π₁Ω²S³=ℤ | n≥5 needed |
| `equivariantEhresmannTransport` (r8 via r9) | x² on ℝ, b=1 and b=0 | equivariant h; fibres of 0, 1, 2 points | `hreg` needed |
| `equivariantStratifiedTransport` (r8 via r9) | ℝ×S¹, z↦z̄ | unaveraged h(π/2,1)=(π/2,−i) / averaged h=id | averaging needed |
| `ControlData`, `WhitneyB` (r8 via r9) | 3 strata of ℝ²; cusp; t·sin(1/t) | Jacobian 2xy/√(x²+2y²)≠0; distance →0 against →1 | holds |
| §§2.1, 5.2, 7.2, 7.3, 9.5, 10.1, 11.4, 13.2, 15.2 (r8 via r9) | as recorded in r8 | as recorded in r8 | hold |

**Remarks on untouched text** (no R-number; no change asked)
- **§10.1 *Needs:* (line 1066).** Line 1066 lists "§7.6b (finite Borel approximation)", but BW's proof of Proposition 1.10 (lines 816–821) goes through (1.8), (1.9) and (1.16), not the Borel approximation (1.17)–(1.18). The extra item creates no upward edge or cycle, because §7.6b is cited there anyway for duality.
- **Untagged gap.** The slug `configuration-cover-comparison` appears in no *Needs:* line. Lines 469 and 505 cite EtaleDualityAndPerverseSheaves §§3.5–3.7 without it, while the other gaps are tagged at their consumers.
- **For the operator.** The gap text the intake announced from `plan.json` still names §3.8 and §6.5 and omits the §§IG.0.T2–IG.0.T4 compatibility. Announcing the README's line 132 wording instead would give the supplier the precise contract. This concerns the board, not this folder.

## Not verifiable

These are settled, and I cite them by locator only:
- uncertified: HILTON (Theorem A, Corollary 4.10), DIMCA (Lemma 4), BRUMFIEL (pp.163–169), SCHEIDERER (Corollary 18.11) and BCR (Theorem 9.3.2);
- waived: KRASNOV (Theorem 2.1). This is the source of γ_X=w(TX(ℝ)) cited at BW line 699.

## Source issues

- none

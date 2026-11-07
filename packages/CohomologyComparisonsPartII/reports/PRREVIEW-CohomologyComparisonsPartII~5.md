# Review of CohomologyComparisonsPartII (pull request #1364 at 0d00ac6)

**Verdict:** accepted

This is an incremental re-review of the 20 changed lines since 33ee465. There are 10 insertions and 10 deletions, all in `TauCetiRoadmap/CohomologyComparisonsPartII/README.md`. `Suggested.lean` is unchanged, and nothing changed outside the folder.

The change answers R01 and R02 of the previous report:

- The tube-filtered complex of §2.2 now takes an arbitrary V-compactification.
- κ_r now follows BesserI's proof of Proposition 9.5 through a de Rham datum of X_K.
- Existence and common refinement of compactifications are now cited to EtaleCohomologyFoundations §§G.2–G.3.

Both findings are repaired, and the repair introduces no new defect. The gate passes and the file elaborates.

No findings.

## Previous findings

- R01 — repaired: line 359 now reads "Choose a compactification X⊂X̄ over V, that is, an open immersion into a proper V-scheme … No condition is placed on the generic fibre X̄_K … Y=X̄ is always allowed, since X is smooth over V".
  - "Admissible" no longer occurs in §2.2.
  - Line 379 evaluates Fil^r_tub with Y=X̄=C_V, and κ_1 there uses P=ℙ¹_K.
- R02 — repaired: the existence sentence is gone. Line 359 now reads "present F^rRΓ_dR(X_K/K) by Ω^(≥r)(log D) on a de Rham datum of X_K … restrict to X_K, analytify to RΓ(X_K^an,Ω^(≥r)), and restrict to the strict neighbourhoods … contained in X_K^an".
  - The *Needs:* lines 338 and 368 cite EtaleCohomologyFoundations §§G.2–G.3 for the compactifications.
  - The de Rham datum P comes from `relative-hodge`, whose interface (line 96) supplies F^r "from smooth proper normal-crossings compactifications" (BesserI Definition 5.1).

## Verified sound

### Gate, dependency check, elaboration

**The worker's gate at 0d00ac6:** every counter is 0, including build=0, then `OK`. I reran the gate from the worktree against `origin/main`. Every counter was 0 and it printed `OK`, exit 0. My run printed no build counter, so I elaborated the file separately (below).

**The prescribed dependency check**, with `--movable`, against the board merge order and the main content tree:

```text
depcheck: 239 roadmaps, 2426 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The diff adds edges to two roadmaps, both earlier in the order than this roadmap (line 203):

| Supplier | Merge-order line | Where it is |
|---|---|---|
| EtaleCohomologyFoundations | 57 | on main |
| ColemanIntegration | 136 | open head, already a supplier of §2.2 |

**Elaboration.** `lake env lean` on `TauCetiRoadmap/CohomologyComparisonsPartII/Suggested.lean` gives exit 0, no output, 4.1 s. The file is unchanged since 33ee465:

- `module`, then `import Mathlib`;
- the module docstring naming eleven headline groups as not statable at the pins;
- an empty namespace.

So there are no signatures to `#check` and no sorried statements to probe for padding. The diff changes no headline.

**Diffs.**

- `git diff --stat origin/main...HEAD` outside the roadmap folder is empty.
- `git diff --stat 33ee465..HEAD` shows only the folder's README.md, 10+/10−.
- The diff touches no contract, so the 34 contract slugs still match `design/plan.json` as in the previous report.

### The changed passages

| README line | Change | What was checked |
|---|---|---|
| 13 | scope: EtaleCohomologyFoundations §§G.2–G.3 own Nagata compactification and common refinements | true on main: `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` line 105 (§G.2 `nagataCompactification`) and line 139 (§G.3 `compactificationCommonRefinement`) |
| 82 | supplier contract for §G.2 and §G.3 | Hypotheses match the Lean at main, `TauCetiRoadmap/EtaleCohomologyFoundations/Suggested.lean`: line 155 (qcqs S; separated, locally finite-type, quasi-compact f), line 161 (dense refinement with maps to both), line 150 (`Compactification.Hom.proper`). Spec V is affine. Rows E02 and E03 |
| 338 | §2.1 *Needs:* adds §§G.2–G.3 | §2.1's sp uses a V-compactification X̄ (BesserI line 676–678), so the entry is needed |
| 359 | arbitrary compactification; κ_r through a de Rham datum P; X_K^an is a strict neighbourhood; κ_r is a map of fibres | rows E01, E04–E06 and E12; locators in row E14 |
| 361 | κ_r is independent of P and of (X̄,Y) | row E07 |
| 366 | proper case with P=X_K | row E08 |
| 368 | §2.2 *Needs:* adds §§G.2–G.3 and RigidAnalyticGeometry §8.1 | analytification is now used explicitly, so §8.1 is needed; both entries are earlier in the order |
| 379 | cuspidal-cubic Check rewritten | row E11 |
| 406 | Layer 2 Dependencies adds §§G.2–G.3 and ColemanIntegration §L3.Fb.1 | row E13 |
| 951 | BesserI reference: adds lines 677–678 and 1146–1154 and "with its proof" | row E14 |

### Adversarial pass

These rows carry forward unchanged, for the statements the diff leaves untouched:

- rows A01–A150 of the first report (head 8858e49): Conventions, §§1.1–1.6, 2.1 (statement and Checks), 2.3, 3.1–3.4, 4.1–4.5, 5.1–5.3, 6.1–6.7 and 7.1–7.5;
- rows B01–B10 of the report at head c9807db;
- rows C01–C03, C08, C10, C11 and C13 of the report at head 212f91b;
- rows D03, D04, D05 and D12 of the previous report (head 33ee465): Y smooth near X, Fil_tub at Y=X̄ as the stupid filtration, agreement with ColemanIntegration's Ω•(U), and the earlier locators.

Rows D01 and D02 concerned text that has been deleted. Rows D06–D11 are recomputed below for the new construction (E04, E06–E11).

| ID / statement | Instance tried | Values on each side, or valid versus wrong model | Result |
|---|---|---|---|
| E01 compactification = open immersion into a proper V-scheme (line 359) | A¹_V⊂ℙ¹_V; A¹_V⊂C_V; Spec K=D(π)⊂Spec V; Spec V⊂Spec V; A¹_V⊂A¹_V; non-dense A¹_V⊂ℙ¹_V⊔ℙ¹_V | The first four are allowed. A¹_V⊂A¹_V is excluded, since A¹_V is not proper. The non-dense one is allowed: ]Z[ contains the whole second copy, so the strict neighbourhoods inside the first copy are cofinal and the value equals the ℙ¹_V value | Definition admits exactly Besser's data (BesserI line 1106) |
| E02 any two dominated by a third (lines 82, 359) | (ℙ¹_V, C_V) for A¹_V | The closure of (id,ι)(A¹_V) in ℙ¹_V×C_V is the graph of the normalization ν, which is ≅ℙ¹_V. The projections id and ν are proper and are the identity on A¹_V | Matches §G.3 (Lean line 161) |
| E03 supplier hypotheses (line 82) | X→Spec V, X smooth separated of finite type | §G.2 needs S compact and quasi-separated and f separated, locally of finite type and quasi-compact; all hold. In `Compactification` (Lean lines 33–41) j is a quasi-compact open immersion and p is proper. Quasi-compactness is automatic for Noetherian X | Contract wording exact |
| E04 κ_1 filtered component (line 359; Check line 377) | A¹_V⊂ℙ¹_V, P=ℙ¹_K, D=∞ | Ω^(≥1)(log∞)=O(−1)[−1] has no cohomology, so the filtered component is 0. H¹(Fil¹_tub)=K⟨x⟩†dx. H¹(RΓ̃) is an extension of K⟨x⟩†dx by coker(K0→K0⊕K)≅K, because 1−σ/p is bijective on K0 (v(σa)=v(a)<v(pa)). H¹_rsyn=K | Agrees with Check line 377; κ_1 is not an equivalence |
| E05 X_K^an is a strict neighbourhood (line 359; BesserI line 677–678) | A¹_V⊂ℙ¹_V; Spec K⊂Spec V | ]A¹_k[={\|x\|≤1} and ]∞_k[={\|x\|>1}. The cover {\|x\|≤ρ}, ρ>1, together with ]∞_k[ is admissible: on {r₁≤\|x\|≤r₂}, refine by {r₁≤\|x\|≤ρ} and {ρ′≤\|x\|≤r₂} with 1<ρ′<ρ. Also {\|x\|≤ρ}⊂A¹,an. For Spec K, X_K^an=Sp K is the whole space | Claim holds; the image lies in Fil^r_tub |
| E06 forgetful map ∘ κ_r = sp_r (map of fibres, line 359) | G_m,V⊂ℙ¹_V, r=1, P=ℙ¹_K, D={0,∞} | dx/x∈H⁰(Ω¹(log{0,∞})) restricts to dx/x on {λ≤\|x\|≤λ⁻¹}, whose class in H¹_rig(G_m,k/K) is sp_1(dx/x). For (a,b)=([dx/x],dx/x): (1−φ/p)a=0 since φ(dlog t)=p·dlog t, and bc(a)−sp_1(b)=0=bc(a)−forget(κ(b)) | A cocycle on both sides, matched by κ_1 |
| E07 κ_r independent of P (line 361) | A²_V; P=ℙ²_K (D a line) versus P′=ℙ¹×ℙ¹ (D′ two meeting lines), r=2 | Ω²(log D)=O(−2) on ℙ² and Ω²(log D′)=O(−1,−1) on ℙ¹×ℙ¹; all cohomology of both is 0. So F²=0 for both data and both filtered components are 0 | Same κ_2; consistent with H*_dR(A²_K)=K in degree 0 |
| E08 proper X (lines 363, 366) | ℙ¹_V, X̄=Y=X, P=ℙ¹_K; r=0,1,2 | The only strict neighbourhood of ]X_k[=X_K^an is the whole space. r=0: H⁰=H²=K on both sides. r=1: H¹=0 and H²=H¹(ℙ¹,Ω¹)=K on both sides (GAGA). r=2: 0 on both sides | Equivalence route closes |
| E09 Spec K⊂Spec V, r=0 (recomputes D09) | P=Spec K, X_k=∅ | ∅ is a strict neighbourhood of ∅ in Sp K, so Fil⁰_tub=0 and κ_0: K→0 | Consistent with the §2.1 Check sp: K→0 |
| E10 X=Spec V (Check line 376; recomputes D11) | P=Spec K, X̄=Y=Spec V | r≤0: K→K, the identity. r>0: 0→0 | κ_r is the identity |
| E11 cuspidal-cubic Check (line 379) | C_V: y²z=x³, A¹_V via t↦[t:1:t³] | y²z=t³=x³. y=0 forces x=0, giving [0:0:1]. Chart y=1: z=x³ with ∂/∂z=1, so smooth over V. Chart z=1: y²−x³ has partials −3x², 2y, both 0 at the origin: singular. ν[u:w]=[uw²:w³:u³] satisfies y²z=w⁶u³=x³, ν[t:1]=[t:1:t³] and ν[1:0]=[0:0:1]. Near the cusp, x/z=t⁻² and y/z=t⁻³; for \|t\|>1, max=\|t\|⁻²≥λ ⇔ \|t\|≤λ^(−1/2) (λ=1/4 gives \|t\|≤2) | Every value as stated |
| E12 Y=X̄ allowed since X is smooth (line 359) | C_V for A¹_V | Smooth near A¹_V (E11), as BesserI Remark 9.2 (line 1126) needs; Y=X̄ is not smooth near the cusp, and nothing requires it to be | Correct |
| E13 Layer 2 Dependencies (line 406) against the §§2.1–2.3 *Needs:* | union of the three *Needs:* lines | AdicSpacesPartIV F1.5, F1.7 ⊂ F1.5–F1.9; RigidAnalyticGeometry 8.1, 8.4; EnhancedDerivedSheaves 0.1–0.4 (and §E5:abstract on §2.3's line); EtaleCohomologyFoundations G.2–G.3; ColemanIntegration L3.Fb.1; the two contracts | The two added entries are exactly the diff's new *Needs:* items; every supplier roadmap is listed |
| E14 new locators | BesserI line 677–678, line 1146–1154, line 652 | Line 677–678 (p. 18, marker at line 668): X_K^an is a strict neighbourhood of ]X_k[ in ]X̄_k[=X̄_K^an. Line 1146–1154 (p. 30, marker at line 1124; p. 31 begins at line 1159): proof of Proposition 9.5, with compactification X̄, de Rham datum, U=X_K^an, Fil^nΩ_U=Ω^(≥n)_U and a map as in (5.2). Line 652 is Definition 5.1, with the datum at lines 649–651. Definition 9.1 is on p. 29 (marker at line 1087) | Correct; "manuscript pp. 18,29–30" correct |
| E15 consumer reading | PadicHodgeRegulators lines 90, 268 and 277, at its open head | It consumes "filtered by powers of the ideal of the generic fibre of the compactification and by form degree", κ_n an equivalence for proper X, and the identity at Spec R. All three still hold, and no consumer relies on a condition on X̄_K | Unaffected |

### Sources, library and cross-roadmap checks

**Sources.** Of the seeded sample, only §2.1 falls in the changed passages, through its *Needs:* line. I re-read its locators:

- BesserI line 625: the σ-semilinear Φ, p. 16;
- BesserI line 648: de Rham data and Definition 5.1, p. 17;
- BesserI line 663: the de Rham-to-rigid map, p. 17, continued on p. 18 at lines 670–688.

They are consistent with the new κ_r. BesserI's setting (line 93–95) is a complete DVR with residue field of characteristic p, perfect where needed, which matches the README's generality. The other 14 sampled targets lie outside the diff and carry forward from the first report.

**Library.** The diff adds no Mathlib or Tau Ceti citation. The roadmap declarations I opened are at main in `TauCetiRoadmap/EtaleCohomologyFoundations/Suggested.lean`:

- lines 33–41: `Compactification`;
- lines 46–50: `Compactification.Hom`;
- line 150: `Compactification.Hom.proper`;
- line 155: `nagataCompactification`;
- line 161: `compactificationCommonRefinement`.

**Cross-roadmap citations resolved:**

- EtaleCohomologyFoundations §§G.2–G.3 and the two backticked names, on main;
- ColemanIntegration §L3.Fb.1, at its open head (the section heading is present);
- PadicHodgeRegulators, the consumer, at its open head (row E15).

**Ownership and overlaps.** The diff makes this roadmap own no new object. The compactification results are imported from their owner. A `roadmaps grep` for the tube-filtered complex and κ_r over main and the open heads hits only this roadmap and PadicHodgeRegulators. The overlap report lists no other pull request that changes this roadmap and no dropped id in either direction. Ownership against open pull requests whose files the brief does not supply was checked only through that grep.

**Citation lead.** The lead "HuberKings §2.2" cites a source, not a roadmap, so it is a false positive.

## Not verifiable

- The OCR of BesserI drops the bars over X̄ in lines 677–678, 1106–1108 and 1149–1153. I fixed the readings from context: "]X̄_k[ = X̄_K^an" at line 678, which needs properness, and U = X_K^an at line 1150.
- As in the previous reviews, the cited sections of AInfCohomology, CohomologyComparisons, CrystallineCohomology, PadicPeriodRings, PadicHodgeTheory, PadicDifferentialEquationsAndRigidCohomology and PrismaticCohomologyPartIII are not in the supplied main tree. The diff adds no citation of them. BesserII remains settled as uncertified, and no changed line uses it.

## Source issues

- none

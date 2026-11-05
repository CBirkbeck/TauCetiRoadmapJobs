# Review of FourManifolds (pull request #936 at 4f1f8a9)
**Verdict:** accepted

Incremental re-review of the 2 lines changed since `37548f6`: the one bare `FQ` at line 1525 is expanded to “no adaptation of Freedman–Quinn's argument”, exactly the repair the previous report proposed. The repair introduces nothing new, the gate, the dependency check and the elaboration pass on my own runs, and `Suggested.lean` is byte-identical to the head the previous review read. One P3 remains, a pre-existing typo in the same paragraph.

## R01 (P3) — Stray article in the same paragraph as the changed sentence

**Location:** `TauCetiRoadmap/FourManifolds/README.md:1530` (“using this section's the normal-bundle theorem for locally flat submanifolds of TOP four-manifolds;”).

**Claim:** The phrase “this section's the normal-bundle theorem” is ungrammatical; the sentence means the normal-bundle theorem for locally flat submanifolds of TOP four-manifolds that this section (§3.4) constructs earlier in the same block. It is not introduced by the diff (the line is unchanged since `37548f6`) but lies four lines below the changed sentence, in the paragraph the diff touches.

**Witness:** `grep -n "this section's the normal-bundle" README.md` returns line 1530 only; the surrounding text at 1496–1530 refers to “the preceding ordinary normal-microbundle theorem”.

**Repair:** Write “using this section's normal-bundle theorem for locally flat submanifolds of TOP four-manifolds;” at line 1530.

## Previous findings

- R01 — repaired: line 1525–1526 reads “that case requires no adaptation of Freedman–Quinn's argument”; `grep -n '\bFQ\b' README.md` now returns nothing, so no undefined abbreviation survives.

## Verified sound

:robot: Independent AI review, incremental: I read the diff (`changes.md`), the whole paragraph it sits in (lines 1496–1545, the map-transversality block of §3.4), the gap contract the changed sentence consumes (`gap:marin-stable-transversality`, lines 269–276), the Freedman–Quinn 8.19 locator the next sentence cites, and the previous report; I re-ran the gate, the dependency check and the elaboration. I changed nothing in the pull-request worktree (`git status` clean before and after). The diff outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FourManifolds'`) is empty; the folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.

**Gate and build.** My run of the gate on this head ends `OK` with every scanner at 0 (set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material); the worker's run adds `build=0`. `lake env lean` on `TauCetiRoadmap/FourManifolds/Suggested.lean` succeeds in three seconds with exactly the six `declaration uses sorry` warnings at lines 68, 77, 96, 120, 134 and 143 and no other output. `Suggested.lean` has the same MD5 (`4b1217f1…`) at this head and at `37548f6`, so the thirteen elaborated signatures in the worker's `signatures.md` are those checked in the previous rounds; the one “elaboration error” that file reports (line 159, unexpected backtick) is in the worker's `#check` scaffold, where a docstring mention of `` `TauCeti.FreedmanSliceTheorem` `` was turned into a `#check` line, not in `Suggested.lean` (157 lines). The dependency command returned exactly:

```text
depcheck: 204 roadmaps, 1418 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line (same counts as the previous two rounds: the diff adds no `*Needs:*` edge).

**The changed passage, step by step.** (1) Principles: the diff replaces one abbreviation by its expansion; no supplier citation, no re-planning, no copied passage, no algorithm, no sorry'd data, no `set_option`. (2) Sources: the only locator in the sentence pair is “Freedman–Quinn 8.19”, which resolves in the `freedmanquinn` cache at line 4652 (Theorem 8.19, Submanifold smoothing), unchanged from the previous round. (3) The adversarial row below. (4) Duplication: nothing changed; the sentence states no new object. (5) Suppliers: the sentence consumes `gap:marin-stable-transversality`, declared at line 269 under “What GeometricTopology must provide” with its excluded cases (ambient dimension four; a four-dimensional submanifold meeting codimension one or two; expected intersection of dimension four); the sentence's hypotheses (codimension ≥ 3, expected preimage ≠ 4, the range scoped at line 1490 to the gap's non-excluded dimensions) stay inside that contract. (6) Shape: the block's `*Needs:*` line (1573) names the gap; no API bullet or Check is touched. (7) Headlines: unchanged; nothing was added to or removed from `Suggested.lean`.

**Adversarial table.** The row marked (new) was computed this round; rows marked (r9), (r8) and (r7) are carried unchanged from the previous report (which itself carried the r8 and r7 rows), on text this head does not touch.

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| §3.4 map transversality, domain 4 with codimension ≥ 3 consumed from the Marin gap (new) | domain dimension 4, codimension q = 3, 4, 5; ambient ≠ 4 | expected preimage 4 − q = 1, 0, −1 (empty), never 4, so the gap's “expected intersection four” exclusion is avoided; q ≥ 3 avoids the “submanifold of dimension four meets codimension one or two” exclusion; line 1490 restricts to ambient ≠ 4, avoiding the third; the Freedman–Quinn 8.19 adaptation is reserved for expected preimage 4, which with domain 4 forces q = 0, outside “codimension ≥ 3” | pass; the sentence's two branches are disjoint and together cover domain 4 |
| §3.4 Check 1, linear control (r9) | a=0, b=t/2, c=2t, d=s | step/r_n = 1/64 at every step; identity 1.5t vs t fails; 3/64 = 0.046875 < (63/64)²/20 = 0.048450; worst constructed ratio 0.0284 | pass |
| §3.4 Check 2, trivial control (r9) | a=0, b=c=id, d≡1, R=1, r_0=1/2 | r_1..r_3 = 7/16, 3/8, 5/16 exact; r_59 = 3.4·10⁻⁸; lhs 0 < 1 for every h | pass |
| §3.4 Check 3, fibrewise infimum (r9) | tube W, g=1+x−y | m(1/2)=0.5, m(1/2±10⁻⁴)=1.5∓10⁻⁴; lsc, not continuous | pass |
| §3.4 `*Needs:*` names (r9) | pin 6b7abb3c | `StrictMono.orderIsoOfSurjective` at `Mathlib/Order/Hom/Set.lean:151`; `IsCompact.exists_isMinOn` at `Mathlib/Topology/Order/Compact.lean:228` | pass |
| §3.4 locator pp. 147–149 (r9) | `freedmanquinn` | Theorem 9.7 line 4989 (p. 144); p. 147 marker 5069, p. 148 marker 5111, p. 149 marker 5147; h defined 5145–5146, estimates 5152–5160 | pass |
| Expanded Freedman–Quinn locators (r9) | `freedmanquinn` | 7.7.1 line 3995, 7.7.2 line 4008, §8.5 line 4194, 8.15 line 4495, 8.17 line 4640, 8.19 line 4652, 8.19.2 line 4727, 9.6 line 4983, 9.8 line 5391, 9.12.3 line 5869 | pass; 8.19 at 4652 re-opened this round |
| References added (r9) | lines 3227–3231 vs 387–396 | Moise GTM 47 (1977); Munkres Ann. of Math. 72 (1960) 521–554; Whitehead Ann. of Math. 73 (1961) 154–212 | pass |
| §3.5 consumption sentence (r9) | line 1830 | cites §3.4 (earlier in Layer 3), plain text; ε(r)<r/10 unchanged at 1834 | pass |
| §3.4 radial lemma, trivial control (r8) | a=0, b=c=id, d≡1, R=1 | r_0..r_3 = 0.5, 0.4375, 0.375, 0.3125; η=0.225; lhs 0 < 1 | pass |
| §3.4 radial lemma, linear control (r8) | a=0, b=t/2, c=2t, d=s | identity 1.5t vs t fails; constructed worst ratio 0.0285 | pass |
| §3.4 radial lemma, quadratic control (r8) | a=√t, b=t/2, c=2t, d=s² | identity 4.19·10⁻² vs 3.09·10⁻⁶ fails; constructed η=3.5·10⁻³, worst 0.238 | pass |
| §3.4 radial lemma, flat control (r8) | d=e^{−1/s} | identity fails; constructed η=1.76·10⁻³, worst 0.310 | pass |
| §3.4 radial lemma, non-monotone d (r8) | d=s(2+sin(1/s)) | η=0.075, worst 0.053 | pass |
| §3.4 three-step bound (r8) | n ≥ 1 | r_{n+1} ≥ 3r_n/4; sum ≤ 3d/16 = 0.1875·d < d | pass |
| §3.4 cofinality (r8) | r_n ↓ r_∞ > 0 | step ≥ min(r_∞/4, min d/16) > 0, contradiction; r_59 = 3.4·10⁻⁸ (d≡1), 0.197 (d=s) | pass |
| §3.4 fibrewise infimum (r8) | W, g=1+x−y | 0.5 vs 1.5 | pass |
| §3.5 extension over the zero section (r8) | ε(r)=r/10 | inverse moves s within [s/1.1, s/0.9] | pass |
| §3.5 point case (r8) | N = point | a ≡ 0 allowed; strictness from d > 0 | pass |
| Conventions: signed signature (r7) | S²×S²; −CP² | 0; −1 | pass |
| Conventions: torsion quotient (r7) | S⁴; Enriques | determinant 1; 2t=0 pairs to 0 | pass |
| §1.1 CP² ring, product (r7) | line; S²×S² | h²[CP²]=1; det −1 | pass |
| §1.2 twisted bundle (r7) | H=S+F, E=S | S²=−1, F²=0, S·F=1; diag(1,−1) | pass |
| §1.3 sums (r7) | CP²#−CP²; CP²#CP²; M#S⁴ | σ=0, χ=4; σ=2; Δχ=0 | pass |
| §1.4 matrices (r7) | 0-, +1-unknot; Hopf | [0], [1]; det −1 | pass |
| §1.4 slide (r7) | diag(0,1), two P | PᵀQP det 0 | pass |
| §1.4 blow-up (r7) | empty link + +1-unknot | H₂: 0 → ℤ with [1] | pass |
| §1.4 Arf definition (r7) | Hopf annulus; T(2,4) | radical dim 1; q=0 on ⟨e₁+e₃⟩ | pass |
| §1.4 Levine congruence (r7) | six knots; 588 matrices | Δ(−1) ≡ 1,5,5,1,5,1 mod 8; 0 failures | pass |
| §1.4 pinned normalization (r7) | `alexander` | T^(−g)·det(T·V−Vᵀ); Δ(1)=1 | pass |
| §1.4 T(2,4) (r7) | V 3×3 | det(V+Vᵀ)=−4; Arf 1; Jones at e^{iπ/4}: √2 | pass |
| §1.4 reversal (r7) | one component reversed | annulus [±2], Arf 0 | pass |
| §1.4 smooth slice-disc proof (r7) | genus g; trefoil | kernel dim g; trefoil Arf 1 | pass |
| §1.4 Spin comparison (r7) | unknot core | q=0=V(x,x) mod 2 | pass |
| gap:finite-quadratic-arf (r7) | hyperbolic; anisotropic; m=0 | Gauss sums 2, −2, 1 | pass |
| gap:three-manifold-smoothing (r7) | S³; D³; C=∂ | relative form agrees near C | pass |
| gap:alexander-module-presentation vs MorseNovikov N6 (r7) | zero surgery vs exterior | H₁ of covers agree | pass |
| §1.5 boundary (r7) | [0]; [2]; [1] | ker, coker: ℤ,ℤ; 0,ℤ/2; 0,0 | pass |
| §1.6 E₈ (r7) | Cartan matrix | minors 2,3,4,5,6,7,8,1 | pass |
| §2.1–2.2 (r7) | r=0,1,2; Q | π₃ ranks 0,1,3; QC=I | pass |
| §2.4 isotropic splitting (r7) | H; diag(1,−1); diag(1,−2) | x²=2y² has no nonzero solution | pass |
| §3.1 order (r7) | §1.4 → §3.6 | no Layer 3 item in §1.4's Needs | pass |
| §3.2 λ(f,f) (r7) | one ± double point | µ=±1, λ=±2 | pass |
| §3.2 FQ 2.9.1; KQ (r7) | locators | `freedmanquinn` 1496; `krushkalquinn` 60–61 | pass |
| §3.3 controls (r7) | 1/4 vs 1/2, 1/8, 1/4 | pass, fail, fail | pass |
| §3.4 Theorems 7.5–7.6 (r7) | locators | `freedmanquinn` 3854, 3906 | pass |
| §3.4 coefficients (r7) | 1, ℤ | Wh 0; K̃₀ 0; L₅(ℤ)=0, L₅(ℤ[ℤ])=ℤ | pass |
| §3.5 8.2, 9.6, §9.12, §7.8 (r7) | locators | `freedmanquinn` 4064, 4983, 5879–5887, 4041–4043 | pass |
| §3.6 surgery sequence, 11.11, Crowell (r7) | locators | `freedmanquinn` 7469; 7884–7887; 7925–7930 | pass |
| §3.6 Ω₃^Spin(S¹) (r7) | suspension | ℤ/2 | pass |
| §3.6 topologically slice Arf (r7) | F̂ locally flat | kernel dim g | pass |
| §3.7 realization (r7) | 0, H, E₈, 2E₈, [1] | KS 0,0,1,0 | pass |
| §4.2 formula (r7) | CP²; E₈; 2E₈ | 0; 1; 0 | pass |
| §4.2 even implies Spin (r7) | H₁ without 2-torsion; Enriques | Ext=0; w₂≠0 | pass |
| §4.3 Pontryagin square (r7) | CP²; S²×S² | 1; 2 with j(1)=2 | pass |
| §5 energy, scaling (r7) | S⁴; λ²g | 8π²k+2‖F⁺‖²; λ^{n−4} | pass |
| §5.1 index (r7) | S⁴; S²×S²; Q₈ | −3; −6; −6 | pass |
| §5.1 Kuranishi (r7) | FL §3.1 | `feehanleness` 666–668 | pass |
| §5.2 budget and names (r7) | N=5, s=3 | q=6, ℓ≥10 | pass |
| §5.3 gluing, Donaldson (r7) | Q=−I_r | σ+r=0 | pass |
| §6.1 blowup (r7) | CP²; nine times | (4,0); (12,−8) | pass |
| §6.3 SL₂ (r7) | A,B,S | (AB)³=−I | pass |
| §7.1 indices (r7) | K3; reversed | 2, 1; −2, −1 | pass |
| §7.2 E(n) (r7) | n=1,2,3 | (12,−8,10), (24,−16,22), (36,−24,34) | pass |
| §7.3 Enriques Check (r7) | v=(i,√3,i√3,1,0,0) | quadrics 0; minor −48 | pass |
| §8.1 nonrecognition (r7) | Tancer; GS 1.2.33 | `tancer` 73–76; `gompfstipsicz` 838 | pass |
| §8.2 bound, KS (r7) | [1]; ±1 unknot | v²≤1; KS=0 | pass |
| §8.3 headline (r7) | standard ℝ⁴ | `Diffeomorph.refl` refutes the wrong instance | pass |
| gap:top-manifold-cw-type (r7) | Milnor 1959 | `milnor1959` 20, 37 | pass |
| gap:brown-schoenflies (r7) | Brown 1960 | `brown1960` 84, 101–103 | pass |

One new row, eight carried from the previous report, eleven from the report before it and fifty-two from the full review. No instance refuted a stated theorem or Check; the changed line introduces no mathematical content.

**Pinned declarations.** None newly needed: the diff names no library declaration. The declarations opened in the previous rounds (`StrictMono.orderIsoOfSurjective`, `IsCompact.exists_isMinOn`, `TauCeti.AnnulusConjecture`, `TauCeti.FreedmanSliceTheorem`, `Diffeomorph`, `Projectivization`) are unchanged at the pin, and `Suggested.lean` is unchanged.

**Cross-roadmap citations.** The diff adds none and removes none; the worker's `citations.md` reports nothing unresolved against main (`fa41b37`) and the 434 open heads. The gap the changed sentence consumes is declared in this README at line 269 with its supplier (GeometricTopology) and its exclusions.

**Ownership against open work.** The diff states no object, so the previous round's search (`roadmaps grep` over main and the open heads for the radial-control and point-flattening passages, with only this README matching) stands; the board's packages index lists no competing package.

**Declared gaps.** Unchanged (the fifteen `gap:` slugs under “What GeometricTopology must provide”); the diff touches none. No `design/plan.json` is readable for this pull request.

**Source issues from the previous report.** The two entries recorded there (the fibrewise-infimum gap and the 1/0 misprint in the proof of Freedman–Quinn 9.7, printed p. 148) concern text this diff does not touch and stand as recorded; I found no new issue in the one locator I re-opened this round.

## Not verifiable

- No `design/plan.json` is readable, so the gap slugs could not be cross-checked against a plan.
- The items of the previous reports' lists (Gompf JDG 18 Theorem 1.2; Quinn, *Ends of maps I*; Moise, Munkres, Whitehead; Lickorish, Rolfsen, Robertello, Freedman–Kirby, Kirby LNM 1374; Gompf–Stipsicz beyond p. 36; the image-only scans and landing pages) concern text this head does not change and stand as recorded there. Marin, *La transversalité topologique* (Ann. of Math. 106, 1977), named in the gap contract the changed sentence consumes, is JSTOR only and was cited by locator in the previous full reviews.

## Source issues

- none

# Review of FourManifolds (pull request #936 at 37548f6)
**Verdict:** accepted

Incremental re-review of the 134 lines changed since `311b51c` (the radial-control block of §3.4 reformatted with its new Checks and `*Needs:*` item, the §3.5 consumption sentence made plain text, the companion file `RadialControlTargets.lean` deleted, eleven `FQ n.m` abbreviations expanded, three reference entries added, the Gompf locator spaced). Every finding of the previous report is repaired, none of the repairs introduces a new problem, the gate passes on my own run, and the adversarial rows for the changed statements all compute correctly. One P3 remains, a leftover undefined abbreviation.

## R01 (P3) — One undefined abbreviation `FQ` survives the expansion

**Location:** `TauCetiRoadmap/FourManifolds/README.md:1525` (“including domain dimension 4; that case requires no FQ adaptation”).

**Claim:** This head expands every other `FQ n.m` citation to “Freedman–Quinn n.m” (lines 1240–1241, 1283, 1354, 1365, 1374, 1388, 1392, 1410, 1507–1508, 1526, 1820), so `FQ` is no longer introduced anywhere, and a bare `FQ` is neither the literature's name nor defined in the README.

**Witness:** `grep -n '\bFQ\b' README.md` returns line 1525 only; the Conventions section (lines 1–120) defines no abbreviation `FQ`; the only other occurrences of the letters are the backticked source id `freedmanquinn`.

**Repair:** Write “that case requires no adaptation of Freedman–Quinn's argument” at line 1525.

## Previous findings

- R01 — repaired: line 1098 is now the bold heading “**Radial control and extension across an end.**” with no `<a id=` tag, and line 1830 reads “Apply §3.4's radial-control estimates to both end deformations on a proper tube”; gate `residue=0`.
- R02 — repaired: lines 1112–1114 keep each code span on one line (“subtracting `min(r_n/4, m_n/16)` at each step, where `m_n` is the minimum of d over `[r_n/4, 2r_n]`”); gate `tex=0`.
- R03 — repaired: `RadialControlTargets.lean` is deleted (the folder holds `README.md`, `Suggested.lean`, `metadata.toml`), and the “prototypes” sentence is gone; `grep -n RadialControl README.md` returns nothing.
- R04 — repaired: line 1144 now reads “The application is the point-flattening step of §3.5's contractible cap construction”; no Teichner date remains.
- R05 — repaired: line 1146 reads “Theorem 9.7, printed pp. 147–149”; every joined token listed is spaced (“tending to 0 at 0”, “0 < t < η”, “near 0”, “including at 0”, “times [0,∞)”, “Theorem 1.2” at 3137, “Freedman–Quinn 9.7” at 1820); a grep for a letter followed directly by a digit finds only arXiv identifiers.
- R06 — repaired: lines 1150–1167 carry three Checks (identity fails for b=t/2, c=2t, d=s; d≡1 with b=c=id passes for every coordinate; the fibrewise infimum of 1+x−y over the tube is not continuous), and the `*Needs:*` line at 1209–1212 names `StrictMono.orderIsoOfSurjective` and `IsCompact.exists_isMinOn` for the block. Each Check recomputed below.
- R07 — repaired: Moise (GTM 47, 1977), Munkres (Ann. of Math. 72, 1960) and Whitehead (Ann. of Math. 73, 1961) are listed at lines 3227–3231 with the same bibliographic data as the inline citations at 387–396.

## Verified sound

:robot: Independent AI review, incremental: I read the diff (`changes.md`), the whole radial-control block as it now stands (lines 1098–1167), the `*Needs:*` line that serves it (1206–1212), the §3.5 sentence that consumes it (1830), every line the `FQ` expansion touched, the three reference entries and the Gompf line, and the previous report; I re-ran the gate, the dependency check and the elaboration. I changed nothing in the pull-request worktree (`git status` clean before and after). The diff outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FourManifolds'`) is empty.

**Gate and build.** My run of the gate on this head ends `OK` with every scanner at 0 (set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material); the worker's run adds `build=0`. `lake env lean` on `TauCetiRoadmap/FourManifolds/Suggested.lean` succeeds in four seconds with exactly the six `declaration uses sorry` warnings at lines 68, 77, 96, 120, 134 and 143 and no other output. `Suggested.lean` is byte-identical to the head the previous review read (same MD5 at `311b51c` and at this head), so the thirteen elaborated signatures in the worker's `signatures.md` are those checked in the previous rounds; the one “elaboration error” that file reports (line 159, unexpected backtick) is in the worker's `#check` scaffold, where a docstring mention of `` `TauCeti.FreedmanSliceTheorem` `` was turned into a `#check` line, not in `Suggested.lean` (157 lines). The dependency command returned exactly:

```text
depcheck: 204 roadmaps, 1418 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line (same counts as the previous round: the `*Needs:*` edges are unchanged, the added `*Needs:*` item names Mathlib declarations only).

**The changed passages, step by step.** (1) Principles: the diff adds no supplier citation, no roadmap re-planning, no copied passage (the Checks are the reviewer-suggested instances, written as computations), no algorithm, no sorry'd data, no `set_option`; the only Lean change is the deletion of the companion file. (2) Sources: the locator “Theorem 9.7, printed pp. 147–149” is checked below; the ten expanded Freedman–Quinn locators each resolve in the `freedmanquinn` cache; the three new reference entries match the inline citations. (3) The adversarial rows below. (4) Duplication: Mathlib at the pin (`6b7abb3c`) has the two declarations the `*Needs:*` line now names and no statement of the radial lemma; nothing at the pins or on main states the Checks' objects. (5) Suppliers: no `*Needs:*` edge to a roadmap changed; §3.5 → §3.4 is internal and downward (§3.4 precedes §3.5 in Layer 3). (6) Shape: the block now has its three Checks and its `*Needs:*` item; the §3.4 `*Needs:*` line attributes each input to its block (“§3.3's control estimates …; for the radial-control block, …”), so the one-line-for-several-theorems class does not apply. (7) Headlines: unchanged; nothing was added to or removed from `Suggested.lean`.

**The three new Checks, recomputed** (script `r9/checks.py` in my scratch directory; exact rationals where stated, otherwise floating point with a 4000-point grid for the minima and a 200-point grid per annulus).

- Check 1 (a=0, b=t/2, c=2t, d(s)=s). m_n = min of d on [r_n/4, 2r_n] = r_n/4, so the step is min(r_n/4, r_n/64) = r_n/64 (measured 0.015625 at every step), hence r_{n+1} = (63/64)²·r_{n−1} exactly. For t ∈ [γ_{n+1}, γ_n], c(t) ≤ 2γ_n < γ_{n−1} and b(t) ≥ γ_{n+1}/2 > γ_{n+2}, so h(c(t)) − h(b(t)) ≤ r_{n−1} − r_{n+2} = (r_{n−1}+r_n+r_{n+1})/64 ≤ 3r_{n−1}/64, and d(h(t)) = h(t) ≥ r_{n+1}: 3/64 = 0.046875 < (63/64)²/20 = 0.048450, so the displayed “< d(h(t))/20” holds (and only just: the Check's constant 20 is the right order). The identity coordinate gives 1.5t against t at every t > 0. The constructed coordinate's worst ratio over n = 1..24 is 0.0284. Both assertions (the 3r_{n−1}/64 bound and the /20 bound) held at every grid point.
- Check 2 (a=0, b=c=id, d≡1, R=1, r_0=1/2). Steps min(r_n/4, 1/16): r_1 = 7/16, r_2 = 3/8, r_3 = 5/16 (exact fractions), as stated; r_59 = 3.4·10⁻⁸, cofinal; the left side is max(0, h(t)−h(t)) = 0 < 1 for every coordinate.
- Check 3 (W = ([0,1]×{0}) ∪ ({1/2}×[0,1]), p₂ = x, g = 1+x−y). The fibre over t ≠ 1/2 is the single point (t,0) with g = 1+t; over 1/2 it is the segment with g ranging over [1/2, 3/2], infimum 1/2. Values m(0.4999) = 1.4999, m(1/2) = 0.5, m(0.5001) = 1.5001: liminf 3/2 ≥ m(1/2), so lower semicontinuous and not continuous, as stated.

**Adversarial table.** Rows marked (r8) and (r7) are carried unchanged from the previous report (which itself carried the r7 rows), on text this head does not touch; rows marked (new) were computed this round.

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| §3.4 Check 1, linear control (new) | a=0, b=t/2, c=2t, d=s | step/r_n = 1/64 at every step; identity 1.5t vs t fails; 3/64 = 0.046875 < (63/64)²/20 = 0.048450; worst constructed ratio 0.0284 | pass |
| §3.4 Check 2, trivial control (new) | a=0, b=c=id, d≡1, R=1, r_0=1/2 | r_1..r_3 = 7/16, 3/8, 5/16 exact; r_59 = 3.4·10⁻⁸; lhs 0 < 1 for every h | pass |
| §3.4 Check 3, fibrewise infimum (new) | tube W, g=1+x−y | m(1/2)=0.5, m(1/2±10⁻⁴)=1.5∓10⁻⁴; lsc, not continuous | pass |
| §3.4 `*Needs:*` names (new) | pin 6b7abb3c | `StrictMono.orderIsoOfSurjective` at `Mathlib/Order/Hom/Set.lean:151` (strictly monotone surjective from a linear order gives `α ≃o β`); `IsCompact.exists_isMinOn` at `Mathlib/Topology/Order/Compact.lean:228` (needs `[ClosedIicTopology α]`, nonempty compact set, `ContinuousOn`) | pass; both hypotheses available for d continuous on [r_n/4, 2r_n] ⊂ (0,∞) |
| §3.4 locator pp. 147–149 (new) | `freedmanquinn` | Theorem 9.7 line 4989 (p. 144); p. 147 marker 5069, p. 148 marker 5111, p. 149 marker 5147; h defined 5145–5146, estimates verified 5152–5160 | pass |
| Expanded Freedman–Quinn locators (new) | `freedmanquinn` | 7.7.1 line 3995, 7.7.2 line 4008, §8.5 line 4194, 8.15 line 4495, 8.17 line 4640, 8.19 line 4652, 8.19.2 line 4727, 9.6 line 4983, 9.8 line 5391, 9.12.3 line 5869 | pass; the only text change is the abbreviation |
| References added (new) | lines 3227–3231 vs 387–396 | Moise GTM 47 (1977); Munkres Ann. of Math. 72 (1960) 521–554; Whitehead Ann. of Math. 73 (1961) 154–212: same data both places | pass |
| §3.5 consumption sentence (new) | line 1830 | cites §3.4 (earlier in Layer 3), plain text, no anchor; ε(r)<r/10 unchanged at 1834 | pass |
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

Eight new rows, eleven carried from the previous report and fifty-two carried from the report before it. No instance refuted a stated theorem or Check; the changed passages introduce no mathematical defect.

**Pinned declarations opened this round** (Mathlib `6b7abb3c`): `StrictMono.orderIsoOfSurjective` (`Mathlib/Order/Hom/Set.lean:151`, with `StrictMono.orderIso` at 145 and `coe_orderIsoOfSurjective` at 156) and `IsCompact.exists_isMinOn` (`Mathlib/Topology/Order/Compact.lean:228`, the extreme-value theorem under `[ClosedIicTopology α]` for a nonempty compact set and a `ContinuousOn` function). Nothing in Mathlib or Tau Ceti at the pins states the radial lemma or the Checks.

**Cross-roadmap citations.** The diff adds none and removes none; the worker's `citations.md` and my own `roadmaps resolve` run on this README report nothing unresolved. The internal citation §3.5 → §3.4 is downward.

**Ownership against open work.** `roadmaps grep` over main and the 433 open heads (index of 2026-10-31) for `radial.{0,40}(control|reparametri)` and `point-flattening` returns only this README, plus one unrelated hit in RelativisticQuantumFieldTheory (a translation-invariance passage). No companion file or second `Suggested.lean` declares a radial-control name now that `RadialControlTargets.lean` is deleted. The board's packages index lists no competing package.

**Declared gaps.** Unchanged (the fifteen `gap:` slugs under “What GeometricTopology must provide”); the diff touches none. No `design/plan.json` is readable for this pull request.

## Not verifiable

- **Gompf, *Three exotic ℝ⁴'s and other anomalies*, J. Differential Geom. 18 (1983), Theorem 1.2** (`README.md:3137`, where only the spacing changed): no text of it is in the sources cache; cited by locator, as in the previous reviews.
- **Quinn, *Ends of maps I*, §3.4** (`README.md:1826`, unchanged text beside the changed sentence): Ann. of Math. 110 (1979), JSTOR only; cited by locator, as before.
- **Moise, Munkres, Whitehead** (the new reference entries): the bibliographic data was checked against the inline citations and the journals' volume and year, not against the texts (GTM 47 and the two Annals papers are not in the cache); the previous full reviews recorded the same.
- The remaining items of the previous reports' lists (Lickorish, Rolfsen, Robertello, Freedman–Kirby, Kirby LNM 1374; Gompf–Stipsicz beyond p. 36; the image-only scans and landing pages) concern text this head does not change and stand as recorded there.
- No `design/plan.json` is readable, so the gap slugs could not be cross-checked against a plan.

## Source issues

- **Gap** in freedmanquinn at proof of Theorem 9.7, printed p. 148 (`freedmanquinn` lines 5128–5129): the source says the infimum of the radial coordinate of the deformation over the exact fibre over t is continuous in t because the base set is compact; it should bound the infimum below by a monotone continuous minorant from minima over compact annuli, since a fibrewise infimum along a proper map is only lower semicontinuous (the README's third Check is the witness); affects the proof.
- **Misprint** in freedmanquinn at proof of Theorem 9.7, printed p. 148 (`freedmanquinn` lines 5145–5146): the source defines h(γ_{n+1}) through d⁻¹(1/n) for all n ≥ 0, which at n = 0 reads 1/0, and d⁻¹(1/n) is undefined when 1/n exceeds the range of d; it should start the recursion at an n with 1/n in the range of d; affects nothing.

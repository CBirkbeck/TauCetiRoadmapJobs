# Review of TangentialBordism (pull request #942 at ef08ea4)

**Verdict:** needs changes

This is an incremental re-review of the 60 lines changed since be5e94d (the head that ~17 read); the only file changed is `TauCetiRoadmap/TangentialBordism/README.md`, and nothing outside the folder changed. Of ~17's five findings, three are repaired (R01, R02, R03) and two are not (R04, R05); the two unrepaired ones are carried below. Both concern the pull-request description only: the README and `Suggested.lean` need no edit.

## R01 (P3) — AlgebraicTopology 8.13 exists only at #1663, which the description does not name

Not repaired: ~17 R04 (~16 R08, ~15 R01).

**Location.** `TauCetiRoadmap/TangentialBordism/README.md:568`: "AlgebraicTopology 8.13 for boundaryless sources"; also cited at `:79`, `:306`, `:3044–3046`. The description's revision paragraph: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652".

**Claim.** Every open revision whose numbering this roadmap cites is named in the description.

**Witness.** AlgebraicTopology on main: 0 hits for "8.13". At #1652 (1f5b3f6): 0 hits; its Layer 8 (`README.md:2598`) has no smoothing or transversality item. At #1663 (a67088d): `README.md:68–74` ("Stage 8.13 consumes geometric topology's Layer 1 tubular neighbourhood theorem and owns … the smoothing of continuous maps relative to a closed set, the parametric transversality theorem and relative transversality. TangentialBordism B1.6 consumes these three") and `:2919`. The two revisions number AlgebraicTopology differently (#1663 keeps "Stage", #1652 renames to "Layer").

**Repair.** No README change. In the description's revision paragraph write: "#886 (DifferentialGeometry 5.5b), #903 (GeometricTopology 1.1, 4.3.1, 11.3), #1652 (AlgebraicTopology Layers 2, 4, 6, 8), then #1663 rebased on #1652 (AlgebraicTopology 8.13 under Layer 8)".

## R02 (P3) — DifferentialGeometry 5.5b exists only at #886, which the description does not name

Not repaired: ~17 R05 (~16 R09, ~15 R02).

**Location.** `README.md:307`: "5.5b's smooth face structure and face-indexed abstract boundary"; also `:568`, `:695`, `:794` and seven more lines. The description paragraph is the one quoted in R01.

**Witness.** DifferentialGeometry on main: 0 hits for "5.5b". At #886 (4d6e96e): 25 hits, defined at `README.md:38` ("refer to 5.5a (densities) and 5.5b") and `:83`. `roadmaps overlaps` lists the same lead (lines 568, 794) under "only an open revision defines".

**Repair.** The paragraph given in R01 names #886; one edit of the description repairs both findings.

## Previous findings

- R01 — repaired: `README.md:62–66` "B3.3 owns the stable-stem relations η≠0 in π₁S and η³=12ν≠0 in π₃S≅ℤ/24 … no earlier roadmap states them, and later roadmaps that use the relation, K3BlochGroups (its §4.9) and FourManifolds among them, cite B3.3"; Downstream `:3038–3040` names both consumers. `roadmaps grep '12ν'` finds the relation only here, in K3BlochGroups #1430 and in FourManifolds #936 (lines 132 and 136 of the merge order; this roadmap is line 14), so no earlier owner exists.
- R02 — repaired: 7.2 `:2098–2105` cites Beaudry–Campbell Theorem 5.1.1 and Corollary 5.1.2, p.42, Remark 3.2.2, p.18, and Figure 31, p.41; 8.3 `:2239–2241` and 8.4 `:2295–2296` cite the Figure 31 MSpin row for π₃MSpin=0 and the Spin column; References `:3081–3096`. All four locators verified at the text (table below); `beaudryCampbell` is recorded in the package manifest as certified, arXiv v2, the version the README names.
- R03 — repaired: `:36–39` and `:3053–3055` both read "B4.1–B4.2, B4.4–B4.8 and B5.4", and the strengthened claim "nothing that they need uses these three items" holds (closure computed below).
- R04 — not repaired: the description still names #1652 only; R01 above.
- R05 — not repaired: R02 above.

## Verified sound

### Gate, dependency check, elaboration

- **Gate**, rerun at ef08ea4 with `--base origin/main`:

  ```text
  gate TangentialBordism: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  The worker's record at this head adds `build=0`.
- **Dependency check** (`--movable`):

  ```text
  depcheck: 238 roadmaps, 2352 edges, 0 problem(s)
  ```

  No UPWARD or CYCLE line. TangentialBordism is line 14 of the merge order, after IndexTheory (10) and StringOrientation (11); FourManifolds (132) and K3BlochGroups (136), the two consumers the new ownership sentence names, are later.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/TangentialBordism` is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- **Elaboration.** `Suggested.lean` is byte-identical to be5e94d (`git diff` empty). `lake env lean` exits 0 with exactly four `sorry` warnings (`:64`, `:84`, `:113`, `:131`), 10 s. The `#check @` probe, padding probe (`first | simp | infer_instance | rfl | trivial | aesop` fails on all four) and headline list of ~17 therefore stand unchanged; `signatures.md` shows no lost binder (its phantom "structure `,`" at line 111 is the docstring phrase "structure, which").

### The changed passages

- **7.2 (B3.4), `:2098–2105`.** Beaudry–Campbell (`beaudryCampbell`, arXiv 1801.07530v2, cache header line 2): Theorem 5.1.1 at line 1770 (page 42 marker at line 1766): H*(MSpin) ≅ A ⊗_{A(1)} (ℤ/2 ⊕ M) with M zero in degrees below 8, attributed to Anderson–Brown–Peterson; Corollary 5.1.2 at line 1774: Ext_A(H*(MSpin∧X(H))) ≅ Ext_{A(1)}(H*(X(H))) for t−s<8, and the MSpin row of Figure 31 (line 1741) has X(H)=MO₀≃S⁰, which is the MSpin case the README states; Remark 3.2.2 at lines 792–796 (page 18 marker at line 790): H*(ko) ≅ A//A(1). The README's own words restate these without copying.
- **Figure 31, p.41** (lines 1722, 1741, 1752): the MSpin row reads ℤ, ℤ/2, ℤ/2, 0, ℤ in π₀–π₄, as 7.2 `:2103–2105`, 8.3 `:2239–2240` and 8.4 `:2295–2296` state. Beaudry–Campbell say (line 1734) the tables are Freed–Hopkins'; the README cites the values to the text it read and names ABP as the primary for the comparison, which is the right division.
- **8.3 (B3.3).** "item4" → "B3.4" at `:2235` and `:2253`: B3.4 is 7.2 (`:2094`), which is the below-8 comparison, in an earlier layer. Hatcher §4.2 p.385 (`hatcherAT` lines 16749–16751): η³=4ν in the 2-component, the actual relation η³=12ν since 2η=0; Freed (5.57) p.45 (`freedBordism` line 1817): the torus chain representing the first stems. Both unchanged and re-read.
- **Layer 9 odd-prime sentence, `:2970`.** "B3.4's ΩSpin_(p)=ΩSO_(p) ring, which is B4.8's oriented ring transported by B3.4 along StringOrientation S5.3's equivalence" agrees with 7.2 `:2118–2123` (transport of B4.8's splitting and p-local ring along MSpin_(p)≃MSO_(p)).
- **Scope `:36–39` and Downstream `:3053–3058`.** BordismFormalGroups on main cites TangentialBordism at `:30` (geometric cycles and the PT comparison), `:188` (geometric MU comparison, B5.4c), `:208` (geometric coefficient rings), `:463` ("TangentialBordism's mod-p Adams tower"). B4.1 is B4.2's input (`:1128`), so listing B4.1 among the consumed items is correct in closure. Transitive closure of {B4.1, B4.2, B4.4–B4.8, B5.4} from the *Needs:* lines `:1072, 1128, 1156, 1247, 1757, 1786, 1823, 1877, 1313, 1400, 1427, 1605, 568, 695, 741, 772, 794, 816, 912, 948, 974, 1013` = {B4.1–B4.8, B5.1–B5.4, B1.1–B1.6, B2.1–B2.4}; B3.3, B3.4, B5.5 (and B1.7, B6.x) are not in it. StringOrientation S2.2 at #948 (07f0981, `:551`) has no BordismFormalGroups input (checked in ~17).
- **Ownership sentence, `:62–66`, and consumers.** FourManifolds #936 (46ee76a) `README.md:2878–2881` uses η³=12ν exactly for the Lie framing of the marked T³ boundary of the E(1) fibre complement, as Downstream `:3038–3040` says, and its table `:182` already consumes TB B3.3 for Ω₃^Spin=0; its line `:2881` still cites Kirby–Melvin for the relation. K3BlochGroups #1430 (d0c9190) `:1345–1367` (§4.9) still proves the relation itself. Both roadmaps are later in the merge order, so the direction stated here is the right one; replacing their own proofs or citations by a citation of B3.3 is for their reviews. Remark, no change requested here.
- **References `:3081–3096`.** The ABP entry's "for" clause now covers B3.4 and B3.3 with the located statements deferred to Beaudry–Campbell; the Beaudry–Campbell entry gives exactly the four locators used and says they are v2 locators. ABP 1967 itself is not in the package manifest, nor were Milnor–Stasheff, Miller, Wall and the other References works at ~17 (the manifest holds six ids: hatcherSS, thom1954, atiyahSpin1971, hatcherAT, freedBordism, beaudryCampbell); that state predates this change and was not raised by ~16 or ~17. Remark.
- **Seeded sample.** None of this round's fifteen sample targets (2.1, 2.3, 2.4, 2.7, 3.1, 4.1, 4.4, 5.3, 5.4, 6.2, 6.4, 7.1, 8.2, 8.5, 9.2) lies in the changed passages; per the incremental rule they are not redone. 2.1, 2.3, 2.7, 6.2, 8.5 and 9.2 are in ~17's table; the locators of 2.4 (Milnor–Stasheff 17.1/17.2 pp.206–207, Miller Ch.1 Defs 1.1–1.2, Ch.2 Defs 1.1, 1.3), 3.1 (MS Lemma 17.2), 4.4 (Guillou–Weibel Def 6.1, Thm 6.2 p.18, Thm 6.5 p.19), 5.3 (Thom IV.8 p.75), 6.4 (Milnor 1960 §4 Thms 4–5 p.519, paywalled), 8.2 (Atiyah Prop 4.1, Thm 3′ p.58) and 9.2 (Borel–Hirzebruch 19.4; Milnor eq. (13) p.519) were verified in ~8 and ~17 at the cache lines recorded there.

### Adversarial mathematics table

Rows for the untouched statements carry forward from ~17's table (the four Lean headlines, 2.1–2.7, 3.3, 4.2/4.4, 5.1/5.2, 6.2–6.6, 7.2's K3 Check, 8.1, 8.4 Checks, 8.5, 9.1, 9.2, 10.1, 10.3), whose values are unchanged since `Suggested.lean` and those sections are unchanged. New rows for the changed statements:

| Statement | Instances | Values computed (each side) | Result |
| --- | --- | --- | --- |
| 7.2: Adams E₂ of MSpin and ko agree in stems <8 | Ext_{A(1)}(F₂,F₂), stems 0–7 | stem 0: h₀-tower (ℤ); 1: h₁ (ℤ/2); 2: h₁² (ℤ/2); 3: 0; 4: tower from filtration 3 (ℤ); 5, 6, 7: 0. ko_*=KO_* in degrees 0–7: ℤ, ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0. MSpin by Cor. 5.1.2 with X(H)=S⁰: the same | Pass |
| 7.2/8.3/8.4: π₀–π₄MSpin = ℤ, ℤ/2, ℤ/2, 0, ℤ | differentials in stems ≤4 | d_r(h₁) lands in stem 0 at filtration 1+r on the h₀-tower, which survives (π₀MSpin=ℤ, the point); d_r(h₁²) lands in stem 1 at filtration ≥4, which is 0; stems 3 and 5 are 0, so stem 4's tower has no source or target. Figure 31 row: ℤ, ℤ/2, ℤ/2, 0, ℤ | Pass |
| 7.2: onto in degree 8 (locator changed, claim unchanged) | Â on ΩSpin_8≅ℤ² | Â(K3×K3)=4, Â(HP²)=0, Â(Bott manifold)=1, so the generator of ko₈=ℤ is hit; the Check "K3×K3 ↦ 4b, not a generator at 2" is consistent | Pass |
| 8.3: π₃ko=0 | KO_* period 8 | KO₃=0; τ_(≥0) does not change π₃ since 3≥0; Figure 31 stem-3 entry 0 | Pass |
| 8.3: η³=12ν≠0 of order two | ℤ/24; ℤ/8 | ord(12)=24/gcd(12,24)=2; elements of order ≤2 in ℤ/24: {0,12}; 2η=0 ⇒ 2η³=0; η³≠0 from h₁³=h₀²h₂≠0 at (3,6); 12 mod 8 = 4, four times the generator of ℤ/8, two h₀-steps above h₂ (Hatcher lines 16749–16751) | Pass |
| Scope `:36–39`: supply layering | Needs closure | closure of {B4.1, B4.2, B4.4–B4.8, B5.4} = {B4.1–B4.8, B5.1–B5.4, B1.1–B1.6, B2.1–B2.4}; B3.3, B3.4, B5.5 ∉ closure; S2.2 at #948 `:551` has no BordismFormalGroups input | Pass |
| Scope `:62–66`: no earlier owner of η³=12ν | `roadmaps grep '12ν'`, all open heads and main | hits only in TangentialBordism, FourManifolds #936 (`:2881`, Kirby–Melvin), K3BlochGroups #1430 (`:1345–1367`); merge-order lines 14, 132, 136 | Pass |
| Layer 9 `:2970`: odd-prime ring | p=3 | B4.8's ring at p: polynomial on generators in degrees 4k with k≠(3ʲ−1)/2 (6.4's Check); transported along MSpin_(3)≃MSO_(3) of 7.2 `:2118–2123`; π₁MSpin_(3)=0=π₁MSO_(3) (7.2's last Check) | Pass |

### Cross-roadmap citations resolved this round

- BordismFormalGroups on main (35884a8): `:30`, `:188`, `:208`, `:463`.
- FourManifolds #936 (46ee76a): `:182`, `:1704`, `:1776`, `:2053`, `:2093` (TB B3.3 for Ω₃^Spin=0), `:2878–2881` (η³=12ν, Kirby–Melvin).
- K3BlochGroups #1430 (d0c9190): `:11`, `:25`, `:1097`, `:1345–1367`, `:1608`.
- AlgebraicTopology on main, #1652 (1f5b3f6) and #1663 (a67088d): "8.13" hits 0, 0, 3 (`:68–74`, `:2919`).
- DifferentialGeometry on main and #886 (4d6e96e): "5.5b" hits 0 and 25 (`:38`, `:83`).
- Merge order: EllipticCohomology 6, IndexTheory 10, StringOrientation 11, TangentialBordism 14, FourManifolds 132, K3BlochGroups 136.
- Overlaps: no other open pull request changes this roadmap; none drops an id it cites; the "only an open revision defines" leads (DifferentialGeometry §5.5b at #886; AlgebraicTopology Layers 2, 4, 6, 8 at #1652) are R02 and the already-named #1652.

## Not verifiable

- **Anderson–Brown–Peterson 1967** (References `:3081–3085`): Annals, no legal open copy found by the sources service at ~17; the README now locates the statements it uses in Beaudry–Campbell instead and cites ABP without a theorem number, which needs no text.
- **Milnor 1960**, §4 Thms 4–5 (6.4, sample target, unchanged): JSTOR only, as in ~16 and ~17.
- **Ownership against GeneralizedCohomology #1187 and HomotopySpheres #284**: listed as close in vocabulary, no checkout given; GeneralizedCohomology checked on main at ~17.

## Source issues

- none

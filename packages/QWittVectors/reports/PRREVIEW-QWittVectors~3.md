# Review of QWittVectors (pull request #1351 at 65c0d99)

**Verdict:** needs changes

Incremental re-review of the 27 lines changed since 74b3029 (README: 25 lines in Scope, the supplier contracts, How to read the build, the Layer 1 title, §1.4a, the Layer 1 Dependencies line and Downstream consumers; `Suggested.lean`: the Layer 1 section comment only). The previous findings are accounted for under `## Previous findings`; the changed passages and everything that cites them were reviewed in full. The one blocking finding is the plan-side half of the previous review's R02, which this head does not address.

## R01 (P2) — `gap:framed-skew-product` is still declared in the README but not where the intake reads it

**Location:** `TauCetiRoadmap/QWittVectors/README.md:122` ("**`gap:framed-skew-product` — Arbitrary-base finite framed skew DGA.** Required extension of PrismaticCohomologyPartII §5.0 …"), consumed at lines 15, 1124, 1132, 1151, 1166, 1232 and 1242.

**Claim:** the arbitrary-base skew product on every finite `QFraming` is a declared supplier contract of PrismaticCohomologyPartII.

**Witness:** `packages/QWittVectors/design/plan.json`, top-level `gaps`, lists seven slugs (cyclotomic-contract, ordinary-derham, cohomology-completion, prismatic-frobenius, pd-presentation, dga-bockstein, dga-quotient); the brief's list of declared gaps for this job is the same seven. The README states eight `gap:` contracts. The repair commit at this head (its message names the KTheoryFiniteLocalFields import, the quotient deletion and the Layer 1 retitle) does not touch the plan, and no repair report marks the finding not actionable. Without the plan entry the intake never announces the contract on the supplier's job, and Layers 8–9 rest on a product with no obligated owner.

Re-raised: R02 of the previous review of this folder (at 74b3029); its reason for the plan-side repair stands unchanged.

**Repair:** add to the plan's `gaps` the entry `slug: framed-skew-product`, `supplier: PrismaticCohomologyPartII`, `section: "Part II extension: arbitrary-base finite framed skew DGA interface"`, `needs:` the requirement sentence of README line 122 (product `(a e_I)(b e_J)=aγ_I(b)e_I∧e_J`, unit, square-zero one-forms including characteristic two, signed DG Leibniz law, coordinate-injective naturality, under §5.0's scaling, regularity and divisibility hypotheses and no p-regularity, δ-structure or q-PD datum). The README text needs no change. Adding a gap to the top-level list is the one plan edit the package stage permits; if the worker's allowance excludes the file, a maintainer must add the entry before acceptance.

**Repair test:** the three Checks under the contract (README lines 126–128) were recomputed in the previous review and are carried forward below; registering the slug changes no mathematics.

## R02 (P3) — The KTheoryFiniteLocalFields contract imports a quotient nothing here consumes, from the section that duplicates §1.4a

**Location:** `TauCetiRoadmap/QWittVectors/README.md:88` ("and from §5.16a the quotient `𝕎_(mn)(R)/V_n𝕎_m(R)` with its truncated-polynomial calculation").

**Claim:** this roadmap consumes the series-group quotient and its calculation.

**Witness:** the string `𝕎_(mn)(R)/V_n𝕎_m(R)` occurs once in the README, at line 88; the quotient API bullet and its Check were deleted from §1.4a at this head, and no `*Needs:*` line, Dependencies line or target mentions the quotient. KTheoryFiniteLocalFields §5.16a (at its head, lines 1171–1187) is the section that itself constructs γ_N with the four compatibilities and the restriction limit, so the clause imports from the one section the previous review asked that roadmap to reduce.

**Repair:** delete the clause from "and from §5.16a" to "calculation", so the contract imports only the Conventions' groups `𝕎_N(R)`, `𝕎(R)`, their Verschiebung and the Teichmüller class, and the sentence "Only these series-side objects are imported" stays true. Nothing else changes; the Layer 1 Dependencies line already cites only "KTheoryFiniteLocalFields Conventions".

## Previous findings

- R01 — repaired (within this pull request): a `### From TauCetiRoadmap.KTheoryFiniteLocalFields` subsection imports the Conventions' groups `𝕎_N(R)`, `𝕎(R)`, `V_n` and the Teichmüller class; §1.4a identifies U_N(R) with the supplied group for N≥1 and keeps the coordinate carrier, γ_N, its four compatibilities and the restriction limit here; the quotient bullet and its Check are deleted; the KTheoryFiniteLocalFields consumer entry and the "same owner here" clause are gone; Scope line 9 names the supplied group. The other half, reducing KTheoryFiniteLocalFields §5.16a to its series model, lies in that pull request: at its head it still constructs γ_N and cites "QWittVectors §§1.1–1.5" (its line 1180). R02 above notes the residual import from that section.
- R02 — not repaired: README line 122 still declares `gap:framed-skew-product`; the plan's `gaps` still lists seven slugs without it. Re-raised as R01 above.
- R03 — repaired: the worker's gate at this head shows `build=0` and `OK`; my elaboration of a scratch copy of `Suggested.lean` ended with exit 0 and the two intended `sorry` warnings (lines 82 and 102), the shared packages directory being at the manifest pins (Mathlib 6b7abb3c, Tau Ceti a91d3aa) with `Mathlib/Tactic/Translate/GuessName.olean` present.
- R04 — repaired: README line 144 and `Suggested.lean` line 65 both read "Big Witt rings and arithmetic fracture".

## Verified sound

**Scope of this pass.** The 27-line diff was read line by line with every passage that cites or is cited by it: Scope (line 9), the new supplier subsection (lines 86–88), How to read the build (line 142), the Layer 1 title (144), §1.4a in full (237–262), Layer 1 Examples and Dependencies (319–323), Downstream consumers (1405–1413), the `Suggested.lean` module docstring's §1.4a entry and section comment (line 65). The outside-folder diff against `origin/main` is empty. `metadata.toml` is unchanged.

**Gate and mechanical checks.** The gate command on this head returned every scanner count 0 and `OK` (`set_option`, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material); the worker's gate adds `build=0`. The dependency command with `--movable` returned exactly:

```text
depcheck: 204 roadmaps, 1392 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve`: cross-roadmap citations found nowhere, none; the eleven Lean-name leads are this roadmap's own four declarations and supplier names (`Decalage.*`, `QFraming.*`, `QDeRham.skewDGA`, `FramedAlgebra.toQFraming`, `TauCeti.LambdaRing.PreLambda`) that the previous reviews resolved in AInfCohomology, PrismaticCohomologyPartII and SchemeKTheoryOperations; none is touched by the diff.

**Elaboration and signatures.** `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` for all four declarations appended: exit 0, two `sorry` warnings, no other output. The elaborated types of `BigWitt.TruncationSet`, `BigWitt.ghostPolynomial`, `BigWitt.ghost_image` (carries `CommRing R`, the truncation set, the prime lifts φ and the congruence hypothesis) and `QWitt.framedGamma_existsUnique` (carries the scalar tower and `Algebra.Etale (MvPolynomial (Fin r) A) R`) are identical to the worker's `signatures.md`; no section binder was lost and no change was needed. The file differs from 74b3029 by one comment line, so the previous reviews' one-tactic probes and padding audit apply unchanged.

**The new supplier against its source.** KTheoryFiniteLocalFields at its open head (pull request #1281; the roadmap is not on main), Conventions line 26: `𝕎_N(k)` for N≥1 as the constant-one units of k[t]/(t^(N+1)) on Mathlib's `Polynomial` and `PowerSeries` carriers, `𝕎(k)=1+t·k[[t]]`, `V_n : 𝕎_m(k) → 𝕎_(mn)(k)` induced by t↦tⁿ, Teichmüller class (1−at)⁻¹, the group written additively; line 28: the series model and its quotient calculation belong there; §5.16a lines 1171–1187. Every object the README imports at line 88 is stated there. Direction: KTheoryFiniteLocalFields is line 67 of the merge order, QWittVectors line 186, and the latest supplier HabiroCyclotomicCompletions line 68, so any movable placement keeps the supplier earlier. KTheoryFiniteLocalFields is in the brief's list of roadmaps this one may consume.

**Layer 1 Dependencies against its `*Needs:*` lines.** The union of the eight Needs lines of §§1.1–1.8 is twenty items (Layers 1.1–1.5; KTheoryFiniteLocalFields Conventions; Mathlib `Polynomial`, `PowerSeries`, `PowerSeries.isUnit_iff_constantCoeff`, `WittVector`, `TruncatedWittVector`, `WittVector.ghostComponent_apply`, `WittVector.frobenius`, `WittVector.verschiebung`, `WittVector.teichmuller`; SchemeAndStackFoundations §§0.23a, 0.29; EnhancedDerivedSheaves §0.3 and Layer E5:spectra-comparison; DerivedModuleAlgebra §1.3; BordismFormalGroups §F6.5); the Dependencies line at 323 lists exactly these twenty. The items dropped by the diff (DerivedModuleAlgebra §§0.K.1, 1.1, 1.5, 1.8; DGAInfinity Layers 0–1; AInfCohomology §§AI.1.4, AI.1.7) occur in no Layer 1 Needs line since §§1.9–1.11 were removed.

**Seeded sample.** The diff touches none of the fifteen seeded targets; §1.3 is cited by the changed §1.4a and is unchanged. The §1.4a locators were re-read at this head: hesselholt line 589 (Proposition 1.14: γ(a)=∏(1−a_n tⁿ)⁻¹ is a natural group isomorphism W(A)≅Λ(A), p. 14), lines 644–655 (Addendum 1.16 and Example 1.17: for S={1,…,n} the quotient is (1+tA[[t]])*/(1+t^(n+1)A[[t]])*, p. 15), lines 292–298 (coordinate V_n inserts a_e at m=ne and 0 otherwise, p. 7), lines 338–341 (Teichmüller representative: a in component 1, zero elsewhere, p. 8). Each supports the clause that cites it at the stated generality (arbitrary commutative ring A, no torsion-freeness). The other fourteen sampled targets' checks in the previous reports stand.

**Adversarial table.** Rows for statements the diff leaves untouched are the previous reports' rows (132 in the first full review plus the 18 computed in the review at 74b3029) and are carried forward by citation; the rows below are computed at this head for every changed statement.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| §1.4a: U_N(R)=supplied 𝕎_N(R) for N≥1, U_0(R) trivial | N=0; N=1 | N=0: R[t]/(t)=R, constant-coefficient-1 units ={1}, and W_∅(R)=0, so γ_0 is 0≅{1}; N=1: (1+at)(1+bt)=1+(a+b)t mod t², W_{S_1}(R)=(R,+), γ_1(a)=1+at additive | True; N=0 correctly kept here since the supplier starts at N=1 |
| §1.4a Verschiebung bullet against the supplied V_n (t↦tⁿ) | m=1,n=2; m=2,n=2 with x=(1,1) | Series side 1+at ↦ 1+at²; coordinate V_2(a)=(0,a), γ_2=(1−at²)⁻¹=1+at² mod t³. Series side γ_2(x)=1+t+2t² ↦ 1+t²+2t⁴; coordinate V_2(x)=(0,1,0,1), γ_4=(1−t²)⁻¹(1−t⁴)⁻¹=(1+t²+t⁴)(1+t⁴)=1+t²+2t⁴ mod t⁵ | Agree; the supplied V_n is the restriction of this roadmap's substitution to N=mn |
| §1.4a Teichmüller bullet against the supplied class (1−at)⁻¹ | a=2 over ℤ, N=2; a=1 over 𝔽₂, N=2 | γ_2(τ(2))=γ_2(2,0)=(1−2t)⁻¹=1+2t+4t²; supplied class (1−2t)⁻¹, same. Over 𝔽₂: γ_2(1,0)=(1−t)⁻¹=1+t+t²; supplied (1−t)⁻¹, same | Agree |
| Additive writing of 𝕎_N (supplier) versus multiplicative U_N (here) | (1,0)+(1,0) over ℤ, N=2 | Here: (2,−1) ↦ (1−2t)⁻¹(1+t²)⁻¹=1+2t+3t²=(1−t)⁻² mod t³; KTheoryFiniteLocalFields §5.16a Check 2: the same value | One object, two notations; no convention mismatch |
| Deleted quotient bullet recoverable from the kept laws | m=1,n=2 over ℤ | Coordinate W_{S_2}/V_2W_{S_1}≅ℤ via x₁; series (1+at+bt²)(1+ct²)=1+at+(b+c)t² so 𝕎_2/V_2𝕎_1≅ℤ via the t-coefficient; γ_2(x₁,x₂) has t-coefficient x₁ | Consequence of the Verschiebung law and the supplied quotient; deletion correct |
| New supplier edge direction | merge order | KTheoryFiniteLocalFields 67 < QWittVectors 186; latest supplier 68, so movable placement ≥ 69 > 67; depcheck 0 problems | Sound |
| Scope line 9 and Downstream consumers | occurrences | "KTheoryFiniteLocalFields" occurs in Scope (as supplier), the supplier subsection, §1.4a, its Needs and the Layer 1 Dependencies; 0 occurrences under Downstream consumers | Reverse citation removed |
| Layer 1 Dependencies line | union of Needs | 20 items in the union of §§1.1–1.8 Needs; 20 items on line 323; symmetric difference empty | Sound |
| `gap:framed-skew-product` declaration | README vs plan | README declares 8 `gap:` slugs (line 122 added at 74b3029); plan `gaps` has 7; the missing one is framed-skew-product | R01 |
| Imported quotient from §5.16a | occurrences | `𝕎_(mn)(R)/V_n𝕎_m(R)` occurs 1 time in the README (line 88), in no Needs, Dependencies or target | R02 |
| `gap:framed-skew-product` Checks 1–3 | 𝔽₂[T][[h]]; ℤ[X,Y][[h]]; merge X,Y↦T | Previous review rows: d(T²)=hTe at p=2 vs untwisted 0; (e_X·Y)·X=qXYe_X both ways, d²(XY)=0; merged d(XY)↦2Te vs (2+h)Te | Carried; hold under the stated contract |
| Layer 1 title | both files | README line 144 and Lean line 65 identical strings | Sound |

**Library and sibling declarations opened at this head.** KTheoryFiniteLocalFields #1281: lines 26, 28, 1171–1187, 1189, 1244, 1257. Hesselholt (sources cache): lines 290–299, 336–342, 583–600, 644–656. Merge order lines 55, 67, 68, 186. Board `packages/QWittVectors/design/plan.json` `gaps` (seven entries, suppliers HabiroCyclotomicCompletions, DerivedDeRhamCohomology, DerivedModuleAlgebra, PrismaticCohomology ×2, DGAInfinity ×2). Pinned libraries: the packages directory was at Mathlib 6b7abb3c and Tau Ceti a91d3aa, the manifest pins; no changed passage cites a new library declaration, so the 48-declaration table of the first full review stands.

**Ownership against open work.** The only object the diff moves is the series-group model, now imported from KTheoryFiniteLocalFields, which owns it by its Conventions; the coordinate big Witt ring and γ_N remain here, where the coordinate carrier is built (§1.3). KTheoryFiniteLocalFields §5.16a still states γ_N as well (recorded under Previous findings R01, outside this pull request). Open pull requests not listed with a path in the brief were read only through the roadmap index tools.

**Headline theorems and padding.** Unchanged file: the two statable headlines (§1.2 ghost-image criterion, §8.1 unique framed automorphism) are present; the module docstring names every other headline family and the carrier each lacks. No declaration was added or removed.

## Not verifiable

- The KTheoryFiniteLocalFields half of the previous R01 (reducing its §5.16a to the series model and removing its citation of QWittVectors §§1.1–1.5) lies in pull request #1281 and is reported as data, not verified as planned.
- Whether the worker's repair allowance permits adding a gap to `design/plan.json` (R01) is a process fact this review cannot settle; the brief states the package may add gaps, and the finding is written on that basis.

## Source issues

- none

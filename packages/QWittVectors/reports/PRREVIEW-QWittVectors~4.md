# Review of QWittVectors (pull request #1351 at 85f99e7)

**Verdict:** needs changes

Incremental re-review of the 2 lines changed since 65c0d99 (README line 88: the clause importing the quotient `𝕎_(mn)(R)/V_n𝕎_m(R)` from KTheoryFiniteLocalFields §5.16a is deleted; `Suggested.lean` unchanged; no file changed outside the folder). The previous findings are accounted for under `## Previous findings`; the changed passage and everything that cites it (Scope line 9, §1.4a, its `*Needs:*` line, Layer 1 Dependencies) were reviewed in full. The one blocking finding is the plan-side registration of `gap:framed-skew-product`, which the previous two reviews raised and this head still does not address.

## R01 (P2) — `gap:framed-skew-product` is declared in the README but not in the plan's `gaps`, so the intake never announces it

**Location:** `TauCetiRoadmap/QWittVectors/README.md:122` ("**`gap:framed-skew-product` — Arbitrary-base finite framed skew DGA.** Required extension of PrismaticCohomologyPartII §5.0 …"), consumed at lines 15, 1124, 1132, 1151, 1166, 1232 and 1242.

**Claim:** the arbitrary-base skew product on every finite `QFraming` is a declared supplier contract of PrismaticCohomologyPartII.

**Witness:** `packages/QWittVectors/design/plan.json`, top-level `gaps`, lists seven slugs (cyclotomic-contract, ordinary-derham, cohomology-completion, prismatic-frobenius, pd-presentation, dga-bockstein, dga-quotient); the brief's list of declared gaps for this job is the same seven. The README states eight `gap:` contracts. PrismaticCohomologyPartII at its open head states `QDeRham.skewDGA` (§5.18) only on framed q-PD envelopes `F=D_{J,q}(P)` over D flat over ℤ_p[[q−1]], so the product on an arbitrary base is not supplied there, and no other roadmap mentions the slug. The repair report for the previous round (GATE-QWittVectors~11, H02) confirms the finding and says only that the job could not edit the plan; it does not mark the finding not actionable. Without the plan entry the contract is undeclared, and Layers 8–9 rest on a product with no obligated owner.

Re-raised: H02 of GATE-QWittVectors~11 (the report confirms the finding; its reason concerns the repair allowance, not the finding, so the contract stays undeclared until the entry exists).

**Repair:** add to the plan's `gaps` the entry `slug: framed-skew-product`, `supplier: PrismaticCohomologyPartII`, `section: "Part II extension: arbitrary-base finite framed skew DGA interface"`, `needs:` the requirement sentence of README line 122 (product `(a e_I)(b e_J)=aγ_I(b)e_I∧e_J`, unit, square-zero one-forms including characteristic two, signed DG Leibniz law, coordinate-injective naturality, under §5.0's scaling, regularity and divisibility hypotheses and no p-regularity, δ-structure or q-PD datum). The README text needs no change. Adding a gap to the top-level list is the one plan edit the package stage permits; if the worker's allowance excludes that file, a maintainer must add the entry before acceptance.

**Repair test:** the three Checks under the contract (README lines 126–128) were recomputed in the review at 74b3029 and are carried forward below; registering the slug changes no mathematics.

## Previous findings

- R01 — not repaired: README line 122 still declares `gap:framed-skew-product`; the plan's `gaps` still lists seven slugs without it; the diff touches neither. Re-raised as R01 above.
- R02 — repaired: line 88 now ends "…and the Teichmüller class (1−at)⁻¹. Only these series-side objects are imported."; the strings `𝕎_(mn)(R)/V_n𝕎_m(R)` and `5.16a` occur 0 times in the README.

## Verified sound

**Scope of this pass.** The 2-line diff was read with every passage that cites or is cited by it: Scope (line 9), the supplier subsection (lines 86–88), §1.4a in full (lines 237–262) with its `*Needs:*` line (255) and Checks (259–262), and the Layer 1 Dependencies line (323). `Suggested.lean` and `metadata.toml` are byte-identical to 65c0d99. The outside-folder diff against `origin/main` is empty.

**Gate and mechanical checks.** The gate command on this head returned every scanner count 0 and `OK`, exit 0 (`set_option`, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material); the worker's gate adds `build=0`. The dependency command with `--movable` returned exactly:

```text
depcheck: 204 roadmaps, 1392 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Merge order: PrismaticCohomologyPartII line 55, KTheoryFiniteLocalFields line 67, HabiroCyclotomicCompletions line 68, QWittVectors line 186, so the KTheoryFiniteLocalFields edge points downward. `roadmaps resolve`: cross-roadmap citations found nowhere, none; the eleven Lean-name leads are this roadmap's own four declarations and supplier names (`Decalage.*`, `QFraming.*`, `QDeRham.skewDGA`, `FramedAlgebra.toQFraming`, `TauCeti.LambdaRing.PreLambda`) resolved by the earlier reviews; none is touched by the diff.

**Elaboration and signatures.** The shared packages directory was at the manifest pins (Mathlib 6b7abb3c, Tau Ceti a91d3aa) and no build was running in this worktree. `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` for all four declarations appended: exit 0, two `sorry` warnings (lines 82 and 102), no other output. The elaborated types of `BigWitt.TruncationSet`, `BigWitt.ghostPolynomial`, `BigWitt.ghost_image` (carries `CommRing R`, the truncation set, the prime lifts φ and the congruence hypothesis) and `QWitt.framedGamma_existsUnique` (carries the scalar tower and `Algebra.Etale (MvPolynomial (Fin r) A) R`) are identical to the worker's `signatures.md` and to the previous report; no section binder was lost and no change was needed. The file is unchanged, so the earlier one-tactic probes and padding audit apply unchanged.

**The changed supplier contract against its source.** KTheoryFiniteLocalFields at its open head (pull request #1281; not on main), Conventions line 26: `𝕎_N(k)` for N≥1 as the constant-one units of k[t]/(t^(N+1)) on Mathlib's `Polynomial` and `PowerSeries` carriers, `𝕎(k)=1+t·k[[t]]`, `V_n : 𝕎_m(k) → 𝕎_(mn)(k)` induced by t↦tⁿ, Teichmüller class (1−at)⁻¹, the group written additively; line 28: the power-series group model and its quotient calculation belong there, general big Witt theory here. Each of the four objects README line 88 imports is stated at line 26; the deleted quotient is consumed by no target, `*Needs:*` line or Dependencies line of this README. KTheoryFiniteLocalFields is in the brief's list of roadmaps this one may consume.

**§1.4a against the reduced contract.** Line 239 identifies U_N(R) with the supplied `𝕎_N(R)` for N≥1 and keeps U_0(R) trivial locally; line 241 identifies U_∞(R) with the supplied `𝕎(R)`; the Verschiebung bullet refers to "the supplied series Verschiebung" t↦tⁿ; the Teichmüller bullet computes γ_N(τ(a))=(1−at)⁻¹ from the coordinate τ of §1.4, matching the supplied class. The `*Needs:*` line cites "KTheoryFiniteLocalFields Conventions for the series groups 𝕎_N(R), 𝕎(R) and their Verschiebung" and nothing from §5.16a; Layer 1 Dependencies (line 323) cites "KTheoryFiniteLocalFields Conventions". The sentence "Only these series-side objects are imported" is now true of the README.

**Seeded sample.** The diff touches none of the fifteen seeded targets; the previous reports' checks stand. The §1.4a locators (hesselholt lines 589, 644–655, 292–298, 338–341) were re-read at 65c0d99 and §1.4a is unchanged since.

**Adversarial table.** Rows for statements the diff leaves untouched are the previous reports' rows (132 in the first full review, 18 at 74b3029, 12 at 65c0d99) and are carried forward by citation; the rows below are computed at this head for the changed statement and what depends on it.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| Line 88: the four imported objects exist at the supplier | KTheoryFiniteLocalFields #1281 Conventions line 26 | README: 𝕎_N(R) for N≥1, 𝕎(R), V_n by t↦tⁿ, class (1−at)⁻¹; supplier line 26: the same four, N≥1, same carriers | Agree; the contract is a subset of the Conventions |
| Line 88: "Only these series-side objects are imported" | occurrences in the README | `𝕎_(mn)(R)/V_n𝕎_m(R)`: 0; `5.16a`: 0; `KTheoryFiniteLocalFields`: lines 9, 86, 239, 255, 323, all citing the Conventions | True at this head; R02 of the previous review repaired |
| Deleted quotient still derivable from what is kept | m=1,n=2 over ℤ; n=1 | Coordinate W_{S_2}/V_2W_{S_1}≅ℤ via x₁; series (1+at+bt²)(1+ct²)=1+at+(b+c)t², class a; γ_2(x₁,x₂)=1+x₁t+(x₁²+x₂)t² has t-coefficient x₁; n=1: both quotients 0 | Consequence of the kept Verschiebung law; no consumer lost |
| §1.4a Teichmüller bullet against the supplied class | a=2 over ℤ, N=2; a=1 over 𝔽₂, N=2 | γ_2(2,0)=(1−2t)⁻¹=1+2t+4t²; supplied (1−2t)⁻¹, same. Over 𝔽₂: γ_2(1,0)=(1−t)⁻¹=1+t+t², same | Agree |
| §1.4a Verschiebung bullet against the supplied V_n | N=4,n=2,x=(1,1); N=3,n=2,x=(1); n>N | γ_2(x)=1+t+2t² ↦ 1+t²+2t⁴ and γ_4(0,1,0,1)=(1−t²)⁻¹(1−t⁴)⁻¹=1+t²+2t⁴ mod t⁵; L=1, V_2(1)=(0,1,0), γ_3=(1−t²)⁻¹=1+t² and γ_1(1)(t²)=1+t² mod t⁴; L=0, source empty, image 1 | Agree, including the boundary cases of Check 4 |
| §1.4a U_0 kept local versus supplier starting at N≥1 | N=0; N=1 | N=0: R[t]/(t)=R, constant-one units {1}, W_∅(R)=0; N=1: (1+at)(1+bt)=1+(a+b)t mod t², γ_1(a)=1+at additive | Correct split: the supplier omits N=0 |
| New supplier edge direction | merge order | KTheoryFiniteLocalFields 67 < QWittVectors 186; latest supplier 68; depcheck 0 problems | Sound |
| `gap:framed-skew-product` declaration | README vs plan vs supplier | README declares 8 `gap:` slugs; plan `gaps` has 7; PrismaticCohomologyPartII §5.18 states `QDeRham.skewDGA` on `F=D_{J,q}(P)` only; 1 roadmap (this one) mentions the slug | R01 |
| `gap:framed-skew-product` Checks 1–3 | 𝔽₂[T][[h]]; ℤ[X,Y][[h]]; merge X,Y↦T | Previous review rows: d(T²)=hTe at p=2 vs untwisted 0; (e_X·Y)·X=qXYe_X both ways, d²(XY)=0; merged d(XY)↦2Te vs (2+h)Te | Carried; hold under the stated contract |

**Library and sibling declarations opened at this head.** KTheoryFiniteLocalFields #1281: lines 26, 28, 1173, 1180, 1184. PrismaticCohomologyPartII #1065: lines 48, 2050–2062 (§5.18 statement and `QDeRham.skewDGA` bullet). Board `packages/QWittVectors/design/plan.json` `gaps` (seven entries) and `reports/GATE-QWittVectors~11.md` (H02). Merge order lines 55, 67, 68, 186. No changed passage cites a new library declaration, so the 48-declaration table of the first full review stands.

**Ownership against open work.** The only object the diff touches is the series-group model, imported from KTheoryFiniteLocalFields, which owns it by its Conventions line 28; γ_N and the coordinate big Witt ring stay here (§§1.3–1.4a). Open pull requests not listed with a path in the brief were read only through the roadmap index tools (`roadmaps show`, `roadmaps grep`).

**Headline theorems and padding.** Unchanged file: the two statable headlines (§1.2 ghost-image criterion, §8.1 unique framed automorphism) are present; the module docstring names every other headline family and the carrier each lacks. No declaration was added or removed.

## Not verifiable

- The KTheoryFiniteLocalFields half of the first review's R01 (reducing its §5.16a to the series model and removing its citation of QWittVectors §§1.1–1.5) lies in pull request #1281: at its head, line 1173 still constructs `bigWittPowerSeriesComparison`. It is reported as data, not verified as planned.
- Whether the worker's repair allowance permits adding a gap to `design/plan.json` (R01) is a process fact this review cannot settle; the brief states the package may add gaps, and the finding is written on that basis.

## Source issues

- none

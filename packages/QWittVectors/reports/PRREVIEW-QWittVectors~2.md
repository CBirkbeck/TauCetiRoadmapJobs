# Review of QWittVectors (pull request #1351 at 74b3029)

**Verdict:** needs changes

Incremental re-review of the 130 README lines changed since 2a7475f (`Suggested.lean` and `metadata.toml` are byte-identical to that head). The previous findings are accounted for under `## Previous findings`; the changed passages and everything that cites them were reviewed in full.

## R01 (P2) — The big Witt power-series comparison still has two owners, and the new consumer entry points against the merge order

**Location:** `TauCetiRoadmap/QWittVectors/README.md:244` (new API bullet "γ_(mn) induces W_(S_(mn))(R)/V_n W_(S_m)(R) ≃ U_(mn)(R)/V_n U_m(R)"), line 258 (new Check "For m=1,n=2 over ℤ, V_2(a)=(0,a) maps to 1+at²…"), line 1405 ("**KTheoryFiniteLocalFields**: §1.4a supplies the coordinate-to-power-series comparison used by its §5.16a … the general coordinate ring and comparison have the same owner here"), and line 9.

**Claim:** QWittVectors owns the coordinate-to-series comparison, and KTheoryFiniteLocalFields consumes it.

**Witness:** KTheoryFiniteLocalFields at its open head (pull request #1281, afe02e8), Conventions paragraph three: "the power-series group model and its truncated-polynomial quotient calculation belong here"; §5.16a states γ_N, coefficient, restriction, Verschiebung and Teichmüller compatibility, the restriction limit and the quotient transport, with the same m=1, n=2 Check. Merge order: KTheoryFiniteLocalFields line 67, QWittVectors line 186; QWittVectors' latest supplier, HabiroCyclotomicCompletions, is line 68, so no placement puts QWittVectors before line 67.

**Why it still blocks:** the repair added a quotient bullet and a Check that reproduce the KTheoryFiniteLocalFields clauses, so the overlap grew rather than shrank; and "Downstream consumers" now names a roadmap that precedes this one, which that roadmap cannot act on without an upward citation (it already cites "QWittVectors §§1.1–1.5" as the carrier of its own §5.16a, so the two READMEs cite each other in opposite directions). The dependency check does not read the consumers section, which is why it reports 0 problems.

**Repair (within this pull request):** add a `### From TauCetiRoadmap.KTheoryFiniteLocalFields` supplier subsection importing its Conventions' multiplicative group `𝕎_N(R)` of constant-one truncated series, its `V_n` given by t ↦ tⁿ, and its quotient `𝕎_(mn)(R)/V_n𝕎_m(R)` (§5.16a); state §1.4a as the comparison from this roadmap's coordinate group `W_(S_N)(R)` into that supplied group, keeping the construction of γ_N, its four compatibilities and the restriction limit here because they need the coordinate carrier; delete the quotient API bullet and its Check (the supplied quotient plus the Verschiebung law already give them); delete the KTheoryFiniteLocalFields entry from Downstream consumers and the clause "the general coordinate ring and comparison have the same owner here". Record in the report to the author that KTheoryFiniteLocalFields §5.16a's own construction clause must be reduced to its series model by that roadmap; that edit is outside this pull request.

**Repair test:** γ_2(2,−1)=(1−2t)⁻¹(1+t²)⁻¹=1+2t+3t² and V_2(a)=(0,a) ↦ 1+at² mod t³ are unchanged when the target group is the supplied `𝕎_2(ℤ)`; the quotient `W_(S_2)/V_2W_(S_1) ≅ ℤ` via x_1 and `𝕎_2/V_2𝕎_1 ≅ ℤ` via the t-coefficient ((1+at+bt²)(1+ct²)=1+at+(b+c)t² mod t³) agree through γ_2, as a consequence rather than a second target.

## R02 (P2) — `gap:framed-skew-product` is declared in the README but not where the intake reads it

**Location:** `TauCetiRoadmap/QWittVectors/README.md:118` ("**`gap:framed-skew-product` — Arbitrary-base finite framed skew DGA.** Required extension of PrismaticCohomologyPartII §5.0 …"), consumed at lines 1123, 1131, 1150, 1231, 1241.

**Claim:** the arbitrary-base skew product on every finite `QFraming` is a declared supplier contract of PrismaticCohomologyPartII.

**Witness:** `packages/QWittVectors/design/plan.json`, top-level `gaps`, lists exactly seven slugs: cyclotomic-contract, ordinary-derham, cohomology-completion, prismatic-frobenius, pd-presentation, dga-bockstein, dga-quotient. `packages/QWittVectors/review.json` records the same seven as `conditional_gaps`. No `framed-skew-product` entry exists, so the intake will never announce the contract on the supplier's job and PrismaticCohomologyPartII has no obligation to build it; Layers 8–9 then rest on a product nobody owns. The contract itself is precise and minimal: PrismaticCohomologyPartII (#1065, 45495a1) §5.0 says "the associative product is §5.18's skew product", and §5.18 is stated only for framed q-PD data over D flat over ℤ_p[[q−1]], which excludes A=𝔽₂.

**Repair:** add to the plan's `gaps` the entry `slug: framed-skew-product`, `supplier: PrismaticCohomologyPartII`, `section: "Part II extension: arbitrary-base finite framed skew DGA interface"`, `needs:` the README's requirement sentence (product `(a e_I)(b e_J)=aγ_I(b)e_I∧e_J`, unit, square-zero one-forms including characteristic two, signed DG Leibniz law, coordinate-injective naturality, under §5.0's scaling, regularity and divisibility hypotheses and no p-regularity, δ-structure or q-PD datum). The README text needs no change. The earlier repair reports marked plan edits "outside the edit allowance"; adding a gap to the top-level list is the one plan edit the package stage permits, so that reason does not apply here. If the worker's allowance still excludes the file, a maintainer must add the entry before acceptance.

**Repair test:** the three Checks at lines 122–124 were recomputed (table below) and hold under the stated contract; registering the slug changes no mathematics.

## R03 (P3) — The gate's build failure at this head is environmental and must be re-established

**Location:** the worker's gate at 74b3029: `build=52 FAIL`, first line `error: Mathlib/Algebra/CharP/Invertible.lean:6:0: failed to open file '…/Mathlib/Tactic/Translate/GuessName.olean': No such file or directory` (52 such lines, all missing Mathlib object files).

**Claim:** the targeted build `lake build TauCetiRoadmap.QWittVectors.Suggested` fails.

**Witness:** the shared Lake packages directory used by this worktree had Mathlib checked out at f6090c70, not the manifest pin 6b7abb3c, when this review ran; its reflog shows checkouts alternating between the two pins at 16:29, 16:29, 16:30, 16:33, 16:33 and 16:37 UTC on 2026-10-30, and `Mathlib/Tactic/Translate/` held only `.ilean` and `.ir` files, no `.olean`. `Suggested.lean` is byte-identical to 2a7475f, whose targeted build passed in the worker's gate and whose independent elaboration succeeded in the previous review with the two intended `sorry` warnings. This review did not run `lake env lean`, because doing so would have forced another checkout of the shared directory and competed with other builds.

**Repair:** none to the roadmap. The worker re-runs the gate once the shared packages directory is stable at the pinned Mathlib; acceptance remains conditional on that passing build, as the brief requires.

## R04 (P3) — Layer 1's title names content the layer no longer holds

**Location:** `TauCetiRoadmap/QWittVectors/README.md:140` ("## Layer 1: Big Witt rings and shared homological algebra") and `TauCetiRoadmap/QWittVectors/Suggested.lean:65` (the matching section comment).

**Claim:** Layer 1 delivers shared homological algebra.

**Witness:** the deletion of §§1.9–1.11 leaves §1.8 (finite-prime arithmetic fracture) as the only homological target; the cochain-completion, Bockstein and quotient interfaces are now supplier gaps.

**Repair:** retitle to "Big Witt rings and arithmetic fracture" in both files (the Lean change is a comment only), or leave as is; this does not block.

## Previous findings

- R01 — not repaired: KTheoryFiniteLocalFields §5.16a still constructs γ_N with all compatibilities and the quotient transport; this head adds a matching quotient bullet and Check and names that earlier roadmap as a consumer. Re-raised as R01 above.
- R02 — partly repaired: `gap:framed-skew-product` is stated at line 118 with the requested laws (product, unit, e_i²=0 at two, Leibniz, coordinate-injective naturality, no p-regularity or q-PD datum) and consumed in §§8.3, 8.4, 9.4, with three computed Checks; the plan's `gaps` list lacks the slug. Re-raised as R02 above.
- R03 — repaired: §§1.9–1.11 deleted; `gap:cohomology-completion`, `gap:dga-bockstein`, `gap:dga-quotient` restored under the DerivedModuleAlgebra and DGAInfinity subsections with the plan's hypotheses; §7.2, §9.3, §9.5 and the Layer 7 and 9 Dependencies now cite the gaps; Scope line 15 names the Part II owners. No reference to the deleted sections remains (checked by search).

## Verified sound

**Scope of this pass.** The diff (55 insertions, 75 deletions, README only) was read line by line together with every passage that cites or is cited by it: Scope (lines 9–15), the DerivedModuleAlgebra, DGAInfinity and PrismaticCohomologyPartII supplier subsections (lines 48–124), How to read the build (138), §1.4a in full (233–262), Layer 1 Examples and Dependencies (316–322), §7.2 (949–971), §§8.3–8.4 (1121–1160), §§9.3–9.5 (1210–1275), the Layer 7, 8 and 9 Dependencies lines, and Downstream consumers (1403–1412). `Suggested.lean` (118 lines) and `metadata.toml` are unchanged since 2a7475f (`git diff --stat` empty). The outside-folder diff against `origin/main` is empty.

**Gate and mechanical checks.** Scanners: every count 0 (`set_option`, blob, latex, prnum, sorry-data, sorry-examples, imports, forbidden, readme-ids-missing, round-labels, stray-files, outside-folder, …). Build: see R03. The dependency command with `--movable` returned exactly:

```text
depcheck: 210 roadmaps, 1445 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README: cross-roadmap citations found nowhere, none; Lean names found nowhere, none. Elaborated signatures of the four declarations (worker's `signatures.md`, unchanged file): no dropped section binder; `ghost_image` carries `CommRing R`, the truncation set, the prime lifts and the congruence hypothesis; `framedGamma_existsUnique` carries the scalar tower and `Algebra.Etale (MvPolynomial (Fin r) A) R`. The signature check with `#check @name` was done in the previous review on this identical file and is carried forward; no change was needed.

**Three restored gaps against the plan.** Each README contract was compared clause by clause with the plan's `needs` (brief data): `cohomology-completion` (unbounded ℤ[q]-cochain complex, three torsion conditions with degree-dependent bounds, degreewise = derived h-completion, both cohomology/completion isomorphisms) matches; `dga-bockstein` ("acting injectively on every term" = "regular on every term", lift independence, square zero, signed derivation law, naturality, Fβ_fV=β_g with F reduction and V multiplication by a=f/g) matches; `dga-quotient` (homogeneous two-sided differential ideal, quotient DGA initial among maps killing J, least differential ideal of relations, graded commutativity and strict odd alternation descend) matches. Suppliers named: DerivedModuleAlgebra and DGAInfinity, both on main; none is `none`. The extra sentence under `gap:dga-bockstein` ("using AInfCohomology §AI.1.4 for the additive Bockstein") is a route for the supplier, not a hypothesis.

**New gap against its supplier.** PrismaticCohomologyPartII at 45495a1 (#1065): §5.0 (line 1582 of the rendered README) defines `QFraming`, `qDeriv` and `qDeRhamComplex` on "a D-algebra E with commuting D-automorphisms γ_s … with tX_s regular" and defers the product to §5.18; §5.18 (line 2043) states `QDeRham.skewDGA` "for a framed q-PD datum (P,S,J) over D flat over Z_p[[q−1]]" with derived (p,q−1)-completion. So the arbitrary-base product is not supplied, and the gap asks for nothing already provided. PrismaticCohomologyPartIII (#1070) and PartIV (#1080) were searched for "skew", "QFraming", "qDeRhamComplex" and "framed q-de Rham": PartIII mentions framed q-de Rham only as an AInfCohomology import; PartIV has no such object. The frame of §8.1 meets §5.0's regularity hypothesis: R is flat over A[T₁,…,T_r] (étale), so each T_i is regular on R and hT_i on R[[h]].

**Seeded sample.** Of the fifteen seeded targets, the diff touches 7.2 (Needs line), 8.3 (one clause and Needs) and 9.5 (one proof-route sentence and Needs); their locators are unchanged. Re-read at this head: wagner lines 2846–2875 (§§4.7–4.8, printed p. 57) support the skew rule `dT_i ∧ f = γ_i(f) dT_i`, the q-Leibniz rule and the DG algebra conclusion over an arbitrary A, as §8.3 and the gap state; wagner lines 3198–3227 (Lemma 4.25, pp. 64–65) state the three torsion conditions, degreewise completion and both cohomology/completion formulas exactly as `gap:cohomology-completion` does, used by §9.5; wagner lines 3026–3032 (§4.16) and 3178–3194 (§4.23) support the Bockstein sign and the F, V definitions of `gap:dga-bockstein` consumed by §9.3. Hesselholt lines 292–298 give the coordinate V_n used by the §1.4a bullets. The other twelve sampled targets are untouched and their checks in the previous report (its sample table, 15/15 readable) stand.

**Adversarial table.** Rows for statements the diff leaves untouched are the previous report's 132 rows and are carried forward by citation; the rows below are computed at this head for every changed or added statement. q=1+h throughout.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| §1.4a quotient bullet, well-definedness of V_n on series | m=1,n=2; m=2,n=2; general | t^(m+1) ↦ t^(n(m+1)); n(m+1) ≥ mn+1 for n ≥ 1, so the truncation ideal is preserved; n=0 excluded as before | True; duplicate of KTheoryFiniteLocalFields (R01) |
| §1.4a quotient bullet, isomorphism | m=1,n=2 over ℤ | Left quotient ≅ ℤ via x₁; right: (1+at+bt²)(1+ct²)=1+at+(b+c)t² so the class is a; γ₂(x₁,x₂) has t-coefficient x₁ | Agree; R01 |
| §1.4a quotient bullet, compatibility γ_(mn)V_n=V_nγ_m | m=2,n=2, x=(1,1) | γ₂(x)=1+t+2t², substituted at t²: 1+t²+2t⁴; γ₄(0,1,0,1)=(1−t²)⁻¹(1−t⁴)⁻¹=1+t²+2t⁴ mod t⁵ | Agree |
| §1.4a new Check | m=1,n=2; n=1 | V₂(a)=(0,a)↦(1−at²)⁻¹=1+at² mod t³, killed by both projections; n=1: V₁=id, both quotients 0 | True; R01 |
| gap:framed-skew-product Check 1 | E=𝔽₂[T][[h]], D=𝔽₂[[h]] | d(T²)=D(T²)e=(1+q)Te=(2+h)Te=hTe; untwisted rule T e+e T=2Te=0; ker(2 on D)=D so D is not flat over ℤ₂[[h]] | True; gap needed |
| gap:framed-skew-product Check 2 | E=ℤ[X,Y][[h]] | (e_X·Y)·X=(Ye_X)·X=Yγ_X(X)e_X=qXYe_X; e_X·(YX)=γ_X(XY)e_X=qXYe_X; d(XY)=Ye_X+Xe_Y; d²=e_Y∧e_X+e_X∧e_Y=0; no coordinates: C=E | True |
| gap:framed-skew-product Check 3 | ℤ[X][[h]]→ℤ[X,Y][[h]]; merge X,Y↦T | e_X·X=qXe_X on both sides, D_Y(X)=0; merged: d(XY)↦2Te vs d(T²)=(2+h)Te, differ by hTe≠0 | True; termwise merge excluded |
| gap:framed-skew-product unit and square zero at p=2 | one coordinate over 𝔽₂[[h]] | 1·(ae)=ae=(ae)·1; e·e=0 imposed by the exterior basis, not implied by e·e=−e·e in characteristic 2 | Separate axiom retained |
| gap:cohomology-completion (text unchanged from old §1.9) | [ℤ[h]→ℤ[h]] by h; Mⁱ=ℤ[h]/h^(i+1); ℤ[1/p] with h=0 | Previous rows "1.9 …" (three rows): H¹=ℤ, ℤ_p after (p,h); bounds i+1 unbounded; h-completion ℤ[1/p], (p,h)-completion 0 | Carried; ownership now correct |
| gap:dga-bockstein (text unchanged from old §1.10) | dx=2u,f=2; dx=4u,f=4,g=2,a=2; matrix DGA dx=3u; f=1 | Previous rows "1.10 …" (four rows): β[x]=u, β[x²]=0; Fβ₄V[x]=2u=0=β₂[x]; 2xuE₁₁ both sides; P/1=0 | Carried |
| gap:dga-quotient (text unchanged from old §1.11) | ℤ[x]⊗Λ(u), dx=u; J=0,P,(2); ℤ⟨x,y,z⟩ | Previous rows "1.11 …" (three rows): differential closure (x,u), quotient ℤ; mod 2 keeps u²=0; two-sided (x) kills xy and yx | Carried |
| §8.3 with product from the gap | T², rank 0, rank 2 XY, injection | Previous rows "8.3 …" (four rows): d_C(T²)=(1+q)TdT, d_H=(q²−1)TdT; d¹d⁰(XY)=1−1=0; dT·T=qTdT | Carried; supplier now the gap |
| §8.4 Frobenius on the gap's product | p=2, T | Previous rows "8.4 …" (two rows): φ_H(dT)=TdT, φ_C(dT)=(1+q)TdT, φ(h)=h(1+q); γφ(T)=q²T²=φγ(T) | Carried |
| §9.3 via gap:dga-bockstein | m=1 T; m=2 T²; rank 0 | Previous rows "9.3 …": β₁(T)=dT; β₂[T²]=[TdT]; β=0 | Carried |
| §9.4 via gap:framed-skew-product | rank 1; (dX, YdX+XdY); mixed degrees; 960 coefficient cases | Previous rows "9.4 …" (four rows): commutator hXdX∧dY=d_H(−XYdX); all coefficients 0 | Carried |
| §9.5 via gap:cohomology-completion | m=2 T,T²; odd squares; rank 0 | Previous rows "9.5 …" (three rows): dT·T²=T²dT mod q²−1; 2x²=0 ⇒ x²=0 by torsion-freeness; E_m=R[[h]]/(q^m−1) | Carried |
| §7.2 via gap:dga-quotient | m=1,R=A[T]; R=A | Previous row "7.2 …": d(T²)=2TdT; positive degrees of A/A vanish | Carried |
| Downstream consumer KTheoryFiniteLocalFields | merge order | Consumer line 67 < supplier line 186, and < 69 after any movable placement (latest supplier HabiroCyclotomicCompletions at 68) | Direction defect; R01 |

**Library and sibling declarations opened at this head.** PrismaticCohomologyPartII #1065 (45495a1): §5.0 lines 1582–1625, §5.18 lines 2043–2075 (`QDeRham.skewDGA`, `skewDGA_injection`, `siteComparison_E1`, `groupCupProduct`), §3.16 line 550. KTheoryFiniteLocalFields #1281 (afe02e8): Conventions lines 26–28, §5.16a lines 1171–1187, §5.17 line 1189. PrismaticCohomologyPartIII #1070 and PartIV #1080: object searches only. Merge order lines 18, 19, 33, 53–56, 67, 68, 118, 186 read for the supplier positions above; DGAInfinity, DerivedModuleAlgebra, EnhancedDerivedSheaves and BordismFormalGroups are on main (fa41b37). The pinned-library declarations cited by the changed passages (`Algebra.TensorProduct.includeRight`, `Algebra.Etale`, `KaehlerDifferential.D`, `PowerSeries.isUnit_iff_constantCoeff`, `TauCeti.kaehlerBasisOfFormallyEtale`, `TauCeti.explicitBockstein1`, `TauCeti.integralBockstein`) were opened at the pins in the previous review (its 48-declaration table) and no changed passage alters how they are used; they were not reopened because the shared packages directory was not at the pin during this review (R03).

**Ownership against open work.** The skew-product, cochain-completion, Bockstein and quotient objects were searched by object in the sibling checkouts named in the brief and through `roadmaps grep`; the owners are the ones the README now names (PrismaticCohomologyPartII §5.18 for the q-PD range, DerivedModuleAlgebra and DGAInfinity Part II extensions for the generic interfaces). The big Witt series comparison has the second owner recorded in R01. Open pull requests not listed with a path in the brief were read only through the roadmap index tools.

**Headline theorems and padding.** Unchanged file: the two statable headlines (§1.2 ghost-image criterion, §8.1 unique framed automorphism) are present; the module docstring names every other headline family and the carrier each lacks, including §9.5a. The one-tactic probes and the padding audit of the previous review apply to this identical file; nothing in the diff adds or removes a Lean declaration.

## Not verifiable

- The targeted Lake build and a fresh elaboration of `Suggested.lean` could not be run at this head: the shared packages directory was at the other Mathlib pin and flipping (R03). The file's elaboration at 2a7475f, identical byte for byte, is the evidence relied on.
- Whether the worker's repair allowance permits adding a gap to `design/plan.json` (R02) is a process fact this review cannot settle; the brief states the package may add gaps, and the finding is written on that basis.
- The KTheoryFiniteLocalFields half of R01 (reducing its §5.16a to the series model) lies in another pull request and is reported, not verified as planned.

## Source issues

- **Misprint** in wagner at §4.8, printed p. 57 (wagner line 2869): the source says the non-commutative rule holds for indices 1 to d; it should say 1 to n, the number of coordinates fixed in §4.7; affects nothing.
- The eight source issues recorded in the previous review (wagner Lemmas 3.4, 3.7, 4.17, 4.32, Corollary 4.15; wagner-habiro Theorem 2.9; bhatt-scholze Theorem 16.18) concern unchanged passages and are not repeated here.

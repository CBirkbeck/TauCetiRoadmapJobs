# Review of K3BlochGroups (pull request #1430 at 2fe1218)

**Verdict:** needs changes

Incremental re-review of the 94 changed lines since c9ca311 (80 insertions, 14 deletions). The diff adds §4.9 "The third stable stem" with five new supplier contracts, repoints §4.16 and the Layer 4 dependencies to it, removes the HomotopySpheres and FourManifolds §7.1 contracts, and adds the Lean theorem `homotopyGroup_sphere_add_three_equiv`. The mathematics of §4.9 is correct; every value was recomputed below. The defects are ownership and supplier resolution (R01, R02), two names that no supplier declares (R03), the gate's six statement-hygiene hits (R04–R06) and the new references (R07).

## R01 (P2) — §4.9 re-plans the third stable stem that StringOrientation S2.3 and EllipticCohomology E4.S own; the new Lean theorem restates StringOrientation's headline

**Location.** `TauCetiRoadmap/K3BlochGroups/README.md:25` lists, among results "which the general roadmaps cited above do not state", "the third stable stem π₃ˢ≅ℤ/24 with its quaternionic Hopf generator, its Adams–Novikov calculation and η³=12ν (§4.9)". §4.9 is at lines 1347–1385. The Lean theorem `homotopyGroup_sphere_add_three_equiv` is at `TauCetiRoadmap/K3BlochGroups/Suggested.lean:78–86`.

**Claim.** This roadmap now owns:
- π₃ˢ≅ℤ/24 with its quaternionic generator ν;
- the p-local Adams–Novikov computation of that stem;
- the native form π_(n+3)(Sⁿ)≅ℤ/24 for n≥5, which it states as a headline.

Two roadmaps earlier in the merge order already own these objects. The same computation is therefore planned twice, and the same unstable statement is a headline of two `Suggested.lean` files.

**Witness.** StringOrientation (merge position 12; this roadmap is at 135) says at README line 52–54 that EllipticCohomology E4.S owns the third-stem computation and that S2.3 transports it to native spheres. Its line 640 states π_(n+3)(Sⁿ)≅ℤ/24 for n≥5, and its `Suggested.lean:52` declares `nonempty_homotopyGroup_sphere_three_stem`.

**Detail.**
- EllipticCohomology on main cites "E4.S's stem-3 calculation" for π₁₂S⁹≅π₃S≅ℤ/24 (its README line 1675–1676).
- HomotopySpheres §9.1 (its line 2652–2656) imports π₃⁽S⁾≅ℤ/24{ν} from StringOrientation S2.3 and rules out a second computation.
- The divisibility half of `etaCube_nonzero_even` (line 1364) repeats, almost verbatim, the Moore-spectrum step in ArithmeticKTheory §7.5's proof of `eta_pow_four_eq_zero` (its line 4003–4009).
- The one statement no other roadmap states as a target is η³=12ν≠0. FourManifolds §7.1 only quotes it from Kirby–Melvin, and TangentialBordism §8.3 uses it without naming a supplier.

The two Lean statements differ only cosmetically. Here it is `Additive (π_(n+3)) ≃+ ZMod 24` on `TopCat.sphere.{u} n` at every point. There it is `≃* Multiplicative (ZMod 24)` on the unit sphere of `EuclideanSpace ℝ (Fin (n+1))` at one point. `TopCat.sphere` is a `ULift` of that same sphere (Mathlib `Topology/Category/TopCat/Sphere.lean:37`), and the sphere is path connected.

**Repair.**
1. Delete from §4.9 these statements and the Checks on them:
   - `quaternionicHopfClass` and `quaternionicHopf_cofibre`;
   - `adamsNovikov_geometricBoundary`;
   - `sphereAdamsNovikovStemThree` and its cobar paragraph;
   - `quaternionicPlane_bpExtension`;
   - `stableStemThree_equiv`.

   Delete the Lean theorem, and the docstring sentences on the third stem at `Suggested.lean` lines 8–9 and 20–22.
2. Add `### From TauCetiRoadmap.StringOrientation`: S2.3 supplies π₃S≅ℤ/24 with generator ν, compared with the quaternionic Hopf construction S⁷→S⁴, and π_(n+3)(Sⁿ)≅ℤ/24 for n≥5, taking the stem from EllipticCohomology E4.S and E5.
3. Keep §4.9 as the target η³=12ν:
   - η³∈2π₃S, by the Moore argument (or cite ArithmeticKTheory §7.5);
   - 2η³=0;
   - η³≠0, by α₁³ detection: E₂^(3,6)=ℤ/2, and no stem-four class in filtration at most one can hit it;
   - hence η³ is the unique element of order two, which is 12ν.

   Its *Needs:* are StringOrientation S2.3, StableHomotopyKTheory §7.1 and ArithmeticKTheory §7.5.
4. Narrow line 25 to η³=12ν. Repoint §4.16 (line 1624 and its *Needs:*), the Layer 4 introduction (line 1099) and the Layer 4 Dependencies (line 1781). Drop the contracts that only the deleted computation uses: BordismFormalGroups F1–F3, GeneralizedCohomology G4.0a/G4.1/G4.5/G5.6, the Tau Ceti formal-group logarithm, and AlgebraicTopology Stage 4 item 4.

Tested on the instance that refuted it. A scratch copy without the theorem elaborates with `sorry` as the only warning, so the n≥5 statement remains only in StringOrientation. In ℤ/24 the only element of order two is 12, so step 3 gives η³=12ν for ν and for −ν.

## R02 (P2) — GeometryOfNumbersAndQuadraticArithmetic §6.1a no longer supplies the stable-stem carrier cited from it

**Location.** `README.md:117`: "Section 6.1a supplies `sphereSuspensionHom q n` … the classical stable stems `stableStem k` … stage maps `stableStem.ι`, the universal property `stableStem.isColimit` … `stableStem.tailIso`". The names are used at lines 1351, 1355, 1368 and 1370, and in §4.9's *Needs:* at line 1385.

**Claim.** The supplier contract attributes five names, and the stable-stem colimit, to a section that disowns them at its current head. §4.9 therefore consumes objects that its named supplier does not provide.

**Witness.** GeometryOfNumbersAndQuadraticArithmetic README (open head), line 43: these five names "→ HomotopySpheres §3A.3"; only `sphereSpectrumHomotopyIso` stays in §6.1a. HomotopySpheres line 868–874 states the objects but gives them no names. `roadmaps grep` finds `stableStem.tailIso` declared nowhere.

**Repair.** If R01's repair removes §4.9's use of the stable stem, delete the paragraph at lines 115–117. Otherwise:
- cite HomotopySpheres §3A.3 (merge position 72) in prose for the suspension homomorphisms and the stable stem as a sequential colimit in `AddCommGrpCat`, with its structure maps, universal property and independence of the starting stage;
- keep GeometryOfNumbersAndQuadraticArithmetic §6.1a only for `sphereSpectrumHomotopyIso`;
- remove the five backticked names.

Checked: HomotopySpheres §3A.3 at its head states exactly these objects (its line 872–874) and names no declarations.

## R03 (P3) — `sphere_firstStems` and `mooreTwo_piTwo` are not names StableHomotopyKTheory declares

**Location.** `README.md:87`: "Section 7.1 also supplies `sphere_firstStems`, π₁S=ℤ/2 on η and π₂S=ℤ/2 on η², and `mooreTwo_piTwo`: π₂(S/2)=ℤ/4". The first name is used again at line 1364.

**Claim.** Backticks mark supplier declarations, but neither name exists anywhere.

**Witness.** StableHomotopyKTheory README (open head) §7.1, line 2351, proves both facts in prose without names, and its `Suggested.lean` declares neither. `roadmaps grep 'sphere_firstStems|mooreTwo_piTwo'` matches only this README.

**Repair.** At both lines write, without backticked names: "StableHomotopyKTheory §7.1's first stems (π₁S=ℤ/2 on η, π₂S=ℤ/2 on η²) and π₂(S/2)=ℤ/4 with twice a lift of η equal to i(η²)". Alternatively the lines go with R01's repair.

## R04 (P3) — Gate statement-hygiene: the new theorem concludes `Nonempty` without a `nonempty_` name

**Location.** `Suggested.lean:82–85`: `theorem homotopyGroup_sphere_add_three_equiv … : Nonempty (Additive (HomotopyGroup.Pi (n + 3) (TopCat.sphere.{u} n : Type u) x) ≃+ ZMod 24)`.

**Claim.** The gate's statement-hygiene rule requires an abstract-equivalence conclusion to carry a `nonempty_*` name.

**Witness.** Gate line: "line 84: P3 theorem `homotopyGroup_sphere_add_three_equiv` concludes `Nonempty (Additive (HomotopyGroup.Pi …`; keep `Nonempty` only as a corollary named `nonempty_*`".

**Repair.** Delete the theorem as part of R01; the scratch copy without it elaborates cleanly. Renaming it to `nonempty_*` would satisfy the gate, but the theorem would still duplicate StringOrientation's.

## R05 (P3) — Gate statement-hygiene: `[Fintype F]` beside `[Field F]` in three finite-field headlines

**Location.** `Suggested.lean:147, 159, 171`: `finite_sl2_localized_homology`, `finite_sl2_integral_homology` and `finiteBloch_order`, whose conclusions also use `Fintype.card F`. These lines are unchanged since c9ca311; the gate rule now flags them.

**Claim.** The gate requires `[Finite F]` with `Nat.card F` beside `[Field F]`.

**Witness.** Gate lines 147, 159 and 171: "P3 `[Fintype F]` beside `[Field F]` … repair: use `[Finite F]`; `Nat.card F` is the cardinality".

**Repair.** Replace `[Fintype F]` by `[Finite F]` and every `Fintype.card F` by `Nat.card F`, including `hF : 4 ≤ Nat.card F` and `Even (Nat.card F)`. Tested: the scratch copy elaborates with `sorry` as the only warning, and the values for q=2, 3, 4, 5, 7 are unchanged (adversarial table).

## R06 (P3) — Gate statement-hygiene: the two finite SL₂ headlines conclude `Nonempty` without `nonempty_` names

**Location.** `Suggested.lean:149, 161`: `Nonempty (groupHomology (Rep.trivial …) 3 ≃+ ZMod (…))` in `finite_sl2_localized_homology` and `finite_sl2_integral_homology`.

**Claim.** Same rule as R04. These isomorphisms are abstract; README line 7 itself separates abstract cyclic isomorphisms from natural maps. So there is no canonical map to state, and the rename is the right repair.

**Witness.** Gate lines 149 and 161: "concludes `Nonempty (groupHomology …`; keep `Nonempty` only as a corollary named `nonempty_*`".

**Repair.** Rename to `nonempty_finite_sl2_localized_homology_equiv` and `nonempty_finite_sl2_integral_homology_equiv`, and update README lines 1827 and 1829. Tested in the same scratch copy.

## R07 (P3) — §4.9's new references are unrecorded, and the Adams locator does not state what it is cited for

**Location.** `README.md:2356–2357`: Ravenel, and Adams "Proposition 7.14, for the e-invariants of the Hopf classes". The same locators appear in §4.9's source paragraph at line 1372.

**Claim.** Neither work is in the roadmap's source manifest. The cited Adams proposition only relates the invariants; it does not evaluate them.

**Witness.** `packages/K3BlochGroups/sources.toml` has keys from `bloch` to `weibel-chern` and no Ravenel or Adams entry. Proposition 7.14 (adams-jx4 line 911–913) relates e′_R, e_C and e″_R on stems r≡3, 7 mod 8. Line 944 says the values come afterwards.

**Repair.** R01's repair removes the computation and both citations. If either stays, record the work in `sources.toml` (Ravenel's author page; the Rochester copy of Adams) and cite the Adams theorem that evaluates e on the image of J, not Proposition 7.14.

## Previous findings

- none: the previous report at c9ca311 recorded no findings, so nothing carries over.

## Verified sound

### Gate, dependency check and elaboration

My own run of the gate at this head:

```text
gate K3BlochGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=6 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
depcheck: 239 roadmaps, 2426 edges, 0 problem(s)
```

- **Depcheck.** There is no UPWARD, CYCLE or moved line. Every roadmap the diff cites precedes this one in the merge order:

  | Roadmap | Position |
  | --- | --- |
  | GeometryOfNumbersAndQuadraticArithmetic | 74 |
  | ArithmeticKTheory | 133 |
  | StableHomotopyKTheory | 17 |
  | StringOrientation | 12 |
  | HomotopySpheres | 72 |
  | EllipticCohomology | 7 |
  | K3BlochGroups (this roadmap) | 135 |

  BordismFormalGroups and GeneralizedCohomology are on main.
- **The six statement-hygiene hits** are R04–R06.
- **The worker's `build=2` is a false positive, not a folder defect.** The line is: "warning: TauCetiRoadmap/K3BlochGroups/Suggested.lean: imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file".
  - Lake emits it for every non-`module` file that imports a module-system package; see the toolchain's `Lake/Config/LeanConfig.lean:276–286`. Importers opt out with `allowNonModules`, which the repository's `lakefile.toml` (outside this folder) does not set.
  - On main, 128 of the 141 roadmap `Suggested.lean` files have no `module` header and get the same warning.
  - `lake env lean` on this file prints only the nine `declaration uses sorry` warnings, at lines 44, 82, 109, 122, 134, 147, 159, 171 and 184.
  - The fix belongs to the repository lakefile or to the gate. Adopting `module`/`public import Mathlib`, as 13 main roadmaps do, is optional.
- **Outside the folder.** The diff against `origin/main` outside the folder is empty. The files that `changes.md` lists outside the folder come from the merge of main.
- **Lean.** `#check @` of all 14 declarations in one scratch file elaborates without error. The 13 unchanged types match the previous comparison. The new type is `∀ n, 5 ≤ n → ∀ x : TopCat.sphere n, Nonempty (Additive (π_(n+3)) ≃+ ZMod 24)`, which matches §4.9's `stableStemThree_equiv` sentence; no section binder is lost.
- **Repair probe.** A scratch copy with the R01/R04–R06 repairs elaborates with `sorry` as the only warning.

### The changed passages and the supplier citations they make

| Citation in the diff | Resolved at | Outcome |
| --- | --- | --- |
| Tau Ceti `FormalGroup.log`, `FormalGroup.exp`, `FormalGroup.zsmulSeries_eq_subst_exp` | pin: `RingTheory/FormalGroup/Logarithm/Basic.lean:333, 449`; `…/Naturality.lean:197` ([n]_F = exp_F(n·log_F) over a ℚ-algebra) | exist as stated |
| StableHomotopyKTheory §7.1 (η, η², π₂(S/2)=ℤ/4, 2ῆ=i(η²)) | open head, README line 2340–2351 | content present; names absent (R03) |
| AlgebraicTopology Stage 4 item 4 `coordinateCubeQuotientSphereHomeomorph` | main README line 542–547, positive first-coordinate pole | exists |
| ArithmeticKTheory §7.5 `sphereAdamsNovikovLowE2` | open head line 3968–3990: η_R(v₁)=v₁+pt₁, Δt₁ primitive, sparseness, zero line, E₂^(1,2)=ℤ/2·α₁, E₂^(2,6)=0, E₂^(4,8)=ℤ/2·α₁⁴; π₄S=0 | all six items present |
| GeometryOfNumbersAndQuadraticArithmetic §6.1a | open head line 43, 2232–2269 | only `sphereSpectrumHomotopyIso` (R02) |
| BordismFormalGroups F1–F4 | main: F1 line 46 (log/exp from Tau Ceti, line 89); F2 line 145 with e^c(γ_H)\|CP∞=t[−1]_F(t) at line 164; F3 line 284–290 (Hazewinkel, BP_*BP); F4 line 329 | present |
| GeneralizedCohomology G2.5, G4.0a, G4.1/G4.5, G5.6 | main: Freudenthal line 326–328; `quaternionicProjectiveSpace` line 1003, block homeomorphism and Hopf attaching map line 1012–1016, `quaternionicHopfSphereHomeomorph` line 1023; projective-bundle theorem for d=4, line 1279–1281; S_ℚ≃Hℚ line 2232 | present |
| §4.16's new citation of §4.9 and its *Needs:* | README line 1624, 1641 | internally consistent; repoint after R01 |
| Removed: HomotopySpheres §9.1 and FourManifolds §7.1 | heads: HomotopySpheres line 2643 (imports from StringOrientation S2.3); FourManifolds line 2880–2881 (η³=12ν only quoted) | the README no longer names HomotopySpheres, StringOrientation or EllipticCohomology anywhere |

Hatcher locators of §4.9 and of the Lean docstring:
- The table on p.339 (hatcher line 14775–14790) gives π₇(S⁴)=ℤ×ℤ/12 and π₈(S⁵)=…=π₁₁(S⁸)=ℤ/24.
- p.385 (hatcher line 16749–16752) gives η³=4ν 2-locally and η³=12ν in ℤ/24.
- Line 20413–20418 gives π₇(S⁴)→π₈(S⁵) onto ℤ/24.

No consumer cites K3BlochGroups §4.9, and the diff drops no id (§4.9 was unused at c9ca311). overlaps.md lists no conflicting pull request and no dropped id; R02's dropped names are a fact read at the supplier's head, outside that tool's id index.

### Seeded sample where it falls in the changed passages

None of the fifteen sampled targets is in the diff; their checks in the reviews at 12c408e and c9ca311 stand. R05 and R06 touch the Lean forms of §§5.2 and 5.5, so I re-read their locators:
- hutchinson2013 line 704–708 (Corollary 3.6, p.14): ℤ[1/p]-homology ℤ/(q²−1) in degrees ≡3 mod 4.
- hutchinson2013 line 861–863 (Lemma 3.14, p.17): the characteristic part is ℤ/p exactly at q∈{2,3,4,5,8,9,27} in degree three.
- hutchinson2013 line 1679 and 1731: Lemma 7.4 and Corollary 7.5, pp.34–35.

### Adversarial computations

New rows for the changed statements come first. The previous report's rows follow, carried for the untouched statements. README line numbers in carried rows are those at c9ca311; lines after §4.9 are now 50 higher.

| Statement / defining law | Instances tried | Computed values and excluded model | Result / change |
| --- | --- | --- | --- |
| §4.9 stem-three E₂ at p=2, bidegree (1,4) | normalized cobar on v₁², v₁[t₁], [t₁²], [t₁\|t₁] | d(v₁²)=(v₁+2t₁)²−v₁²=4(v₁[t₁]+[t₁²]); d(v₁[t₁])=±2[t₁\|t₁] and d[t₁²]=±2[t₁\|t₁] (middle term of Δ(t₁²)), so the cocycles have rank one and E₂^(1,4)=ℤ/4. The model "[t₁²] is a cocycle" gives ℤ/2 and is excluded by its Check. | Correct; superseded by R01 |
| §4.9 stem three at p=2, bidegree (3,6); bidegree count | C^(3,6)=ℤ₍₂₎[t₁\|t₁\|t₁], C^(4,6)=0; t even forces s odd | Three coboundaries, each ±2 times the generator, give ℤ/2 on α₁³. The case s=5 needs t=8≥10, which fails. | Correct; R01 |
| §4.9 stem three at p=3 and p≥5 | BP₄=ℤ₍₃₎v₁, \|t₁\|=4; p=5 | d(v₁)=3[t₁] gives ℤ/3, and t=8 needs 8≥20. For p=5, t−s≥7s>3 when s≥1, and 8∤3 rules out s=0. | Correct |
| §4.9 E₂=E_∞ in stem three | sources (0,4), (1,5); targets (4,6), (6,8) | Ext⁰ is 0 in positive degree; (1,5) has t odd; the targets have t<2s. | Correct |
| §4.9 λ in y=u+λu² | log=x+m₁x^p | exp(z)=z−m₁z²+2m₁²z³+…; the z⁴ coefficient of exp(z)exp(−z) is −2m₁²+m₁²−2m₁²=−3m₁² (p=2), 2m₁ (p=3), 0 (p≥5). −exp(z)²=−z²+2m₁z³+… is not even, as the Check says. | Matches |
| §4.9 c=η_R(λ)−λ | m₁=v₁/2, η_R(m₁)=m₁+t₁ | −3((m₁+t₁)²−m₁²)=−3(v₁t₁+t₁²), integral, and −3 is a unit mod 4. At p=3, c=2t₁; the coboundary change for a=v₁ is 3t₁. | Matches |
| §4.9 2-primary extension | order-8 groups with order-2 K and G/K≅ℤ/4 | In ℤ/4⊕ℤ/2, K=⟨(0,1)⟩ or ⟨(2,1)⟩, and neither lies in 2G={0,(2,0)}. In ℤ/8, K=⟨4⟩⊂2G. η³∈2π₃S gives ℤ/8. | Correct |
| §4.9 η³=12ν and the quotient | ℤ/24; ν↦−ν | The only element of order 2 is 12; 12(−ν)=12ν; 4ν has order 6; ℤ/24/⟨12⟩≅ℤ/12. | Correct |
| §4.9 Moore divisibility | triangle S→S→S/2 | i(η³)=(2ῆ)η=ῆ(2η)=0, so η³∈ker i=2π₃S; this is the same argument as ArithmeticKTheory line 4003–4009. | Correct; duplicate (R01) |
| §4.9 geometric boundary at k=1 | f∈π₀S=ℤ | BP-Hurewicz ℤ→ℤ₍ₚ₎ is injective, so f=0, C_f=S⁰∨S¹, the extension splits and the class is 0. | Consistent |
| §4.9 Freudenthal range | n=4, 5 | n+3≤2n−2 ⇔ n≥5; at n=4, i=2n−1, so the map is onto. ℤ⊕ℤ/12→ℤ/24 is onto and not injective. | Correct |
| `homotopyGroup_sphere_add_three_equiv` | n=4, 5, 6, 8; arbitrary x; universe u | n=4 is excluded (π₇(S⁴) is infinite); n=5–8 give ℤ/24; Sⁿ is path connected; π_(n+3) is a `CommGroup` (Mathlib `HomotopyGroup.lean:606`). | True; duplicate (R01), gate (R04) |
| §4.16 changed paragraph | ℤ/24 and {0,12ν} | The quotient is ℤ/12, and ν↦−ν fixes 12ν. | Correct; repoint after R01 |
| R05/R06 repaired finite-field forms | F₂, F₃, F₄, F₅, F₇ | Nat.card equals Fintype.card. ℤ[1/p]-homology has orders 3, 8, 15, 24, 48. Integral homology has orders 6 (S₃), 24 (binary tetrahedral), 30 (A₅), 120 (binary icosahedral) and 48 (q=7, not exceptional: 2-part ℤ/16 from Q₁₆, 3-part ℤ/3). | Values unchanged |
| Scope: Rogers enters only through §5.8 | Count of targets mentioning the Rogers function, by layer | Layers 1–4: 0; Layer 5: §5.8 only (lines 1969, 1971, 2009) plus its example at line 2013; Layer 6: 0. Supplier contract, scope and downstream mentions are not targets. | Carried from the review at c9ca311 |
| §5.8 detector normalization (the Layer 5 example at line 2013) | x=2, −1, 1/2 with Zagier's extension of L | ρ([2]) = 2·π²/6 − L(1/2) − π²/6 = π²/12; ρ([−1]) = −L(1/2) − π²/6 = −π²/4; ρ([1/2]) = π²/12 − π²/6 = −π²/12. Sum for c = [2]+[−1]: −π²/6, of order exactly 6 in ℝ/π²ℤ; 2c ↦ −π²/3 ≠ 0, 3c ↦ −π²/2 ≠ 0. | Carried from the review at c9ca311 |
| §§5.1–5.7 routes after dropping the Rogers contract | q=4, 5, 7 for §5.5; ℚ for §5.7 | §5.5: B orders 5, 3, 4 and kernels 3, 8, 12 multiply to q²−1 = 15, 24, 48, from the finite-field and Hutchinson inputs alone. §5.7: K₃(ℚ)=C₄₈, Milnor image C₂, quotient C₂₄, no analytic input. An analytic value appears in none of the seven routes. | Carried from the review at c9ca311 |
| Downstream: PadicHodgeRegulators §4.7 evaluation on §6.6's rational isomorphism | ℚ(√−3), ω=(1+√−3)/2 (the consumer's own witness at its line 1068) | 1−ω = ω⁻¹, so ∂[ω] = ω⊗ω⁻¹ = ω⊗ω in the antisymmetric cokernel (diagonals have order two). Since ω = −ζ₃², ω ≡ −1 modulo squares, so ∂[ω] is the diagonal class of −1, nonzero because −1 is not a square in ℚ(√−3); hence [ω] is not a cycle while 2[ω] is, exactly as §6.3 and the consumer's line 1068 state. Both sides use the same Suslin orientation ∂[x]=x⊗(1−x). | Carried from the review at c9ca311 |
| Downstream: Polylogarithms Layer 2 boundary sign | x=2 over ℚ | This roadmap: ∂[2] = 2∧(1−2) = 2∧(−1); Polylogarithms (its line 108) uses the negative, (−1)∧2. The kernel B(F) is the same subgroup either way; the consumer records the sign. | Carried from the review at c9ca311 |
| Merge-order direction of the named consumers | Positions in the merge order | PolylogarithmFunctions 38 < ArithmeticKTheory 126 < K3BlochGroups 128 < Polylogarithms 288 < PadicHodgeRegulators 309. Consumers appear only in Scope and Downstream, suppliers in `*Needs:*`. | Carried from the review at c9ca311 |
| Conventions: rings and fields | Zero ring; proposed field of order 1 | GLₙ(0)=St(0)=1; positive K-groups=0. A field has 0≠1, excluding q=1. | Carried from the review at c9ca311 |
| Conventions: antisymmetry versus alternation | A=ℤ, element 1 | Qₛ(A)=C₂ with diagonal 1; Λ²A=0; twice the diagonal=0. | Carried from the review at c9ca311 |
| Conventions: negative unit | F₃; F₅ with primitive unit g | In F₃, (−1)⊗(−(−1))=0; in F₅, g⊗(−g)=3 mod 4. Inverse-unit and diagonal quotients are not interchangeable. | Carried from the review at c9ca311 |
| Conventions: boundary orientation | [3] over ℚ, valuations v₂,v₃ | v₂(3)v₃(−2)−v₃(3)v₂(−2)=−1; reversed boundary gives +1. | Carried from the review at c9ca311 |
| §1.1 plus space and cover | A=0,ℤ,ℚ | At 0 all positive groups vanish. At ℤ, π₂(BSt⁺)=0 versus π₂(BE⁺)=C₂. At ℚ, π₁(BSt⁺)=0 versus π₁(BGL⁺)=ℚ×. | Carried from the review at c9ca311 |
| §1.2 canonical comparison | All carriers C₅; q multiplication by 2; other maps identity | c(1)=3 and c⁻¹(3)=1; using q forward gives 2. | Carried from the review at c9ca311 |
| §1.3 actual bar cycles | Trivial group; g≠1 in St(ℤ) | d₄[1,1,1,1]=[1,1,1]; d₃[1,1,1]=0; d₃[g,1,1]=[1,1]−[g,1]≠0. | Carried from the review at c9ca311 |
| §1.3 evaluation and equality witnesses | z=[1,1,1], z′=0 | Underlying chains differ by a nonzero basis vector, but both evaluations are 0; the four-identity chain has precisely their difference as boundary. | Carried from the review at c9ca311 |
| §1.4 transport and finite stages | Identity map; zero ring; two finite supports | Identity preserves each tuple and coefficient; zero-ring homology classes=0; supports of sizes r,s have union size at most r+s and descend to a common stage, not a fixed rank. | Carried from the review at c9ca311 |
| §1.5 finite-wedge coordinates | Ranks 0,1,3 | Ranks of π₃ are 0,1,6, from r+r(r−1)/2; omitting pair terms gives 0,1,3. | Carried from the review at c9ca311 |
| §1.5 signs and folds | Two summands, coordinate (1,1,1) | Swap preserves the pair coordinate; fold gives η+η+[ι,ι]=4η, using [ι,ι]=2η. | Carried from the review at c9ca311 |
| §1.5 H-space Hopf kernel | A=ℤ; real line self-swap | C₂→C₄₈ has image {0,24}; quotient C₂₄. The line swap has determinant −1, not +1; the quotient has no additive section. | Carried from the review at c9ca311 |
| §2.1 indecomposable quotient | ℚ; ℚ(i) | C₄₈/C₂=C₂₄; (ℤ⊕C₂₄)/0=ℤ⊕C₂₄. Quotienting by all torsion would instead give 0 and ℤ. | Carried from the review at c9ca311 |
| §2.2 integral Milnor injection | ℚ; finite fields | At ℚ, 1∈C₂ maps to 24∈C₄₈, with kernel 0. At finite fields, K₃ᴹ=0, so the kernel is again 0. | Carried from the review at c9ca311 |
| §2.2 diagonal Chern coefficient | n=1,2,3; ordered rational-function symbols | (−1)ⁿ⁻¹(n−1)! gives 1,−1,2. Iterated residues of x and 2x give 1 and 2; reversing one pair changes 2 to −2. | Carried from the review at c9ca311 |
| §2.2 characteristic and coefficients | Algebraically closed characteristic 2; coefficient 2 | Positive-degree defining-characteristic coefficient groups=0, while K₀/2=C₂. Milnor 2-torsion=0; the argument does not divide by 2 in an arbitrary group. | Carried from the review at c9ca311 |
| §2.2 normalized positive-characteristic torsion | Frobenius of F̄₂, moduli 3 and 5 | Weight two acts by 2²=4, hence 1 mod 3 and 4 mod 5; ordinary roots would give 2 in both. Bott Bockstein identifies the same cyclic coordinates. | Carried from the review at c9ca311 |
| §2.3 signature basis | ℚ(√2), ordered embeddings √2↦±√2 | The cube symbols of √2 and −√2 have signatures (0,1) and (1,0); {−1}³ has (1,1). | Carried from the review at c9ca311 |
| §2.3 decomposable subgroup | r₁=0,1,2; restriction ℚ→ℚ(√2) | Orders are 1,2,4. Restriction sends the nonzero rational signature to (1,1), not to one selected coordinate. | Carried from the review at c9ca311 |
| §2.4 stable SL homology | ℚ; F₅ | Stable H₃(SL) is C₂₄ in both cases; unstable H₃(SL₂(F₅)) is C₁₂₀ and P(F₅)=C₆. These cannot be substituted for stable SL. | Carried from the review at c9ca311 |
| §2.5 rational quotient and rank | ℚ; ℚ(i) | Both K₃⊗ℚ and K₃ⁱⁿᵈ⊗ℚ are 0 for ℚ and ℚ for ℚ(i), agreeing with r₂=0,1. | Carried from the review at c9ca311 |
| §3.1 cokernel and exact diagonal headline | A=0,ℤ,C₂,C₃ | Qₛ is 0,C₂,C₂,0; Λ² is 0 in each case; kernels equal A/2A=0,C₂,C₂,0. | Carried from the review at c9ca311 |
| §3.1 projection on a mixed module | A=ℤ², basis e,f | Qₛ=C₂{e²}⊕C₂{f²}⊕ℤ{e∧f}; exterior projection is the last coordinate. Diagonals of e+f and e−f agree; their difference is 2f. | Carried from the review at c9ca311 |
| §3.2 normalized projective cross-ratio | (0,∞,1,2,3) over ℚ | Deletion cross-ratios are (1/2,3/4,3/2,3,2); alternating sum is the stated R(2,3). Swapping the first two entries replaces 2 by 1/2. | Carried from the review at c9ca311 |
| §3.2 orbit/stabilizer adapter | Triple (0,∞,1); F₃ | A diagonal matrix fixes 1 iff its two entries coincide. Thus diag(2,2) fixes the triple; diag(2,1) does not. Distinct quadruples over F₃ normalize to −1. | Carried from the review at c9ca311 |
| §3.3 raw symbols and admissibility | x=0,1; x=2,y=3 over ℚ | Raw 0=0 but raw 1 is a free basis vector. The three quotient arguments are 3/2,3/4,1/2, all admissible; x=y would create 1 and is excluded. | Carried from the review at c9ca311 |
| §3.3 five-term signs | x=2,y=3 | R=[2]−[3]+[3/2]−[3/4]+[1/2]; its boundary is 0. Replacing the fourth minus by plus leaves twice ∂[3/4], whose valuation pairing is nonzero. | Carried from the review at c9ca311 |
| §3.3 finite certificates | Coefficient 1 at (2,3), k=0; empty support,k=1 | Evaluations are R(2,3) and raw [1], respectively; both classes are 0 in P. Empty support,k=0 evaluates to 0, not raw [1]. | Carried from the review at c9ca311 |
| §3.4 pre-Bloch presentation | F₂,F₃,F₄,F₅,F₇,F₁₁ | Reduced presentations give 0,ℤ,C₅,C₆,C₈,C₁₂. F₃ has no admissible pair; imposing an extra torsion relation would change ℤ. | Carried from the review at c9ca311 |
| §3.4 symbol-preserving reduction | F₅ with generator [3] of C₆ | [2]=2[3], [4]=0, [1]=0. Killing [1] is explicit; deleting nondegenerate symbols would change the group. | Carried from the review at c9ca311 |
| §3.5 Suslin boundary | F₅, primitive unit 2 | ∂[2]=0 and ∂[3]=1∈C₂, so ker(C₆→C₂)=C₃. Boundary reversed over ℚ is detected by the −1 versus +1 valuation witness. | Carried from the review at c9ca311 |
| §3.5 finite kernel | F₇ | P=C₈, boundary onto C₂, kernel C₄ generated by [−1]=2[3]. Replacing the target by the exterior square gives kernel C₈. | Carried from the review at c9ca311 |
| §3.6 universal c and inversion classes | F₄,F₅,F₇,F₁₁ | Orders of c are 1,3,2,6. Hence 6c=0 in all four; 2c and 3c both remain nonzero in F₁₁. | Carried from the review at c9ca311 |
| §3.6 h takes values in P | F₅, u=2 | h(2)=[2]+[3]=3[3] has order 2 and boundary 1∈C₂. Thus h is not a map into B. | Carried from the review at c9ca311 |
| §3.6 finite-field torsion controls | F₇, q≡1 mod 6 | c has order 2; [4] and [4]−c have order 4. Thus c=2[4]≠[4] and q≡1 mod 6 alone does not force c=0. | Carried from the review at c9ca311 |
| §3.7 small-field exceptions | F₂,F₃ | P and B are 0,0 for F₂; P=ℤ and B=2ℤ for F₃. The formula (q+1)/2 would give C₂ at q=3, which is excluded. | Carried from the review at c9ca311 |
| §3.8 exterior boundary and diagonal obstruction | F₅; F₃ | Exterior kernels are C₆ and ℤ; Suslin kernels are C₃ and 2ℤ. Their quotients are C₂, matching the unit square classes since K₂=0. | Carried from the review at c9ca311 |
| §3.8 nontrivial infinite-field diagonal | h(2) over ℚ | The sign-by-v₂ pairing of its boundary is 1 mod 2, while its exterior boundary is 0. | Carried from the review at c9ca311 |
| §3.9 full-tensor lecture kernel | F₃ | λ[−1]=1∈C₂, so raw kernel=2ℤ; raw 4[−1] has infinite order, unlike the rational Bloch torsion class. | Carried from the review at c9ca311 |
| §3.9 relations need not be raw cycles | F₅, x=2,y=3 | The reduced five-term relation is [4]; λ[4]=2∈C₄, nonzero. λ(2[4])=0 although 2[4] is a nonzero free chain. | Carried from the review at c9ca311 |
| §3.9 raw-to-Suslin map | F₅, 4[3] | λ[3]=1∈C₄, so λ(4[3])=0; 4[3] has order 3 in P and lies nontrivially in B. The raw kernel is not killed by 6. | Carried from the review at c9ca311 |
| §3.10 obstruction and sixfold lift | F₃; F₅ | At F₃, raw 2ℤ maps identically to B=2ℤ and obstruction=0. At F₅ the image contains 4[3], generating B=C₃; 2[4] remains a nonzero element of the map kernel. | Carried from the review at c9ca311 |
| §3.11 generic configuration presentation | F₃; F₅ | Coinvariant degree-three groups are ℤ and C₆; the F₅ boundary kernel is C₃. Negating the boundary changes its value, not its kernel. | Carried from the review at c9ca311 |
| §3.12 local curve specialization | A¹ at 0: t,t⁻¹,1+t | Orders are 1,−1,0; projective specializations are 0,∞,1. For t²+1 over ℝ the closed-point residue field is ℂ, not ℝ. | Carried from the review at c9ca311 |
| §3.12 regularity controls | Cusp at origin; dual-number thickening | Cusp local dimension=1 but cotangent dimension=2, so it is not a DVR. Dual numbers have a nonzero nilpotent and are not integral/smooth; both are outside the adapter. | Carried from the review at c9ca311 |
| §3.12 all-curve conditional comparison | F₃ | P(F₃)⊗ℚ=ℚ while the all-curve quotient can be 0; the roadmap retains its rigidity hypothesis and does not assert unconditional equality. | Carried from the review at c9ca311 |
| §3.13 old CGZ quotient | F₂; F₁₁ | Extended small-field quotient at F₂ is C₃. At F₁₁ both B and B_old have order 6 but the convention map has kernel C₂ and cokernel C₂, so abstract orders do not establish an isomorphism. | Carried from the review at c9ca311 |
| §3.14 published negative-unit target | F₃; F₅ | Q₋(F₃)=C₂ versus Λ²F₃×=0. Q₋(F₅)=0 versus Qₛ(F₅)=C₂. The negative-unit relation differs from alternation. | Carried from the review at c9ca311 |
| §3.15 extended cycle quotient | F₂,F₃,F₁₁ | B_new=C₃,0,C₃, respectively. At F₁₁ the ordinary B=C₆ loses exactly an order-two subgroup. | Carried from the review at c9ca311 |
| §3.16 comparison maps | F₇ | B=C₄→B_new=C₂ is reduction; B_new→B_old=C₄ has image {0,2}. Both defects are killed by 2; tensoring with ℚ removes them. | Carried from the review at c9ca311 |
| §4.0 injective words | Sets of sizes 2,3,5 | Augmented boundary ranks are (1,1), (1,2,4), (1,4,16,44,76). Top homology ranks are 1,2,44; the degree-three homology for size 5 is 0. | Carried from the review at c9ca311 |
| §4.0 finite versus infinite exactness | Two letters x,y | d(x,y)=y−x and d(y,x)=x−y, so their sum generates H₁=ℤ. Allowing repeated letters would destroy this finite-set control. | Carried from the review at c9ca311 |
| §4.1 signed total complex | One element in bidegree (p,q) | The two mixed terms of D² have coefficients (−1)ᵖ and (−1)ᵖ⁻¹, summing to 0. Without the degree sign they sum to 2. | Carried from the review at c9ca311 |
| §4.1 hyperhomology augmentation | G=1,C=0; G=1,X={x,y} | Zero complex gives 0; the two-letter complex gives H₁=ℤ and identity to coinvariants, versus H₁(1,ℤ)=0. The infinite-set assumption cannot be dropped. | Carried from the review at c9ca311 |
| §4.2 independent frames | Rank 0,rank 1; vectors e₁,2e₁ | Rank-zero augmented term is ℤ. In rank one both nonzero vectors have augmentation 1, so their difference has boundary 0; the pair (e₁,2e₁) is dependent, unlike distinct-point configurations. | Carried from the review at c9ca311 |
| §4.2 action convention | Lower shear on column (1,0) | [[1,0],[1,1]](1,0)=(1,1), not (1,0); this distinguishes the column action from the opposite parabolic convention. | Carried from the review at c9ca311 |
| §4.3 scalar acyclicity/affine comparison | Trivial unipotent part; n=m=1 | When the unipotent part is 0 the inclusion is identity and all homology maps are identities. Positive homology of the scalar-acyclic term vanishes; H₀ is ℤ, not 0. | Carried from the review at c9ca311 |
| §4.4 frame algebra | Degrees 0,1,2 | S₀=ℤ, S₁=F×, S₂=K₂ᴹ⊕ℤ; e maps to (0,1), not (1,0). | Carried from the review at c9ca311 |
| §4.5 connecting maps and ordered symbols | F=ℝ; unit entries −1,1 | The all-negative triple has Milnor signature 1 mod 2; a symbol containing 1 is 0. Ordered torus normalization has coefficient +1. | Carried from the review at c9ca311 |
| §4.6 frame splitting | n=0,1,2 | The splitting yields ℤ,F×,K₂ᴹ⊕ℤ; the e-summand at n=2 is nonzero even when K₂ᴹ(F)=0. This checks the shift by two. | Carried from the review at c9ca311 |
| §4.7 monomial groups | F₂,F₃; rank 2 | Orders are 2 and 8; GL₂(F₃) has order 48. Taking the full linear group would change the second control by a factor 6. | Carried from the review at c9ca311 |
| §4.8 general-linear stability headline | n=0,i=0; n=0,i=1 over ℚ; scalar 2 | H₀ map is ℤ→ℤ, identity. H₁(1)→H₁(ℚ×) is 0→ℚ× and is excluded. Stabilization sends 2 to diag(2,1), with inverse diag(1/2,1). | Carried from the review at c9ca311 |
| §4.10 coinvariant homology | P¹(F₂),P¹(F₃) | Degree-zero=ℤ and degrees one/two=0; degree-three groups are P(F₂)=0 and P(F₃)=ℤ. Small-field values are retained. | Carried from the review at c9ca311 |
| §4.11 triple stabilizer | a=3 over ℚ | Scalar diag(3,3) fixes (0,∞,1); diag(3,1/3) sends 1 to 1/9 and is not the stabilizer. | Carried from the review at c9ca311 |
| §4.11 eight-chain boundary | a=2,3,−1 over ℚ | Exact expansion modulo simultaneous right diagonal has six terms in each case and equals the displayed six-term boundary; difference is the zero chain. | Carried from the review at c9ca311 |
| §4.11 flip and final differential | Torus coordinates at a=3 | Mixed flip contributes −1. The coordinate change sends (1,−1) to (0,−1); determinant-one torus gives (2,−2)→(0,−2), detecting the missing factor 2 model. | Carried from the review at c9ca311 |
| §4.12 rank-two Bloch map | ℚ; symbol [2] | B(ℚ)=C₆ and c is nonzero of order 6, so a zero map cannot be onto. ∂[2] has nonzero diagonal sign-v₂ coordinate, so [2] is not an admissible Bloch output. | Carried from the review at c9ca311 |
| §4.13 general-position tuples | p₁,p₂,p₃,q over F₂ | Each three-column determinant is 1 in F₂, so the four-tuple is in general position; there is no general-position five-tuple in P²(F₂). | Carried from the review at c9ca311 |
| §4.13 projection cross-ratio | (p₁,p₂,q,(1:a:x)) viewed from p₃ | Images are (0,∞,1,a) and cr=a; interchanging p₁,p₂ gives a⁻¹. At a=2 these are 2 and 1/2. | Carried from the review at c9ca311 |
| §4.13 rotations and norm | Degree 2, a triple of distinct points | N=1+t+t² and (1−t)N=1−t³=0; the alternating 1−t+t² instead gives 2(t²−t), nonzero on that orbit. | Carried from the review at c9ca311 |
| §4.13 cone and truncated acyclicity | Three/four-letter sets | Top Cᵃ-homology ranks are 3 and 8; D₀=Cᵃ₁. For the displayed differential (dᵃa−Nb,−db), the mixed contribution −Ndb+Ndb=0. | Carried from the review at c9ca311 |
| §4.14 rank-three normalization | Normalized P; F₁₁ universal class | ψ′(P)=−2c; since c has order 6, this is 4c whereas +2c=2c. Their difference 2c is nonzero. | Carried from the review at c9ca311 |
| §4.14 rotation relation | Five rotations of a general-position tuple | The relation sums to 2c; in F₁₁ this has order 3, so a claimed zero relation would fail. | Carried from the review at c9ca311 |
| §4.15 two symbol identities | F₅, x=2, g=[3]∈C₆ | [x²]=0=2(2g+g). The corrected second expression is 4g=2c; the printed expression is 0, differing by an element of order 3. | Carried from the review at c9ca311 |
| §4.15 conjugation lift | Specified Γ, permutations (12),(34),(13)(24) | Γ⁻¹P₁₂Γ has rows (1,0,0,0),(0,1,1,0),(0,0,−1,0),(0,0,0,1); Γ⁻¹P₃₄Γ has rows (1,0,0,1),(0,1,0,−1),(0,0,1,0),(0,0,0,−1), matching the displayed blocks. | Carried from the review at c9ca311 |
| §4.15 third permutation lift | (13)(24) | Γ⁻¹PΓ has rows (1,1,0,0),(0,−1,0,0),(0,0,0,1),(0,0,1,0); determinant is +1, from two transpositions. | Carried from the review at c9ca311 |
| §4.15 cyclic power-map headline | C₇,a=2,j=1,2; C₁; a=0 | Multipliers are 2 and 4; the trivial cyclic group has zero positive homology; the zero-power map has multiplier 0 for j≥1. j=0 is excluded before natural subtraction. | Carried from the review at c9ca311 |
| §4.15 cyclic inclusion and symmetric stability headline | C₂→C₄; Σ₁→Σ₂; Σ₂→Σ₃ | H₃ inclusion sends 1 to 2∈C₄ and is injective. H₁ maps are 0→C₂ (outside range) and C₂→C₂ identity (2i≤n). H₀ at n=0 is identity ℤ. | Carried from the review at c9ca311 |
| §4.16 stable monomial indecomposables | F₂,F₄,ℚ | Groups are C₁₂, C₃⊕C₁₂, C₄⊕C₁₂; respective orders 12,36,48 and exponents 12,12,12. η³=12ν has order 2 in C₂₄. | Carried from the review at c9ca311 |
| §4.17 diagonal Tor and Chern sign | C₇, generator 1; weights u,−u | Composite through the Tor quotient sends 1 to 2. c₂ of the two lines is u(−u)=−u², not +u². | Carried from the review at c9ca311 |
| §4.18 torsion detector and twist | μ₇, automorphism exponent 2 | H₃/weight-two action is multiplication by 4; a root action alone would give 2. The product of divisible torsion μ with itself is 0, while Tor₁(μ,μ) contains C₇. | Carried from the review at c9ca311 |
| §4.18 Bockstein range | Modulus 2 via modulus 8 | C₈→C₂ reduction sends 1 to 1. This supplies the small-modulus comparison without assuming an unrestricted mod-two product. | Carried from the review at c9ca311 |
| §4.19 enhanced Tor | ℚ,F₅,F₄ | Enhanced groups have orders 4,8,3; ordinary root groups have orders 2,4,3. In characteristic 2 the enhancement adds no C₂. | Carried from the review at c9ca311 |
| §4.20 infinite-field Suslin headline | ℚ | 0→C₄→C₂₄→C₆→0 has kernel {0,6,12,18}; quotient cardinality 6. Replacing enhanced C₄ by μ(ℚ)=C₂ would give quotient order 12. | Carried from the review at c9ca311 |
| §4.21 K₃-ind rigidity and residue signs | F(t), symbol {2,t,π} | Last-parameter degree-three residue is {2,t}; right Quillen degree-two boundary of this ordered product gives 1/2. The degree-three comparison has positive sign; a uniform negative convention fails. | Carried from the review at c9ca311 |
| §4.21 rational specialization | R(tx,ty), t=0, with x=2,y=3 | Arguments specialize to (0,0,3/2,3/2,1), so the free specialization is [1], not 0; it vanishes only in the reduced quotient. | Carried from the review at c9ca311 |
| §4.21 rational-curve relation for [1] | s=1/(1−t), cycle [s]+[1−s] | sp₁−sp₀=2[∞]−[1]−[0]; after killing [0],[∞], this gives −[1]. The constant-cycle difference is 0. | Carried from the review at c9ca311 |
| §5.1 finite K₃-ind and transfer | F₂⊂F₄, degree 2 | Groups C₃→C₁₅; restriction sends a compatible generator to 5, transfer sends 1 to 1 mod 3. Transfer after restriction multiplies by 2; 1+Frob₂ acts by 1+4=5 mod 15. | Carried from the review at c9ca311 |
| §5.1 norm-one matrices | F₄/F₂, ω²+ω+1=0 | Multiplication by ω is [[0,1],[1,1]], determinant 1 and trace 1; its cube is I. Multiplication by 0 has determinant 0 and is excluded. | Carried from the review at c9ca311 |
| §5.2 finite SL₂ headlines | q=2,3,4,5,7 | Integral H₃ orders are 6,24,30,120,48; after inverting the characteristic they are 3,8,15,24,48, exactly q²−1. | Carried from the review at c9ca311 |
| §5.2 remaining exceptional fields | q=8,9,27 | Integral orders are 126,240,2184; characteristic factors 2,3,3 disappear after localization, leaving 63,80,728. | Carried from the review at c9ca311 |
| §5.2 periods, duality and stable elements | Q₈; trivial group; degree zero | H₁(Q₈)=C₂², H₃(Q₈)=C₈, distinguishing period-four from a cyclic period-two model. Positive homology of 1 is 0; H⁰(1,ℤ)=ℤ, not torsion. | Carried from the review at c9ca311 |
| §5.3 actual stabilization | F₂⊂F₄; F₃⊂F₉ | The compatible stable images have orders 3 in C₁₅ and 8 in C₈₀; arbitrary abstract cyclic isomorphisms need not preserve those maps. | Carried from the review at c9ca311 |
| §5.4 refined boundary | F₅, square-class ε | λ₁[2]=0, λ₁[3]=2(1−ε); R(2,3)=(1−ε)[2]+ε[4]. With ε=1 this recovers the ordinary relation [4]=0. | Carried from the review at c9ca311 |
| §5.4 small-field configuration range | P¹(F₄), transitive C₅ | There are five points and H₁,H₂,H₃ of the augmented configuration complex vanish; top H₄ has rank 44. A transitive orbit leaves zero outside points, so a fixed fresh-point argument would fail. | Carried from the review at c9ca311 |
| §5.5 finite Bloch order headline | q=4,5,7,11 | B orders 5,3,4,6; enhanced kernels 3,8,12,20 multiply to q²−1=15,24,48,120. At q=5 the integral SL₂ kernel has order 40, not 8. | Carried from the review at c9ca311 |
| §5.6 coefficient quotient | F₇,n=3; F₄,n=5 | For F₇, K₃/3=C₃ but B/3=0, and gcd(3,q−1)=3 violates the hypothesis. For F₄, both quotients are C₅ and gcd(5,3)=1. | Carried from the review at c9ca311 |
| §5.7 arithmetic quotient headline | ℚ; ℚ(i) | C₄₈/C₂=C₂₄ with no splitting; the Gaussian Milnor image is 0 and K₃ⁱⁿᵈ=ℤ⊕C₂₄. Both have w₂=24 but different ambient torsion orders. | Carried from the review at c9ca311 |
| §5.8 Rogers normalization | x=1/2,2,−1 | ρ values are −π²/12,π²/12,−π²/4 modulo π². Hence ρ(c)=−π²/6, of exact order 6; using period π²/2 would lose the order-two part. | Carried from the review at c9ca311 |
| §5.8 formally-real order-six headline | ℚ; real closure of arbitrary formally real F | ρ(2c)=−π²/3≠0 and ρ(3c)=−π²/2≠0 modulo π², while ρ(6c)=0. Finite-certificate transfer preserves these nonvanishings; no embedding F→ℝ is presumed. | Carried from the review at c9ca311 |
| §5.8 first-order transfer | Ordered real closed fields; rational parameters | The sentence x²+1=0 has zero solutions in each; x²=2 has two. A fixed coefficient certificate is a finite disjunction of equality patterns, unlike an unbounded existential quantifier over all integer lists. | Carried from the review at c9ca311 |
| §6.1 certificate transport | R(2,3); n=0,2,3 | Its integral quotient class is 0, hence its images mod 0,2,3 are 0. The certificate for raw [1] also has image 0; raw [0] is not a nonzero-generator certificate. | Carried from the review at c9ca311 |
| §6.2 boundary coordinates | ℚ: [2]+[−1]; F₅: [3] | Mixed coordinates of c cancel and diagonal signs sum to 0 mod 2; ∂[3] over F₅ is 1 mod 2. Omitting diagonals would incorrectly certify [3]. | Carried from the review at c9ca311 |
| §6.3 integral root multiple | Primitive sixth root ω in F₇ | 1−ω=ω⁻¹; boundary equals the nonzero diagonal of −1 in C₂. Thus [ω] is not a cycle but 2[ω] and 6[ω] are. | Carried from the review at c9ca311 |
| §6.3 square criterion | Primitive sixth root in F₁₃ | −1=5², so its diagonal vanishes; [ω] is a cycle. The F₇ and F₁₃ cases distinguish the square condition. | Carried from the review at c9ca311 |
| §6.3 generic kernel element | δ:ℤ→C₂, x=1, m=2; m=1 | δ(2)=0 gives the kernel element 2; δ(1)=1 prevents the same constructor at m=1. A vanishing proof cannot be omitted. | Carried from the review at c9ca311 |
| §6.4 division after coefficients | δ:ℤ→C₂, ker=2ℤ; coefficient C₅ | Dividing the kernel element 2 by 2 gives coordinate 3 on generator 2; dividing 4 by 4 gives 2·4⁻¹=3. Both map to 1 in ℤ⊗C₅. | Carried from the review at c9ca311 |
| §6.4 non-flat coefficient control | Same δ; coefficient C₂ | 2 is not invertible, and the map (2ℤ)⊗C₂→ℤ⊗C₂ is zero. The unit-order hypothesis, not flatness, is the stated requirement. | Carried from the review at c9ca311 |
| §6.5 lifting fibre | C₂₄→C₆, fibre over 1 | Fibre={1,7,13,19}; sixfold multiples are 6,18,6,18, none 0. It is a C₄-torsor with no additive section. | Carried from the review at c9ca311 |
| §6.5 bar lift witnesses | Trivial G; β=0 versus β≠0 | [1,1,1] and 0 are distinct chain representatives of the same zero class, differing by d₄[1,1,1,1]. No witness exists for a nonzero β when H₃(G)=0. | Carried from the review at c9ca311 |
| §6.6 finite-to-infinite compatibility | F₄, generator ω | The natural field inclusion sends ω to the same root; replacing it by ω² changes the order-five Bloch coordinate by 4, not 1. Compatibility is a map assertion, not an order comparison. | Carried from the review at c9ca311 |
| §6.6 coefficient snake sequence | 0→C₄→C₂₄→C₆→0, n=2 | B[2]=C₂→C₄/2=C₂ is nonzero: lift 3 has twice-lift 6, the generator of the kernel. Thus left exactness after quotient cannot be assumed. | Carried from the review at c9ca311 |
| §6.7 finite Chern headline and distinct coefficients | ℚ,n=5 | K₃(ℚ)/5=0 but K₂(ℚ)[5] contains {2,−31}: tame residue 2 has successive powers 2,4,8,16,1 mod 31; fivefold symbol is {32,−31}=0. | Carried from the review at c9ca311 |
| §6.7 even-coefficient Chern correction | Real field,m=2, Bott class β of order 4 | c₂(2β)=1 while 2c₂(β)=0 in C₂. The correction applies in degree two; the degree-three operation retains additivity. | Carried from the review at c9ca311 |

### Headline theorems and padding

The README's headline theorems are:
- the integral antisymmetric diagonal;
- general-linear and symmetric-group stability;
- the cyclic power map;
- integral and characteristic-localized H₃ of finite SL₂;
- the finite Bloch order;
- the formally-real order-six theorem.

The README now adds one more: the third stable stem.

The eight headlines carried from c9ca311 are stated on native carriers; their one-tactic probe in the earlier reviews applies to unchanged text. The new theorem is not padding: no one-tactic proof exists, since it is the stable-range π₃ˢ computation. It is nevertheless another roadmap's headline (R01). The module docstring still names the headlines that cannot be stated at the pins: Quillen K₃, the Milnor and motivic carriers, the Suslin sequence, the finite Chern map, and the Rogers detector.

### Pinned library declarations opened this round

- Mathlib `TopCat.sphere` (`Topology/Category/TopCat/Sphere.lean:37`, a `ULift` of the unit sphere in `EuclideanSpace ℝ (Fin (n+1))`).
- Mathlib `HomotopyGroup.Pi` (`Topology/Homotopy/HomotopyGroup.lean:460`) and its `commGroup` instance (line 606).
- Tau Ceti `FormalGroup.log` (`RingTheory/FormalGroup/Logarithm/Basic.lean:333`), `FormalGroup.exp` (line 449) and `FormalGroup.zsmulSeries_eq_subst_exp` (`…/Naturality.lean:197`).

The 21 groups of pinned declarations audited at 12c408e concern unchanged text and stand.

## Not verifiable

- **Ravenel, *Complex Cobordism and Stable Homotopy Groups of Spheres*** (Theorem 2.3.4, Theorem 4.4.37, Figure 4.4.45, §5.2). The sources service timed out twice on the author's host (`people.math.rochester.edu`: the PDF and `mu.html`). The locators are unchecked; R07 asks that the work be recorded.
- **Adams, *On the groups J(X) IV*.** Read at its Rochester copy. Page 25, where the values of the e-invariants follow Proposition 7.14, was recognised upside down, so the exact theorem number that evaluates e on the image of J could not be read. R07 rests only on the legible lines 911–913 and 944.
- **`suslin-1984`, `suslin-1991` and `bloch`** remain human-waived and are untouched by the diff.
- **Ownership against open pull requests** was checked in the heads the brief supplies (StringOrientation, HomotopySpheres, FourManifolds, TangentialBordism, ArithmeticKTheory) and through `roadmaps show` and `roadmaps grep` for GeometryOfNumbersAndQuadraticArithmetic and StableHomotopyKTheory.

## Source issues

- none

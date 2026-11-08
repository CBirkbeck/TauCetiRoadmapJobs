# Review of DGFloerPartII (pull request #1799 at aeddaae)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/DGFloerPartII/README.md` (1963 lines) and
`TauCetiRoadmap/DGFloerPartII/Suggested.lean` (377 lines, 27 declarations).

- **Gate and build.** The gate passes and the dependency check reports no problem. `lake env lean`
  gives 23 `sorry` warnings and no error.
- **The previous review (at 4e506b6).** Of its seven findings:
  - four are repaired: the factor 2 (R01), Theorem G (R03), the third Check of 4.6 (R05) and
    "None at present" (R07);
  - R04 (`BO`) is repaired as it asked, but the repair now collides with an open revision of
    TopologicalKTheory (R01 below);
  - the two findings about the pull request description are not repaired (R02, R04 below).

Blocking findings:

- **R01 (P2).** The new comparison of `Ω₇` with `ℤ × BO` is also claimed by TopologicalKTheory's
  revision (#1807). That revision makes TopologicalKTheory consume 4.2a–4.2c, while this head
  makes 4.2c consume TopologicalKTheory: the two roadmaps would supply each other.
- **R02 (P2, re-raised).** Main's DGFloer still owns Theorem B and all of §§6.3–6.4 and §7, and
  two AlgebraicTopology revisions claim 1.0. The merge order against them is still not stated.

Source ids: `bdho-cotangent` is arXiv:2404.07953v3; its printed page is the footer at the end of
each page. `css-derivative` is arXiv:2012.13634v1, and `eschenburg-hanke-bott` is
arXiv:1610.04385.

## R01 (P2) — TopologicalKTheory and this roadmap would supply each other; `Ω₇ ≃ ℤ × BO` has two owners

**Location.**

- README 4.2c, lines 1501–1503: "Prove that `Ω₇` is homotopy equivalent to `ℤ × BO`, with `BO`
  TopologicalKTheory T1.6a's stable real Grassmannian, by an equivalence that carries the component
  of index `d` to `{d} × BO`."
- The same supply appears in:
  - the Scope row (line 101) and the supplier contract (lines 410–416);
  - How to read the build (lines 448–449) and Owned here (line 73);
  - 4.2c's *Needs:* (line 1535), the `m = 1` Check (lines 1558–1563) and Layer 4's Dependencies
    (line 1873).

**Claim.** TopologicalKTheory T1.6a and T1.6d supply 4.2c, and 4.2c owns the comparison of `Ω₇`
with `ℤ × BO`.

**Witness.** TopologicalKTheory at #1807 (3adc047):

- line 191 lists "DGFloerPartII 4.2a–4.2c" as a supplier;
- T1.6a (line 499) takes 4.2a's stable `O` for `ΩBO ≃ O`;
- T1.6d (lines 822–839) proves "Ω₇≃ℤ×BO carries the component of index d to {d}×BO".

**Why it matters.**

- T1.6d gives the same proof as 4.2c: it compares with 4.2b's stages and connects the two
  stabilizations by a path in `SO(2n+2)`.
- T7 (lines 1505–1537) also consumes 4.2a–4.2c.
- Once both pull requests merge, the edges run both ways between the two roadmaps.
- The dependency check reads main, where TopologicalKTheory does not yet cite this roadmap, so it
  reports nothing.

**Repair.** Keep a single direction of supply.

TopologicalKTheory's use of 4.2a–4.2c is substantive: stable `O` for `ΩBO ≃ O`, and the Bott
equivalences for `KO` periodicity. This roadmap uses TopologicalKTheory only to name `Ω₇`. So cut
the supply here:

- **4.2c.**
  - Delete lines 1501–1511, keeping the `BSp` question for R03.
  - In "The eight equivalences" drop "`ℤ × BO` read through the comparison above" and write
    `Ω₇ ≃ Ω(U/O)` and `O ≃ Ω(Ω₇)`, with `Ω₇` the Grassmannian colimit of the stable-members
    bullet (line 1498).
- **Remove the TopologicalKTheory supply everywhere else.**
  - Delete the Scope row (line 101) and the contract (lines 410–416).
  - Delete the clause at lines 448–449 and "the comparison of the Grassmannian member of the chain
    with `ℤ × BO`" (line 73).
  - Delete "TopologicalKTheory T1.6a and T1.6d (…)" at lines 1535 and 1873.
- **The `m = 1` Check.** Keep the labels `d = −1, 0, 1`, `J₇ ∈ d = 0` and the rank-label sentence;
  drop the T1.6d and `{0} × BO` clauses.
- **Downstream consumers.** "TopologicalKTheory consumes 4.2a–4.2c: the stable `O` for its loop
  comparison `ΩBO ≃ O` (T1.6a), the Grassmannian member `Ω₇` and its stabilization for its
  comparison with `ℤ × BO` (T1.6d), and the Bott equivalences for `KO` periodicity (T7)."
- **The description's merge-order paragraph.** Place #1807 after this pull request.

The other direction would need #1807 to drop every citation of this roadmap. TopologicalKTheory
would then have no consumable owner of stable `O` and real Bott periodicity. This supersedes the
second option of the previous review's R04, which was written before #1807 claimed the comparison.

**Tested.**

- After these edits, `TopologicalKTheory` and `BO` remain only in Downstream consumers.
- No other target uses `BO`: Lemma 6.35's stable term is `π_(n−1)(O)` from 4.2c's stable groups
  (line 1593).
- 4.2c still gives `O ≃ Ω⁸O` through `Ω₇` as the colimit of `⊔_p G_p(ℝ^(2m))`. At `m = 1` that
  stage is a point, a circle and a point, with `d = −1, 0, 1`.

## R02 (P2) — Re-raised: main's DGFloer and two AlgebraicTopology revisions own this material; the order is not stated

This re-raises R02 of the review at 4e506b6, which carried the finding from earlier rounds. No
repair report gives a reason for leaving it.

**Location.**

- README lines 41–43: "The base roadmap, cited as **DGFloer** by layer and item, owns every other
  numbered statement of the source".
- 1.0 (lines 461–581).
- The description's merge-order paragraph, which ends "#1742 (GeneralAlgebraicKTheoryPartII) →
  **this pull request** (#1799)".

**Claim.** This roadmap is the only owner of Theorem B, §§6.3–6.4, §7 and 1.0's convenient
category.

**Witness.**

- Main's `TauCetiRoadmap/DGFloer/README.md` still owns:
  - Layer 1 items 7–8 (lines 834 and 841);
  - Layer 5 item 7 (line 1053);
  - Theorem B, in Layer 10 item 5 (line 1562);
  - all of Layer 11 (line 1577).
- DGFloer #1798 (63e59c6) moves them here (its lines 50–54).
- AlgebraicTopology #1663 (a67088d, lines 134–140) and #1652 (1f5b3f6, line 137) each call
  themselves "the single owner" of 1.0's coreflection, products, exponential law and pointed
  suspension–loop adjunction.

**Repair.**

- **DGFloer.** In the description's merge-order paragraph, put #1798 (DGFloer) before this pull
  request. The README needs no change. Every DGFloer id it cites resolves both on main and at
  #1798, for instance:
  - Layer 4 item 5 is #1798's §4.1 (line 1682);
  - Layer 10 items 2–5 are §§10.2–10.5 (lines 3874–3987);
  - Layer 11 is §§11.1–11.3 (lines 4116–4213).
- **AlgebraicTopology.** In the same paragraph, say whether this pull request or AlgebraicTopology
  #1652/#1663 merges first. If AlgebraicTopology merges first:
  - cut 1.0's coreflection, convenient products, exponential law and pointed smash and
    suspension–loop constructions to a citation of its Stage 4 item 8;
  - keep in 1.0 only the sequential-colimit bullet and the raw-quotient comparison.

**Tested.** With #1798 first, main's DGFloer owns none of 1.3, 1.4, Layer 2, 3.2 or Layer 4 when
this pull request merges. Every citation listed above resolves at both heads.

## R03 (P3) — 4.2c claims to own `BSp`, which main's GeneralizedCohomology already has

**Location.**

- README line 1512: "`BSp` has no counterpart in TopologicalKTheory and is this roadmap's."
- Owned here, lines 73–74: "the stable quaternionic Grassmannian `BSp`".

**Claim.** No roadmap on main has the stable quaternionic Grassmannian.

**Witness.** Main's `TauCetiRoadmap/GeneralizedCohomology/README.md`:

- G4.0a (lines 998–1000) builds `quaternionicUniversalBundle r` on the fixed-rank quaternionic
  Grassmannian, with its Schubert CW structure and its colimit comparison;
- G4 item 5 (line 1353) proves `H*(BSp;Z)=Z[a_1,a_2,…]` "via the designated inclusions".

**Repair.** Do as in R01:

- in 4.2c write `Ω₃ ≅ colim_m ⊔_(0≤p≤4m) G_p(ℍ^(4m))`, with index `d = p − 2m`;
- replace `ℤ × BSp` by `Ω₃` in the eight equivalences;
- delete line 1512, and delete "the stable quaternionic Grassmannian `BSp`" from Owned here.

If the name `BSp` is kept, add a target instead:

- the comparison of the `d = 0` colimit `colim_m G_(2m)(ℍ^(4m))` with the colimit of G4.0a's
  fixed-rank Grassmannians, by the stabilization argument of 4.2c inside `Sp(4m + 4)`;
- a Scope row for it, and G4.0a and G4 item 5 in 4.2c's *Needs:*.

**Tested.** For `m = 1`, `Ω₃(16) ≅ ⊔_(p=0..4) G_p(ℍ⁴)`, with `d = −2, …, 2`, and `J₃` lies in the
middle `G₂(ℍ⁴)`. The stabilization `G_p(ℍ^(4m)) → G_(p+2)(ℍ^(4m+4))` of 4.2b preserves `d`. Nothing
outside 4.2c uses `BSp`.

## R04 (P3) — Re-raised: the pull request description is stale

This re-raises R06 of the review at 4e506b6. No repair report gives a reason for leaving it.

**Location.** The description says:

- "`Suggested.lean` states the rotation family at a fixed pole, the low-rank values of
  `π_(n−1)(SO(n))` and its torsion for odd `n`";
- "HomotopySpheres' James construction and Bott periodicity";
- "compares the base's raw mapping-space carriers with HomotopySpheres' convenient ones";
- "TangentialBordism's compact-image embedding".

**Claim.** The description describes this head.

**Witness.**

- `Suggested.lean` states no rotation family. It does state Theorems B and G and the capacity
  theorems, which the description omits.
- The README cites no HomotopySpheres. It takes the James construction from
  GeneralAlgebraicKTheoryPartII §4.30b (line 348) and owns Bott periodicity (4.2a–4.2c).
- 3.1 uses TangentialBordism B5 and B6.3 (line 1102).

**Repair.**

- Regenerate the description's summary and its last paragraph from the README Summary (lines 3–26)
  and the module docstring (`Suggested.lean` lines 23–71).
- Include the merge-order statements of R01 and R02.

## R05 (P3) — Process residue in 4.6's last Check

**Location.** README lines 1857–1858: "The three theorems have different ranges; a Check claiming
that Theorem B's hypothesis on `Q` fails here would be false."

**Claim.** The README is timeless.

**Witness.** No Check of this README makes that claim; the sentence refers to an earlier version of
the Check. That is the process narrative the house style rules out.

**Repair.** Replace the clause after the semicolon with a mathematical negative control: "reading
rational essentiality as `π_ℓ(Q) ⊗ ℚ = 0` for `ℓ ≥ 2` would wrongly place `Q` outside Theorem B's
hypothesis."

**Tested.** On `T⁸ # (S³ × S⁵)`:

- the collapse to `T⁸` has degree `1`, so `Q` is rationally essential;
- `π₃(Q) ⊗ ℚ ≠ 0` (the lifts of `S³ × {q}` in the 2-connected universal cover).

So the two notions differ.

## Previous findings

| Finding at 4e506b6 | Status at aeddaae |
| --- | --- |
| R01 (P1), the factor 2 | **Repaired.** 2.6 (line 1054) has "`β_*(σ_p)_*[Σ_p] = ±g` in degree `2d` for `CPᵈ` and … `= ±2g` in degree `4d + 2` for `HPᵈ`". 1.4 (lines 779–794) states `deg τ = ±(1 + (−1)ⁿ)`. 4.2 (line 1247) has `deg(τ)·x·x̄ = ∓2x²`. 4.5 (line 1729), the 2.6 Checks (1061–1073), the 4.5 Check (1770–1772) and Worked example 4 (1906) agree. The values are recomputed in the table below |
| R02 (P2), the order against DGFloer and AlgebraicTopology | **Not repaired.** Re-raised as R02 |
| R03 (P2), Theorem G statable | **Repaired.** `hasContractibleAlmostExistence_of_knottedSphere` (`Suggested.lean` line 340), named in README 4.6 (lines 1807–1825) and the docstring (lines 50–54) |
| R04 (P3), `BO` without comparison | **Repaired as asked** (lines 1501–1512, Scope row 101). Superseded by R01 because of #1807. The `BSp` half is R03 |
| R05 (P3), 4.6 third Check | **Repaired** (lines 1850–1858), with the residue noted in R05 |
| R06 (P3), stale description | **Not repaired.** Re-raised as R04 |
| R07 (P3), "None at present" | **Repaired.** Line 1889 reads "None. The base roadmap consumes nothing from this one." |

## Verified sound

**Gate and build.**

- The worker's gate: every scanner is 0, including `build`, `depcheck`, `outside-folder` and
  `stray-files`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- The branch pins equal main's: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9.
- The dependency check on this head:

      depcheck: 238 roadmaps, 2349 edges, 0 problem(s)

  In the merge order, TangentialBordism is line 14, GeneralAlgebraicKTheoryPartII line 330 and
  DGFloerPartII line 331. Every other supplier is on main.
- `lake env lean` on `Suggested.lean` gives 23 "declaration uses `sorry`" warnings, at lines 91,
  100, 117, 138, 153, 171, 201, 214, 253, 260, 267, 273, 280, 286, 294, 297, 300, 304, 308, 312,
  316, 323 and 340. There is no error.

**Form of `Suggested.lean`.**

- `public import Mathlib` plus twelve `TauCeti.*` modules, all present at the pin.
- One module docstring and `namespace TauCetiRoadmap.DGFloerPartII`.
- `theorem` only; no `set_option`, `#eval` or sorry'd data.
- `SO`, `soBlockInclusion` and the real-scalars instance have real bodies, and
  `soBlockInclusion_one` is proved.
- No section `variable`.

**Signatures.** A scratch copy ran `#check @` on all 27 declarations; each elaborated type matches
its README sentence. Theorem G elaborates with:

- `k ≥ 2`, and `finrank F′ + k = finrank E`;
- `range s ∩ range y = {y b}` and `s a = y b`;
- `s.tangentRange a ⊔ y.tangentRange b = ⊤`;
- `PathConnectedSpace Y`, with `π_(i+1)(Y, b)` subsingleton for `i + 1 ≤ ℓ`;
- `∃ e : Trivialization (EuclideanSpace ℝ (Fin k)) …` that is linear with base set `univ`;
- `g_*[S] = d • [Y]` with `d ≠ 0`, and `F ∘ φ < c`.

No declaration has lost a binder.

**Padding probe.** Every `sorry` in a scratch copy was replaced by
`first | infer_instance | rfl | simp | decide`. All 23 goals fail, so none is padding.

**Library declarations opened at the pin** (Tau Ceti):

- `HasContractibleAlmostExistence` (`Hamiltonian/AlmostExistence.lean:167`): for some `ε > 0`,
  almost every regular level in `(c − ε, c + ε)` carries a closed characteristic contractible
  in `W`.
- `SmoothEmbedding` (`SmoothEmbedding/Basic.lean:75`) and `instTopologicalSpaceNormalBundle`
  (`NormalSpace/Topology.lean:70`).
- `normalSpaceTrivializationOfComplement` (`NormalSpace/Trivialization.lean:304`) is only local,
  so a global linear `Trivialization` with base set `univ` is the right triviality hypothesis.

**Cross-roadmap citations resolved.**

- **DGFloer.** On main: Layer 1 items 1–6 (lines 462–832), Layer 2 items 1–3 (848–891), Layer 4
  item 5 (1004), Layer 5 items 1–6 (1018–1042), Layer 6 items 3–5 (1085–1107), Layer 10 items 1–5
  (1549–1562) and Layer 11 (1577). At #1798: the same ids as §§1.1–1.6, 4.1, 5.1–5.6, 6.3–6.5,
  10.1–10.5 and 11.1–11.3.
- **TangentialBordism** at #942 (ef08ea4): B5.1 (line 1259), B5.5 (1607) and B6.3 = §10.1 (2656),
  the rational SO surjection with geometric preimages.
- **GeneralAlgebraicKTheoryPartII** at #1742 (3f10248): §4.30b (line 1208), with the James map,
  the James equivalence for connected `W` and the flat-coefficient Bott–Samelson theorem
  (line 1226).
- **TopologicalKTheory** on main:
  - T1.6a (lines 394, 526–559): `BO` as the rank-colimit in `CompactlyGenerated`, based at the
    rank-0 point;
  - T1.6d (721–731): the homogeneous tower, labels `k − n`, the added-first-line stabilization.
- **On main, all other suppliers:**
  - GeneralizedCohomology: G2 item 10 (line 533), G4.0a (940), G4.0b (1082), G4 items 1–5
    (1199–1246) and G5 item 2 (1523).
  - AlgebraicTopology: `cofibrationTowerHomotopyEquivalence` (line 683) and 8.11a (1949).
  - SmoothBundlesConnections: B1.4, B2.2, B2.5, B6.2 and B6.3 (lines 421, 605, 802, 1668, 1716).
  - ComplexKahlerGeometry: K7.1 (line 1407).
  - RiemannianGeometry: R1–R3 (lines 179, 300, 347).
  - MorseTheory: M5 (line 857).
  - GeometricTopology: Layers 1 and 3 (lines 177, 357).
  - LieGroups: Layer 2 (line 356).

**Seeded source sample.**

| Target | Locator checked | Result |
| --- | --- | --- |
| 1.1 | no source claim; DGFloer Layer 2 items 1–3, GeneralizedCohomology G2.10 | resolve as stated |
| 1.3 | Prop 6.38 proof, `bdho-cotangent` lines 5221–5227: homogeneous metric, frame `(v, Iv)`, totally geodesic `S²` | as stated |
| 2.1 | `HPᵈ` index `2(k−1)(2n+1)+3` at lines 5285–5286 (Ziller Thm 3); `CPᵈ` index 1 at line 5239 | as stated; the general-`k` `CPᵈ` formula is the README's, recomputed below |
| 2.3 | Prop 6.39 proof, lines 5276–5302: Morse–Bott, completing manifold, `H_(4n+2) ≅ ℤ` | as stated |
| 2.4 | the roadmap's own construction; DGFloer §4.1 and Layer 5 item 4 | no source claim; the Checks were recomputed |
| 2.5 | the roadmap's own construction | bidegrees recomputed below |
| 3.1 | Thm 5.14 proof, lines 4273–4279: Thom II.29, `N·α = φ_*[S]`, `d = Nb` | as stated |
| 3.3 | Cor D, lines 265–292 (`Ψ(p,q) = (p + σ(q), q)`); Cor E, lines 304–317 | as stated, with the base's sign convention |
| 4.1 | Def 1.7 and Thm H (lines 415–426); Def 6.11 and Thm 6.12 (4517, 4525) | as stated |
| 4.2 | Ex 6.16 (4645–4680); Props 6.17–6.18 (4681–4791, `τ` of degree ±2, `x̄ = −x`); Remark 6.19 (4792–4796); footnote 16 (4802–4803) | as stated, the factor 2 now on the right families |
| 4.2a | Steenrod §7, Hatcher §4.2 (not fetched); Check value `π₈(SO(9))` from `css-derivative` lines 221–222, 249 | the ranges were recomputed; the Check is as stated |
| 4.2c | Eschenburg–Hanke §4, Thm 4 and proof (lines 299–408) | as stated; the explicit bounds are the README's, recomputed below |
| 4.4 | Prop 6.36 proof ending at line 5200; Ex 6.37 (5201–5210) | as stated, with the orientation twist the source omits |
| 4.5 | Thm I (430–445); Prop 6.38 (5218–5243); Prop 6.39 (5247–5311) | as stated; the source's `CPᵈ` "twice" corrected (source issue) |
| 4.6 | §7 preamble (5354–5364); Thm 7.1 (5366–5372); Ex 7.4 (5382–5396); Prop 7.5 and the kernel bound (5404–5423) | as stated; the Lean statement matches the hypotheses |

**Adversarial table.** All values were computed in this review.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 2.6, `CPᵈ` class | `CP¹`; `d = 2` | one frame `(u, Iu)` per `u`; fibre map `θ ↦ γ_(Iu)(θ)` of degree 1; `dim Σ_p × S¹ = 2d = dim Z_p` (2, 4) | `±g` (`= ±x²` for `d = 1`, as 4.4 and Remark 6.19) | none |
| 2.6, `HPᵈ` class | `d = 1, 2` | fibre `S² × S¹ → S³`; the involution `(v,θ) ↦ (−v, 2π−θ)` has degree `(−1)(−1) = +1`, so degree 2; `dim = 4d + 2` = 6, 10 | `±2g` (source 5306–5310) | none |
| 1.4, `deg τ_u = 1 + (−1)ⁿ` | `n = 2, 3, 4` | involution degree `(−1)ⁿ` = +1, −1, +1; `deg τ_u` = 2, 0, 2; `n = 2` signed count `(+1)(+1) + (−1)(−1) = 2`; one component of `T¹S¹` gives 1 | as stated | none |
| 1.4, rotation family | `n = 1, 2, 3` | `1 + (−1)^(n−1)` = 2, 0, 2; `H₂(SO(3)) = 0`; `H₃(SO(4)) = ℤ²` | as stated (5131–5135) | none |
| 4.2, Prop 6.17 | `n = 2, 4` | `deg τ = ±2`, `x̄ = −x`, so `β_* = ∓2x²`; one component of `O(2)`: `±x²` | as stated | none |
| Theorem G (Lean), satisfiable | `T⁸ # (S³ × S⁵)`, `k = 3` | `ℓ = k − 1 = 2`; `S⁵` is 4-connected; `dim Y = 5 = n − k`; single transverse point; trivial normal bundle | hypotheses hold | none |
| Theorem G, `k = n` | `Y = pt` | `tangentRange` sum `⊤ ⊔ ⊥ = ⊤`; `[pt]` generates `H₀`, so `d ≠ 0` forces `S ≠ ∅`; `X` is a component `≅ Sⁿ`, `n ≥ 2`, abundant, so `c°_HZ` of a domain in `T*Sⁿ` is finite | conclusion true | none |
| Theorem G, `d ≠ 0` | `Q = T⁶ ⊔ (S² × S⁴)`, `S = ∅`, `F = |ξ|²` and `|ξ|² + 2`, `c = 1` | `g_*[∅] = 0 = 0·[Y]`; levels near 1 are flat cosphere bundles of `T⁶`; closed geodesics are noncontractible | the conclusion fails at `d = 0`, so `hd` is needed | none |
| Theorem G, `ℓ` and bounds | `k = 2, 3, 4` | `ℓ` = 2, 2, 6; `n − k ≥ ℓ + 1` gives `n` ≥ 5, 6, 11 | matches source 5362–5364 | none |
| Theorem G, disconnected `Q` | `Q₁ ⊔ Q₂` | `F|T*Q₁` keeps compact sublevels and regular `c`; a characteristic contractible in `T*Q₁` is contractible in `T*Q` | reduces to `Q₁` | none |
| 4.2c, `Ω₇` vs T1.6d | `m = 1` | stage `G₀ ⊔ G₁ ⊔ G₂(ℝ²)`, labels −1, 0, 1; the stabilizations differ by `g ∈ O(2m+2)`, with `det g = +1` after flipping the free `e_last` | mathematically sound; owned twice | R01 |
| 4.2c, `BSp` | GeneralizedCohomology G4.0a and G4.5 | fixed-rank `Gr_r(ℍ^∞)` and the stable ring `H*(BSp)` on main | ownership | R03 |
| 4.2c index bounds | `n = 16m` | `n/m_(k+1) − 1` = `8m−1, 4m−1, 2m−1, 2m−1, 2m−1, m−1`; `k = 2, 6`: `2p ≥ s + c`, so `(n/m_k − |c|)/4`, with `w = c`, `2c` | as stated | none |
| `m_j` | `j = 0..8` | `Cl_(0,j)` = `ℝ, ℂ, ℍ, ℍ², M₂(ℍ), M₄(ℂ), M₈(ℝ), M₈(ℝ)², M₁₆(ℝ)`, giving `1, 2, 4, 4, 8, 8, 8, 8, 16` | as stated | none |
| Stable groups | `i = 1..8` | `ℤ/2, 0, ℤ, 0, 0, 0, ℤ, ℤ/2`; `π₁(U/Sp) = π₁(U) = ℤ` | as stated | none |
| Lean Bott ranges | the smallest `m` per class | `j + 11 ≤ m ⇔ m ≥ (i+8)+2`; `π₂(SO 4) = 0`, `π₁(SO 3) = ℤ/2`, `π₃(SO 5) = ℤ`, `π₉(SO 11) = ℤ/2`; sharpness `π₃(SO 4) = ℤ²` | true; the bounds are needed | none |
| Lemma 6.35 (Lean) | `n = 3..15`; `n = 4` | 0, `ℤ/2`, 0, `(ℤ/2)²`, `ℤ/2`, `ℤ/2`, `ℤ/2`; `π₃(SO 4) = ℤ²` is not torsion, so `Odd` is needed | as stated | none |
| 4.3 splitting below range | `n = 3, 7` | `0 ⊕ ℤ/2` (`χ(S⁴) = χ(S⁸) = 2`) against `π₂(SO 3) = π₆(SO 7) = 0` | the Check holds | none |
| 2.1 indices | `CP²`, `k = 2`; `HP¹` | `3 + 2 = 5 = 2·2·1 + 1`; `3(2k−1) = 6k − 3` | as stated | none |
| 2.2 / 2.3 degrees | `CP²`; `HP²` | 0, 1, 4, 5, 8, 9 `= H_*(S¹ × ΩS⁵)`; 3, 10, 13, 20 with gap 3 | as stated | none |
| 2.5 bidegrees | `CPᵈ`, `HPᵈ` | `d_(2d): E_(2d,1) → E_(2d−2d, 1+2d−1) = E_(0,2d)`; `d_(4d): E_(4d,3) → E_(0,4d+2)`; `H_(2d+1)(CPᵈ) = 0` | as stated | none |
| Theorem B route | Thm 5.10, condition 2 | an element of infinite order in `π_ℓ` is not `dᵐ`-torsion for any `m` (4143–4147) | as stated | none |
| Theorem B (Lean) | `T^r`; `ℝP³`; `U = ∅`; `S² ⊔ T²` | `hQ` false; `π₃ = ℤ`; `H_n(∅) = 0`; connectedness needed | true where it should apply | none |
| 3.3 sign | `T*ℝ²`, `σ = q₁dq₂` | `−d(p₁dq₁ + (p₂−q₁)dq₂) = ω + dq₁∧dq₂` | as stated | none |
| 4.2a ranges | `U(r)`, `Sp(r)` | `i ≤ 2r − 1`, `i ≤ 4r + 1`; `π_i(Sp) = π_i(S³)` for `i ≤ 5` | as stated | none |
| 1.3 quaternion Check | `v = (1, j)`, `λ = i` | `vλ = (i, −k)`; `iv = (i, k)` | as stated | none |
| 1.0 product Check | `X = ℝ/ℤ₊`, `ℚ` | `X ×_k ℚ` is the quotient of metrizable `ℝ × ℚ`, strictly finer than the product | as stated | none |
| Capacity theorems (Lean) | `CP⁰`; `S¹`; `ℓ = 0`; `T^r` | capacity 0; `n ≥ 2`; `A = 0`; `¬IsAspherical` false | true | none |

**Headline theorems.**

| Headline | In `Suggested.lean` |
| --- | --- |
| Theorem B (3.2) | stated, line 117 |
| Corollaries D and E (3.3) | transports of Theorem B, not separate headlines |
| Theorem H (4.1) | not statable (no evaluation shriek at the pins); docstring lines 58–61 |
| Theorem I: spheres, Lie groups, covered manifolds, `CPᵈ`, `HPᵈ` | stated, lines 138, 153, 171, 201, 214 |
| Theorem I: fibered families, sphere bundles, products; Proposition 6.36 | not statable; docstring lines 62–66 |
| Theorem G (4.6) | stated, line 340 |
| Finite-to-stable range and Bott periodicity | stated in finite rank, lines 253–288; stable `O` is not at the pins (docstring lines 67–71) |
| Lemma 6.35 | stated, lines 294–324 |
| 1.0's convenient category | stated, lines 91, 100 |

**Ownership.** Searched by object in the roadmaps on main, the board packages and the open roadmap
pull requests (`roadmaps grep`).

- **This roadmap is the admissible owner of:**
  - 1.0. Main's AlgebraicTopology hands it to HomotopySpheres, a forbidden supplier. The two
    AlgebraicTopology revisions are R02.
  - Stable `O` and real Bott periodicity. Main's TopologicalKTheory and DGFloer assign them to
    HomotopySpheres, which builds them too (#1287 §§4A–4B, lines 1435 and 1666). Being a forbidden
    supplier, that overlap is a matter for the operator.
- **Conflicts:**
  - TopologicalKTheory #1807: R01.
  - `BSp` on main: R03.
- **Not checked:** the AlgebraicTopology pull requests #1797, #1808 and #1854 were checked only
  through `roadmaps grep`, which shows no DGFloerPartII citation in them.

## Not verifiable

- **Paywalled; not fetched:**
  - W. Ziller, Invent. Math. 41 (1977), Theorems 3 and 8. The indices were recomputed, and
    `bdho-cotangent` line 5285 restates the `HPᵈ` case.
  - R. Bott, Ann. of Math. 70 (1959).
  - J. Milnor, *Morse Theory*, §§22–24. The index argument was checked against Eschenburg–Hanke,
    Theorem 4.
  - BDHO, *Morse homology with DG coefficients* (Birkhäuser, 2025).
  - Thom (1954); Japanese Encyclopedia of Mathematics (Jap87).
- **Not fetched in this review; the facts used were checked directly:**
  - Hatcher, *Algebraic Topology* (Theorem 3.26, §4.2, §4.J, A.6), which the author distributes;
  - Steenrod Part I §7; Milnor–Stasheff Ch. 5; Pontryagin Ch. II; Munkres §22.

## Source issues

- **Error** in bdho-cotangent at proof of Proposition 6.38, printed page 120: the source says the `CPⁿ` sphere family gives twice a generator of `H_(2n)(ΩCPⁿ)`; it should be ± a generator, since `T¹_pCPⁿ` carries one frame `(v, Iv)` per direction (Remark 6.19 for `n = 1`); affects nothing.
- **Error** in bdho-cotangent at proof of Lemma 6.35, printed page 117: the source reads `π₈(SO(9))` as cyclic of order four; it should be `ℤ/2 ⊕ ℤ/2` (stabilization split with kernel `ℤ/2`, Crowley–Schick–Steimle); affects nothing.
- **Misprint** in bdho-cotangent at second proof of Proposition 6.34, printed page 117: the source concludes with Proposition 6.29 after showing `Sⁿ` is 2-covered; it should cite Proposition 6.33; affects nothing.
- **Gap** in bdho-cotangent at §7 preamble before Theorem 7.1, printed page 123: the source derives `n ≥ 3k − 1` or `n ≥ 2k` from the connectivity of `Y`; it should assume `dim Y > 0`, since `k = n` with `Y` a point meets the hypotheses; affects nothing.
- **Gap** in bdho-cotangent at Proposition 6.36, printed page 119: the source concludes abundance for every `G/H` with closed `H` of positive dimension; Definition 6.11 needs `Q` oriented, so nonorientable quotients need the orientation twist; affects a stated result.
- **Misprint** in arXiv:1610.04385 (Eschenburg–Hanke) at proof of Theorem 4, printed page 9: the source calls each minimal subspace an irreducible module over the Clifford algebra on `k` generators; it should be `k + 1`, since `J_(k+1) = J_kJ′` is the extra generator; affects nothing.
- **Misprint** in arXiv:1610.04385 (Eschenburg–Hanke) at proof of Theorem 4, Case 2, printed page 10: the source derives `p + q ≥ r` from `|a_j| ≥ 0`; it should be `|a_j| ≥ 1`, since every `a_j` is an odd integer; affects nothing.

# Review of TangentialBordism (pull request #942 at 7022ba9)

**Verdict:** needs changes

Incremental re-review of the 112 lines changed since 993f5f4 (108 in `README.md`, 4 in `Suggested.lean`, nothing outside the folder). Five of the previous review's six findings are repaired and the repairs introduce no new problem. The one that remains is description-only: the pull-request description still names the closed #1663 and omits #886, whose DifferentialGeometry 5.5b the README cites. The gate, the dependency check, the elaboration and the padding probe pass.

## R01 (P3) — The description's dependency paragraphs still miss #886 and list the closed #1663

**Location.** The pull-request description: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652"; the "Depends on" list and the merge-order chain name "#1663 AlgebraicTopology". The README cites DifferentialGeometry 5.5b at `TauCetiRoadmap/TangentialBordism/README.md:84`, `:323`, `:505`, `:624` and `:850`, and GeometricTopology 1.1, 4.3.1 and 11.3 at `:325`, `:337`, `:374`.

**Claim.** The description names every open revision whose numbering the README cites, and only open ones.

**Witness.** DifferentialGeometry on main contains "5.5b" 0 times; #886 (head b5e32fc) defines it at `README.md:38` and `:87`, and `scratch/overlaps.md` reports the same lead. `roadmaps list` has no #1663 (AlgebraicTopology 8.13 is at #1652 `README.md:3702`). GeometricTopology 1.1, 4.3.1 and 11.3 are absent on main and exist at #903 (head 5859c0d, `:2430` for 4.3.1), which the description names only in its Arf paragraph.

**Repair.** No README change. In the description: write the revision paragraph as "#886 (DifferentialGeometry 5.5b), #903 (GeometricTopology 1.1, 4.3.1, 11.3), #1652 (AlgebraicTopology Layers 2, 4, 6, 8 and 8.13)"; add #886 and #903 to "Depends on"; remove #1663 from "Depends on" and from the merge-order chain. This carries the previous review's R04 and, before it, R02 of the review at ~20.

## Previous findings (~21)

- R01 — repaired: `README.md:507–508` now reads "if M is such a source and is Lindelöf (second countable in particular)"; the route at `:514–523` works chartwise on S, and a new Check at `:612` gives ℝ_δ (bad set ℝ, not null) against ℤ (bad set ℤ, null).
- R02 — repaired: `README.md:2769` adds "Corollaire III.7 (integral, degree six), p.62"; the References entry at `:3146` lists it; the AHSS sentence now claims only the extension to pairs and arbitrary CW targets.
- R03 — repaired: `README.md:1028` cites Freed, Lecture 12, p.103 (any stable tangential structure) and Miller, Chapter 1, §4, Theorem 4.2 with the remark after it, p.10 (unoriented, through MO); both References entries updated.
- R04 — not repaired: the description is unchanged ("which merge first: #1652"; "#1663 AlgebraicTopology" in both lists). Written again as R01.
- R05 — repaired: "gap:" occurs 0 times in the folder; `:337` reads "What is consumed from GeometricTopology Layer 4.3.1"; `:99`, `:355`, `:374`, `:394`, `:403`, `:2274`, `:2278`, `:2301` and `Suggested.lean:25–26` cite the section.
- R06 — repaired: `:36–45` and `:3121–3140` now say F2 and F6 consume the B4/B5.4 items, F3–F5 build on F2, and give the S2.2 → S2.1 → E5 chain with the reason it carries no BordismFormalGroups input.

## Verified sound

### Gate, dependency check, elaboration and probes

- **Gate**, rerun with `--base origin/main` at 7022ba9:

  ```text
  gate TangentialBordism: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

- **Dependency check** (`--movable`): `depcheck: 237 roadmaps, 2309 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 15 s with exactly six `sorry` warnings (`:70`, `:90`, `:108`, `:124`, `:153`, `:171`). The 4-line change is in the module docstring only; the seven elaborated types in `scratch/signatures.md` are those of the previous review (the "structure `,`" entry is the docstring phrase at `:151`, not a declaration), so the padding probe and the `#check` comparison of ~21 stand.
- **Policy scan of the changed lines.** No process words, pull-request numbers, LaTeX or local paths; the gap slug is gone from README and Lean.

### The changed passages

| Passage | What was checked | Result |
| --- | --- | --- |
| 2.6 parametric transversality (`:507–523`) | `TauCeti.IsNullSet` at the pin (`Geometry/Manifold/Measure.lean:36`) is "for every x, the image under `extChartAt I x` of s∩source has Haar measure 0": tested in the preferred chart at each point, as `:521` says. For Lindelöf M with second-countable chart domains, M and each open face stratum are second countable; for a chart source S₀ of S (open in S, boundaryless, second countable), F⁻¹(Z)∩(stratum×S₀) is a boundaryless second-countable, hence Lindelöf, manifold, so the stated Sard theorem (`Suggested.lean:90`, `[LindelofSpace M]`, arbitrary target model) applies to its projection to S₀. The bad parameters are the critical values of that projection (Guillemin–Pollack's lemma), which the previous review's route already used. | Pass |
| 2.6 new Check (`:612`) | ℝ_δ: ∂_sF=1 so F⋔Z; slice derivative 0 and F(s,s)=0, bad set ℝ, measure ∞. ℤ: bad set ℤ, countable, Lebesgue-null. | Pass |
| 3.3 locators (`:1028`) | `freedBordism` 4243–4246 (Ω_•(X) satisfies all homology axioms except the coefficients; a variation for every stable tangential structure; folio 103 at 4247). `c70bf1f2` 392–409 (Theorem 4.2, G. W. Whitehead, spectrum homology theory; "thus N_*(−) is a homology theory"; printed p.10 at 388): deduced through MO, as `:1028` says. | Pass |
| 10.1 locators (`:2766–2775`, `:3146`) | `thom1954` 1911–1913: Corollaire III.7, every integral homology class of dimension 6 of a finite polyhedron is the image of the fundamental class of a compact differentiable manifold; folio 62 at 1944. III.3 (degree ≤5) and III.7 (degree 6) together give Thom's integral range 0≤n≤6 for finite polyhedra, which is what `:2772` now claims. | Pass |
| 1.1 and the contract (`:99`, `:337–350`, `:374–403`) | GeometricTopology #903 (5859c0d) `README.md:2430–2443`: native `QuadraticForm (ZMod 2) V`, nondegenerate polar form, dim V=2m with m=0 included, Arf by symplectic basis, basis independence, isometry invariance, orthogonal-sum additivity, plane decomposition, classification, Gauss sum (−1)^Arf·2^m, zero count 2^(2m−1)+(−1)^Arf·2^(m−1) for m≥1 and 1 for m=0, Arf=0 iff a half-dimensional q-zero subspace. Every item of the contract at `:337–350` is there; `:8024` lists TangentialBordism as a consumer of 4.3.1. | Pass |
| Layering (`:36–45`, `:3121–3140`) | BordismFormalGroups main: F2 consumes TB B4.2 (`:172`, `:241`), B4's MO coefficients (`:272`), B5.4's MU comparison (`:188`); F6.3 consumes "TB's mod-p Steenrod/Adams carriers" (`:1006`); F4 states TB's Adams tower "is not duplicated here" (`:463`); the order paragraph `:2759–2761` has F2 supplying F3, and F4 and F5 building on F3. StringOrientation #948 (07f0981): S2.2's route `:551–560` (tubular neighbourhood from GeometricTopology Layer 1, Thom transversality, G5 diagrams, G5.3), its *Needs:* `:603` lists S2.1; S2.1 `:533–535` takes from E5 MString, its comparison with G5.3's sequential Thom spectrum and the E∞ map MString→MSpin, *Needs:* `:549` "EllipticCohomology E5"; S2.3 *Needs:* `:661–662` "EllipticCohomology E4.S and E5"; S5.3 *Needs:* `:1199` "BordismFormalGroups F3–F5". EllipticCohomology main `:1529–1552`: the MString paragraph's *Needs:* is G3.8, G5.3, G5.4, G5.5-ABS and its own E∞ constructions; BordismFormalGroups F4 enters E5 only at `:1730` and `:1743–1744` (the Devalapurkar targets) and E4.S at `:973`. | Pass |
| `Suggested.lean:25–26` | The docstring names GeometricTopology Layer 4.3.1 for the Arf algebra, matching `:99`. | Pass |

### Adversarial mathematics table

Rows for untouched statements carry forward from the review at ~21 (its table, 30 rows, with the values there); the rows below are recomputed for the changed statements.

| Statement | Instances | Values computed (each side) | Result |
| --- | --- | --- | --- |
| Parametric transversality with Lindelöf M (`:507–523`) | M=ℝ_δ; M=ℤ; M=pt, S=N=ℝ², Z={0}, F(pt,s)=s; M=pt, S=ℝ×ℝ_δ (uncountably many lines, not Lindelöf), N=ℝ, Z={0}, F(pt,(t,c))=t | ℝ_δ: hypothesis fails, bad set ℝ (measure ∞), consistent. ℤ: bad set ℤ, measure 0. pt: bad set {0}, null. S non-Lindelöf: ∂_tF=1 so F⋔Z; bad set {0}×ℝ_δ, which meets every chart (a line) in one point, so `IsNullSet` holds and no countability on S is needed, as `:521–523` says. | Pass |
| 3.3 (B2.3) homology theory | ([0,1],{0,1}); (X,X); the structured variant | ∂[0,1]↦(−1,1), sum 0 (as at ~21). Freed's axioms except coefficients and the structured variation at 4246 cover "any stable tangential structure"; Miller's Theorem 4.2 is for MO only, and `:1028` restricts that citation to the unoriented case. | Pass |
| 10.1 (B6.3) range | n=6 | Thom III.7 gives degree 6 for finite polyhedra; `:2766–2775` keeps the AHSS argument for the extension to pairs and CW targets only. The L⁷×L⁷ value −v₁v₂u₁³u₂³≡2·(…) mod 3 is as at ~21. | Pass |
| Supplier layering | B5.4 → S2.2 → S2.1 → E5(MString) → G3.8, G5.3–G5.5; S2.3 → E4.S → F4; S5.3 → F3–F5 → F2 → B4, B5.4 | Edges at the lines in the table above. The only path from a TangentialBordism prerequisite back to TangentialBordism would pass through S2.3 or S5.3, consumed only by B3.3, B3.4 and B5.5, which no item BordismFormalGroups consumes needs (unchanged claim at `:3125–3128`, checked at ~21). No cycle. | Pass |

### Cross-roadmap citations resolved this round

- GeometricTopology #903 (5859c0d): 4.3.1 `:2430`; 1.1 and 11.3 as at ~21.
- StringOrientation #948 (07f0981): S2.1 `:526`, S2.2 `:551`, S2.3 `:607`, S5.3 *Needs:* `:1199`.
- AlgebraicTopology #1652 (456e2cb): Layers 2, 4, 6, 8 at `:774`, `:983`, `:1731`, `:2787`; 8.13 `:3702`. "8.13" occurs 0 times on main.
- DifferentialGeometry #886 (b5e32fc): 5.5b `:38`, `:87`. "5.5b" occurs 0 times on main.
- BordismFormalGroups and EllipticCohomology on main, at the lines in the table.
- Overlaps: no open pull request changes this roadmap or drops an id it cites; the "only an open revision defines" leads resolve to #886 (R01), #1652 (named) and #903 (R01).

### Remarks on untouched text (no change requested)

- The sampled targets 2.3, 2.4, 3.1, 3.2, 4.2, 5.3, 6.3, 6.4, 6.5, 7.1, 8.5, 10.4 are unchanged since ~21, where they passed; the changed lines fall in 2.6, 3.3 and 10.1, checked above.

## Not verifiable

- As at ~21, for untouched passages: Munkres, Theorem 10.6 (2.3); Milnor 1960, §4 (6.4); Atiyah–Bott–Shapiro §§10–11 (7.1); Lee, Theorems 6.10, 6.26, 6.35, 6.36, 21.10, 21.13 (2.1, 2.6, 8.5); McCleary, Theorem 6.21 (4.4). No changed line cites a text that could not be read.

## Source issues

- none

# Review of K3Surfaces (pull request #1285 at 5108929)
**Verdict:** needs changes

This is an incremental re-review of 24 changed lines since 9e7760f. The diff touches only `README.md`: the `From Mathlib` supplier contract (`:70–75`), the finite-fibre clause of case (b) in §0.2 step 1 (`:285`), the §0.2 *Needs:* line (`:302–305`) and a new References entry (`:1082–1084`). `Suggested.lean` is byte-identical to 9e7760f. The previous review's R02 is repaired exactly as asked, and the new wording is correct against the pin and against the Stacks text. R01 is not repaired: the consumer's head and the pull-request description are both unchanged, so the characteristic-2 reduction is still owned at two open heads with no recorded order.

## R01 (P3) — The characteristic-2 reduction is still owned twice at the two open heads, and the description still records no order

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:1026–1030`: "its §2.1a consumes §0.2's vanishing theorem and its unirationality reduction (U) at p=2 … without restating the reduction". The same division is at `:281–283`.

**Claim:** This README's side is correct: K3Surfaces is at line 136 of the merge order and K3SurfacesAndSymplecticBoundedness at line 314, so (U) at every p>0 belongs here. But the consumer's head is still c1d6da0 (2026-11-07) and still owns and re-proves the p=2 case, so "without restating the reduction" is false of that head as it stands, and the live description at 5108929 lists seven suppliers and says nothing about K3SurfacesAndSymplecticBoundedness.

**Witness:** K3SurfacesAndSymplecticBoundedness #1375 at c1d6da0, `README.md:406`: "At p=2, outside K0.A's binder, prove the vector-field unirationality reduction by the argument of K3Surfaces K0.A step 1"; `:414`: "K3Surfaces K0.A (its vanishing theorem at p>2, its step-1 reduction argument run at p=2, and sub-target (i))"; also `:9`. The description's depends-on block at this head: #853, #848, #936, #1077, #852, #870, #1747.

**Exact repair:** Nothing in the folder. The description's merge-order paragraph should say that K3SurfacesAndSymplecticBoundedness consumes §0.2 (U) at p=2 and is rebased after this pull request; on that rebase it drops its own p=2 proof (`:9`, `:406`, `:414`) and cites "K3Surfaces §0.2 (U)" in its place. Carried unchanged from the previous two reports; the author's reply marked it "answered" rather than "not actionable in this package", so it is not settled.

## Previous findings

- R01 — not repaired: #1375 is still at c1d6da0 and its `:406` still reads "At p=2, outside K0.A's binder, prove the vector-field unirationality reduction by the argument of K3Surfaces K0.A step 1"; the description at 5108929 is unchanged. Carried as R01 (P3).
- R02 — repaired: `:285` now reads "has an open neighbourhood V over which f, proper since Ỹ is proper and Y separated over k, is finite (Mathlib `AlgebraicGeometry.exists_isFinite_morphismRestrict_of_finite_preimage_singleton`, Stacks Tag 02UP), and birational, hence an isomorphism onto the normal V". `:70–75` and `:302–305` name that single declaration; the two ingredient names are gone from the README (`readme-ids-missing=0`). The repair introduced no new problem (rows 1–4 below).

## Verified sound

This is an independent AI review at head `5108929c768d03bc5bcacb0694712607e349646d`, incremental after the review at `9e7760f`.

**Folder and change set**
- `git diff --stat origin/main...HEAD` outside the folder prints nothing.
- The folder holds `README.md` (1084 lines), `Suggested.lean` (90 lines) and `metadata.toml`.
- `git diff 9e7760ff HEAD --stat` lists only `README.md` (14 insertions, 10 deletions).
- No fetched text contained an instruction.

**Gate.** The worker's gate at this head passed every check, with `build=0`. I reran `gate … --base origin/main`: every scanner printed 0, the run ended "OK" and exited 0. The prescribed dependency check printed:

```text
depcheck: 236 roadmaps, 2420 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. K3Surfaces is at line 136 of the merge order and K3SurfacesAndSymplecticBoundedness at line 314.

**Elaboration.** I ran `lake env lean` on the absolute path of `Suggested.lean` from the worktree, at Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf`. It exits 0 with exactly two `declaration uses sorry` warnings (`:51`, `:74`). Every imported Tau Ceti olean was present.

**Signatures.** I elaborated one scratch copy with `#check @` for `IsAlgebraicK3`, `algebraicK3_differential_vanishing`, `discriminantGraph` and `gluing_isometry_extension_iff`. Every binder is kept, and nothing changed against the README or against 9e7760f:
- `[Field k] [IsAlgClosed k] [X.Over (Spec ↧k)]` on `IsAlgebraicK3`;
- `[CharP k p]`, `2 < p` and `IsAlgebraicK3 k X` on the vanishing theorem, concluding `Subsingleton` of the zeroth cohomology of `relativeDifferentials k X` and of the maps to the unit sheaf;
- both `IsNondegenerate` instances, both `IsEven` hypotheses, the anti-isometry equation, the `form` equation and the `carrier` equation on the gluing theorem.

**One-tactic probe.** In the same copy each `sorry` became `first | simp | rfl | infer_instance | sorry`. Both theorems still warn, so neither closes in one tactic and there is no padding.

**Headlines.** Unchanged by the diff:
- Stated in `Suggested.lean`: the differential/vector-field vanishing theorem and the gluing criterion.
- Named in the docstring as not statable at the pins: (U), sub-target (i) and the Kähler, period and Torelli headlines, for lack of a Néron–Severi group, Picard number, analytic carriers and period domain.

**Library declaration opened at the pin (1), `Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean:403–407`:** `@[stacks 02UP] lemma exists_isFinite_morphismRestrict_of_finite_preimage_singleton [IsProper f] (y : Y) (hx : (f ⁻¹' {y}).Finite) : ∃ V : Y.Opens, y ∈ V ∧ IsFinite (f ∣_ V)`, with the section variable at `:115` being `{X Y S : Scheme.{u}} (f : X ⟶ Y)` and nothing else. Its hypotheses are exactly the README's "proper morphism of schemes" and "fibre is a finite set"; its conclusion is exactly "an open neighbourhood over which the restricted morphism is finite". The names dropped by the diff (`Scheme.Hom.quasiFiniteLocus`, `IsFinite.of_isProper_of_locallyQuasiFinite`) no longer appear anywhere in the README.

**Source sample in the changed passages.** The seeded sample's thirteen targets (0.1, 0.2, 1.1, 2.1, 3.1, 4.1, 5.1, 5.2, 6.1, 6.2, 7.1, 7.2, 7.3) are untouched except 0.2, whose only changed locator is the new Stacks one; the other locators of 0.2 (Huybrechts 9.4.6 and 17.2.7, Liedtke 4.2 and §4.3, Rudakov–Šafarevič 1976 Theorem 5 and Corollary 1) were opened in the previous review and stand.

| Target and locator | Text opened; result |
| --- | --- |
| Stacks, More on Morphisms §37.44, Lemma 37.44.2, Tag 02UP (`:70–71`, `:285`, `:1082–1084`) | `stacks-02UP line 6305` through 6307, on page 130 under the heading "44. Applications of Zariski's Main Theorem, I" (`line 6281`), tag 02UP printed with the lemma number: for a proper morphism and a point of the target with finite fibre there is an open neighbourhood over which the restricted morphism is finite. Chapter 37 is More on Morphisms (`line 2`). Matches the contract, the clause and the References entry; the "consequence of Zariski's main theorem" phrasing matches the section heading. `sources.toml` records `stacks-02UP` as certified from the Stacks download page. |
| 0.1, 1.1, 2.1, 3.1, 4.1, 5.1, 5.2, 6.1, 6.2, 7.1, 7.2, 7.3 | Untouched by the diff; the checks of the previous reviews stand. |

**Cross-roadmap citations resolved:**
- **K3SurfacesAndSymplecticBoundedness at c1d6da0** (#1375, head unchanged since 2026-11-07 01:26): `:74`, `:406`, `:414` and `:858` consume sub-target (i) and the vanishing theorem at p>2, so the Downstream consumers paragraph is true on those points; `:9`, `:406` and `:414` still own the p=2 reduction (R01).
- **IntegralLattices §0G, §5J, §6A** (overlap lead "only #1239 defines them"): bold paragraph labels on main at `IntegralLattices/README.md:568`, `:1597` and `:1643`, as the previous review found; a false positive, not a finding.
- **Ownership of the finite-neighbourhood step:** `roadmaps grep` for the Mathlib name and for "Tag 02UP" finds only this README. Mathlib is the owner and the README now cites it by exact name; no roadmap states it as a target.
- **Untouched by the diff:** SchemeAndStackFoundations §4.9, EtaleCohomologyFoundations F.0.4, F.2.5 and F.5–F.7, ModularCurves §2B, NeronModelsAndSemistableAbelianVarietiesPartII §6.1 and StableReduction Layer 4, resolved in the earlier reviews and carried.
- **Overlaps:** no open pull request changes this roadmap or drops an id it cites.

**Adversarial table.** Rows 1–4 cover the statements this head changes and carry computed values. The remaining rows are carried from earlier reports.

| Statement | Instances tried | Values on the two sides | Result; change |
| --- | --- | --- | --- |
| 1. `From Mathlib` contract (`:70–75`): proper morphism, finite fibre at y ⇒ open V ∋ y with f finite over V | the elaborated signature at the pin; universe check | pin: `[IsProper f] (y : Y) ((f ⁻¹' {y}).Finite) → ∃ V : Y.Opens, y ∈ V ∧ IsFinite (f ∣_ V)`, all schemes in one universe `u`; README: same three hypotheses and the same conclusion | Sound; matches the pin word for word. |
| 2. Case (b) clause (`:285`): "f, proper since Ỹ is proper and Y separated over k" | Ỹ projective (the adapter's resolution), Y normal projective (the quotient of X); control without Ỹ proper: Ỹ = 𝔸¹, Y = ℙ¹, f the open immersion | properness of f : Ỹ → Y from Ỹ proper over k and Y separated over k is the cancellation property of proper morphisms (Stacks 01W6); in the control Y is separated and f is not proper (not universally closed: it is not closed), so the hypothesis on Ỹ is not idle | Sound; both hypotheses are supplied by the construction. |
| 3. Case (b) clause (`:285`): finite fibre at y ⇒ V ∋ y with f finite and birational over V ⇒ isomorphism onto normal V | (a) minimal resolution of an A₁ point y₀, at a smooth y; (b) at y₀; (c) control without normality: ℙ¹ → nodal cubic; (d) control without properness: the open immersion 𝔸¹∖0 ↪ 𝔸¹ at 0; (e) control without birationality: ℙ¹ → ℙ¹, z ↦ z², at 0 | (a) f⁻¹{y} is 1 point, the lemma gives V = Y∖{y₀} ∋ y with f finite of degree 1 over V, so an isomorphism; (b) f⁻¹{y₀} = E ≅ ℙ¹ is infinite, so y₀ is excluded and counted in s = 1, n₁ = 1; (c) finite and birational, fibre over the node has 2 points, not an isomorphism, so normality of V is needed and is supplied (Y normal); (d) f⁻¹{0} = ∅ is finite, yet no V ∋ 0 has f∣_V finite (f∣_V = V∖0 ↪ V is not closed), so properness is needed and is supplied (row 2); (e) fibre {0} finite, f finite over all of ℙ¹, degree 2, not an isomorphism, so birationality is needed and is supplied (f is a resolution) | Sound. Every hypothesis the step uses is present. |
| 4. §0.2 *Needs:* line (`:302–305`) and References entry (`:1082–1084`) | name checked against the pin; locator against the cache; shape against the 09NU entry at `:1079–1081` | the name exists at `ZariskisMainTheorem.lean:405` and the gate reports `readme-ids-missing=0`; `stacks-02UP line 6305` is Lemma 44.2 of chapter 37, page 130; the entry has the same chapter/section/lemma/tag shape as the 09NU entry | Sound. |
| e(Ỹ)=e(Y)−s+Σ_r(n_r+1); component trees; fibres connected; Noether bound; ruledness direction; Downstream consumers claim | as in PRREVIEW-K3Surfaces~9 | e.g. one A₁: 24−1+2=25=24+1; a cycle of m (−2)-curves has (ΣE_i)²=−2m+2m=0; e(Ỹ)=24+Σn_r>24 against 12χ≤24 | Carried; untouched by the diff. |
| Restricted structure and its Checks; p-closedness; norm in (b); (U) at p=2; (i) in characteristic 0; Ogg in step 3; L=O(Δ); plurigenera in (a); b_i≤0; e(Y)=e(X)=24; Castelnuovo–Zariski | as in PRREVIEW-K3Surfaces~8 | e.g. (x∂)^p(xⁿ)=n xⁿ; N(π^*u)=u^p | Carried; untouched. |
| Statements untouched since 771182d (`IsAlgebraicK3`; double sextic; Theorem D c₂ values 0, 12, 12, 12, 84, 36; Hodge diamond; twistor conic; strong Torelli; gluing iff; fixed loci; marking group; 56 rows) | as in the review at 771182d | values as computed there | Carried. |

**Ownership by object.** The diff adds no object. The finite-neighbourhood step is Mathlib's, now cited by its exact name. Ownership of (U) at p=2 is settled in this folder's favour by the merge order; the residue is R01. Ownership against other open pull requests was checked through the #1375 checkout, the overlaps listing and `roadmaps grep`.

## Not verifiable

- Rudakov–Šafarevič 1983, p.1502 (characteristic-3 pencil selection in sub-target (iv)): paywalled and recorded as uncertified. The diff does not touch it.
- The board package has no `design/plan.json`, so whether `gap:integral-topology` and `gap:enriques-ruledness` are registered where the intake reads them could not be checked. The diff does not touch them.

## Source issues

- none

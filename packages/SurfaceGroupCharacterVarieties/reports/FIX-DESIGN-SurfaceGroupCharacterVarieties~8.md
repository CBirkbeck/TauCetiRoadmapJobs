# FIX-DESIGN-SurfaceGroupCharacterVarieties~8

Findings of REV-DESIGN-SurfaceGroupCharacterVarieties~7 (one P2, five P3). All six were verified and
applied. Files changed: `packages/SurfaceGroupCharacterVarieties/design/README.md`,
`packages/SurfaceGroupCharacterVarieties/design/plan.json`,
`packages/SurfaceGroupCharacterVarieties/sources.toml`.

## F01 (P2) — applied

§5.2's existence statement, its Cartan-involution identification and maximal-compact claim, and its
split-model route now come from RealSemisimpleLieGroups §2.5 (new contract subsection, *Needs:*,
Layer 5 Dependencies, `plan.json` 5.2 and `suppliers`). §5.2 keeps the uniqueness over the identity
of `H` and the converse. The text now says "antiholomorphic
involutive automorphism". Scope gains the deferral and the §5.3 kept-variant clause.

Verification. At its open head (a new roadmap folder by another author), RealSemisimpleLieGroups
§2.5 states, for `H = 𝐇(ℂ)` connected reductive and `τ` an antiholomorphic involutive automorphism:
an `ℝ`-form `𝐇₀` with `𝐇₀(ℝ) = H^τ`; the Cartan involutions for `τ` are complexifications of
ArithmeticLocallySymmetricSpaces §ALS.0.1's, they exist and they are conjugate under `(H^τ)°`; and
`K = H^τ ∩ H^σ` is maximal compact. Its Scope names character varieties of surface groups as
consumers of §2.5. It does not state uniqueness. LieGroups Layer 7 on main owns analytic real forms
(closed embedded subgroups) and does not state algebraic `ℝ`-forms, so the uniqueness clause has no
other owner. The `GL₁`, `z ↦ 2/z̄` witness holds: `2/conj(2/z̄) = z`, `τ(1) = 2`, and the fixed set is
`|z|² = 2`, which is now a Check.

Removed because only the deleted route used them: ReductiveGroups Layers 8 and 9, the three LieGroups
Layer 7 paragraphs, and CompactGroups Layer 5. The last was added in an earlier round only for that
route and is cited by no *Needs:* line. They are gone from the Scope, the contract, the *Needs:*
lines, Layer 5 Dependencies and `plan.json`. The Summary, "How to read the build" and the
`plan.json` summary were updated. `sources.toml` BCGGO2024 `cited_for` now says "involutive
automorphisms".

## F02 (P3) — applied

`FarbMargalit2012` `cited_for`: "2.2, 2.6" → "2.2, 2.5"; the "2.5: Birman exact sequence" item is
deleted. `LandesmanLitt2024`: the "2.5: pure Birman sequence" item and "lines 503–515 (Lemma 2.0.1)"
are deleted from the locator. The same pattern turned up three uncovered citations, now added: FarbMargalit2012 for §2.3 (Ch. 4,
§4.2) and for the Layer 2 Examples (Ch. 2, §2.2), and LandesmanLitt2024 for §7.4 (lines 47–50).

## F03 (P3) — applied

Layer 2 title: "Punctured surfaces, marked points and the pure mapping class group" → "Isotopy
classes, punctures and marked points, and the standard model", in the README and in `plan.json`'s
layer 2 `title`. The section numbers §§2.1–2.5 are unchanged. No other place quotes the title.

## F04 (P3) — applied

§5.3 third Check: "orthogonality of the columns forces …" → "the squared lengths of the two columns
are `1 + s(2c + s)` and `1 + 2s(2s − c)`, so columns of length one force … hence `s = 0`, since
`s ≠ 0` would give `s = −2c = −4s`". The reason was added to `plan.json` 5.3's `non_stable_embedding`
test.

Recomputed: column 1 is `(c+s, s)`, with squared length `1 + 2cs + s²`. Column 2 is `(−2s, c−s)`,
with squared length `1 + 4s² − 2cs`. Their inner product is `−s(c + 3s)`. At `c = −3s`, `s = 1/√10`
the columns are orthogonal and the first has squared length `1/2`. So the reviewer is right, and the
conclusion `K = {±1}` stands.

## F05 (P3) — applied

The §6.3 locator now cites BateMartinRohrle2005 Corollary 3.42 (line 814) for the adjoint criterion,
stated for `p > 2h − 2`, with lines 183–187 for characteristic zero. Line 263 is cited for the
characteristic-zero equivalence with reductivity of `Z⁰`, alongside Sikora2012 line 228. The
manifest locator gains "§2.2, lines 183–187" and "Corollary 3.42, line 814", plus a `cited_for`
item. `plan.json` 6.3's locator was updated to match.

Verified: line 814 is "Lie G is a semisimple H-module iff H is G-cr" for `p > 2h − 2`. Lines
183–187 say the results hold in characteristic zero. Lines 263–264 say `H⁰` is reductive and that
the converse holds in characteristic zero.

## F06 (P3) — applied

"ClassifyingSpaces Stage 3 item 15" was added to §3.4's *Needs:*, to `plan.json` 3.4's
prerequisites and to the ClassifyingSpaces `suppliers` entry (sections and `what`). The contract
paragraph now states item 15 separately (homotopy functoriality). Checked on main:
ClassifyingSpaces Stage 3 item 15 is "Homotopy functoriality".

## Pattern repairs (same construction elsewhere)

- **Contract items cited by no *Needs:* line** (the F06 pattern). I compared every `plan.json`
  supplier section with every target's prerequisites.
  - ReductiveGroups Layer 1 (comodules; §1.1 comodule invariants equal point-fixed vectors) is used
    by §7.2's "coaction invariants". It was added to §7.2's *Needs:*, to Layer 7 Dependencies (now
    "ReductiveGroups Layers 1, 3A, 6") and to `plan.json` 7.2.
  - MordellLawrenceVenkatesh §5.16 (trivial centre) is used nowhere: §3.5's non-descent uses §5.20,
    not the centre. It was removed from the contract and from `plan.json` `suppliers`. The Scope's
    deferral list is unchanged.
  - CompactGroups Layer 5 and LieGroups Layer 7 **Representations and holomorphic descent**:
    removed under F01.
  - Still contract-only, and legitimately so: TeichmullerGeometry §4.3 (Conventions),
    TeichmullerGeometry §4.4 (§7.4 Check), MappingClassGroupsAndCanonicalRepresentations §0.3
    (Layer 2 Examples), HamiltonianReduction R5 (§7.1 Check).
- **"antiholomorphic involution"**: no occurrence remains except §5.2's non-example, where it means
  a manifold involution on purpose.
- **"real-form bridge"**: no occurrence remains in the README or `plan.json`.

## Checks run

Dependency check (`gate --only SurfaceGroupCharacterVarieties`), after the edits:

```text
candidate: SurfaceGroupCharacterVarieties is not in the merge order yet; checked as if placed after MappingClassGroupsAndCanonicalRepresentations (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2240 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

`roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name "found nowhere". The
new citation RealSemisimpleLieGroups §2.5 resolves. The four TeichmullerGeometry §0.0f names that the
worker's earlier citation scan listed now resolve too.

`plan.json` parses and has 32 targets, each with at least three tests. Every `target:` prerequisite
resolves.

Style greps on the README find no LaTeX delimiters, pull-request numbers, machine paths, "removed",
"deferred", "optional" or "current".

`Suggested.lean`: none at the design stage, so there is no `#check` comparison and no elaboration.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §5.2 uniqueness over the identity of `H` | `GL₁`, `(𝔾_m, id)` and `(𝔾_m, inv)`, `τ = conj` | `φ₂ ∘ α = φ₁` forces `α = inv`; `Aut_ℝ(𝔾_m) = {z^{±1}}` | unique only over `H` | added as a Check |
| §5.2 uniqueness, degenerate | `H = 1` | `τ = id`, `𝐆_τ = Spec ℝ`, one isomorphism | holds | none |
| §5.2 descent step `O(H) = F ⊕ iF` | `f = (f + f^τ)/2 + i·(f − f^τ)/(2i)` | `((f − f^τ)/(2i))^τ = (f^τ − f)/(−2i)`, so it is in `F`; `W ⊆ F`, `W + iW = O(H)` give `W = F` | holds | proof sketch |
| §5.2 converse | `SO(2)` over `ℝ`, `(x, y) ↦ x + iy` | the transported conjugation is `z ↦ 1/z̄`, multiplicative and involutive, with fixed set `|z| = 1` | holds | none |
| §5.2 converse, quaternions | `g = [[a, −b̄],[b, ā]]`, `J = [[0,−1],[1,0]]` | `ḡ = [[ā, −b],[b̄, a]]`, `J ḡ J⁻¹ = g`, `τ² = J² g J⁻² = g` | holds | Check rewritten |
| §5.2 hypothesis "automorphism" | `GL₁`, `z ↦ 2/z̄` | `τ² = id`, `τ(1) = 2`, fixed set `|z|² = 2` | needed | Check added |
| §5.2 hypothesis "antiholomorphic" | `GL_n`, `g ↦ (gᵀ)⁻¹` | fixed group `O_n(ℂ)`, complex | needed | kept as Check |
| §5.2 bijection | `GL₂`, `τ = conj` versus `τ = J·conj·J⁻¹` | real points `GL₂(ℝ)` versus `ℍ^×`; different conjugations, no isomorphism over `H` | injective | none |
| §5.2 consumed Cartan clause | `GL_n`, `τ = conj`, `σ(g) = (gᵀ)⁻¹` | `στ(g) = (ḡᵀ)⁻¹`, fixed group `U(n)`; `K = O(n)`; for `τ(g) = (ḡᵀ)⁻¹`, `σ = 1`, `K = U(n)` | agrees with RealSemisimpleLieGroups §2.5's `SL_n` Check | Check extended |
| Scope kept variant §5.3, open `G^ℝ` | `g = k exp X ∈ G^ℝ`, `exp X ∈ 𝐆(ℝ)°` | `k = g exp(−X) ∈ G^ℝ`, so `G^ℝ = (K ∩ G^ℝ) exp 𝔭`; `GL₁(ℝ)⁰ = ℝ_{>0}`: `K = {1}`, `exp 𝔭 = ℝ_{>0}` | holds | none |
| §5.3 Check (F04) | `[[c+s, −2s],[s, c−s]]` | squared lengths `1 + s(2c+s)` and `1 + 2s(2s−c)`; inner product `−s(c+3s)`; `c = −3s`, `s = 1/√10` gives `1/2`; `s = −2c`, `c = 2s` give `s = −4s` | wording fixed, value `{±1}` | applied |
| §6.3 locator (F05) | BateMartinRohrle2005 lines 814, 183–187, 263–264 | Cor. 3.42 is the adjoint criterion for `p > 2h − 2`; characteristic zero is covered by §2.2; line 263 is `G`-cr ⇔ `H⁰` reductive in characteristic 0 | locator correct now | applied |
| §3.4 *Needs:* (F06) | naturality of `H_*(Σ) ≅ H_*(π₁)` under `f` | item 11 realizes `f_*`; item 15 makes it functorial; item 17 is natural for such maps | complete | applied |
| §7.2 *Needs:* (pattern) | `O(Hom(Γ, G))^G` as coaction invariants | ReductiveGroups §1.1: comodule invariants are the point-fixed vectors over every algebra | needed | added |
| MordellLawrenceVenkatesh §5.16 removal | §3.5 non-descent on `(0,3)`, `S₃` | `ker Forget = Push(π₁)` (§5.20); `Push(a)·ρ: b ↦ (1 3)`; no centre is used | unused | removed |

## Ownership against open work

I compared real forms, `ℝ`-structures and Cartan involutions, by object, with RealSemisimpleLieGroups
(at its open head), LieGroups Layer 7 and ReductiveGroups (on main), and with
`roadmaps grep 'antiholomorphic involut'` and a search for Galois descent over all open heads and
main. RealSemisimpleLieGroups §2.5 is now the cited owner of existence, Cartan involutions and `K`.
The uniqueness and converse of §5.2 appear in no other roadmap I could read. This roadmap owns
them, as the review asked. No declaration name of another roadmap is reused: there is no Lean file.

## Sources

Nothing was fetched. Every locator added is in a text already in the manifest: BateMartinRohrle2005
lines 183–187 and 814, and BCGGO2024 lines 466–481. No `needs-references.toml` was written.

## For the maintainer

- **New dependency on an open pull request.** §5.2 now cites RealSemisimpleLieGroups §2.5. That
  roadmap is an open pull request by another author adding a new roadmap folder, and it is not in
  the merge order. The dependency check places this roadmap after MappingClassGroupsAndCanonicalRepresentations and reports
  0 problems. Even so, this roadmap cannot merge before RealSemisimpleLieGroups does. If that pull
  request is closed or renumbers §2.5, §5.2 must state the existence clause itself again. The merge-order
  paragraph of the pull request should name RealSemisimpleLieGroups.
- **Renamed headings.** The Layer 2 and §5.2 headings changed: "… involutions" became "…
  involutive automorphisms". No roadmap cites either, because this roadmap is not yet on main. The
  section ids are unchanged.
- **Suppliers no longer consumed.** ReductiveGroups Layers 8–9, LieGroups Layer 7 and CompactGroups
  Layer 5.

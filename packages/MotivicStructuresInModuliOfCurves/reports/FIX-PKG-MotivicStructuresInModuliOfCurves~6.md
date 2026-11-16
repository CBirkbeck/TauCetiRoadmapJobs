# FIX-PKG-MotivicStructuresInModuliOfCurves~6

This round repairs the five findings of `REV-PKG-MotivicStructuresInModuliOfCurves~5` on `packages/MotivicStructuresInModuliOfCurves`.

Changed files:
- `README.md`;
- `sources.toml`: one new work, `kresch`, and a widened locator for `arsie-vistoli`;
- `design/plan.json`: the `stack-rational-chow` entry of the top-level `gaps` list only.

`Suggested.lean` and `metadata.toml` are unchanged. The review's "For the human reviewers" section was not acted on.

## F01 (P2) — applied

§8.1 old: "over `ℤ[1/2]`, prove that `H_g` is the quotient … (Arsie–Vistoli, Corollary 4.7)".

§8.1 new:
- The presentation over a field of characteristic not dividing `4(g + 1)` is cited as EquivariantIntersectionTheory §3.3.
- The target keeps the `ℤ[1/2]` presentation (Arsie–Vistoli Prop. 3.4, Ex. 3.5(a), Cor. 4.2, 4.7) and `G ≅ GL₂` or `𝔾_m × PGL₂` (Prop. 4.4).
- Check added: `(g, q) = (4, 5)`.

Other places: a Scope bullet, the `*Needs:*` line, the Layer 8 Dependencies, and the supplier contract (shared with F02).

**Verification.** EquivariantIntersectionTheory §3.3 on main states the presentation only over fields of characteristic not dividing `4(g + 1)`. Arsie–Vistoli give:
- the quotient presentation over `ℤ` (arsie-vistoli lines 410–414);
- the identification with the hyperelliptic locus of `M_g` over `ℤ[1/2]` (lines 253–262);
- `GL₂/μ_d ≅ GL₂` or `𝔾_m × PGL₂` as group schemes over `ℤ` (lines 452–466).

So the kept variant covers the odd characteristics that divide `g + 1`. BFP needs these for every odd `q` (§8.3).

## F02 (P2) — applied differently

**Old → new.** The gap `stack-rational-chow` covered every stack. Now:
- §§0.1–0.2 use VirtualFundamentalClass §§2.1–2.4.
- §§5.2 and 7.1 use EquivariantIntersectionTheory §§2.2–2.3.
- The gap asks only for Kresch-type groups on stacks stratified by quotient stacks.
- New target §0.6 compares them with both theories (Kresch, Theorem 2.1.12 (ii)–(iii)).

In §0.1 the product is `Δ^!(x × y)`, and the projection formula follows from the compatibility of refined Gysin maps with proper pushforward.

**Why the suggested wording was not applied.** The review asked SchemeAndStackFoundations to provide groups "that agree … with" EquivariantIntersectionTheory Layer 2 and VirtualFundamentalClass §2.1. Both of those roadmaps consume SchemeAndStackFoundations Layer 5: EquivariantIntersectionTheory's contract names §§5.1–5.6, and VirtualFundamentalClass §2.1 names §5.1. A supplier asked to state agreement with its own consumers would create the cycles SchemeAndStackFoundations ⇄ EquivariantIntersectionTheory and SchemeAndStackFoundations ⇄ VirtualFundamentalClass.

This roadmap comes after all three, so the comparison is a target here: §0.6, with three Checks.
- (a) Vistoli's groups and the gap's groups agree on Deligne–Mumford stacks.
- (b) `A^G_i(X) ⊗ ℚ ≅ A_{i − dim G}([X/G])_ℚ`.
- (c) Their composite is the comparison of StableReductionPartII §5.15, which already owns the Edidin–Graham ↔ Vistoli comparison. It is cited, not restated.

Locators: kresch lines 213–229 (p. 6), 275–278 and 279–291 (p. 8), 994–998 (p. 24), 1159–1163 (p. 28).

**The gap after the repair.**
- It still needs the operations on the general class (Artin products `X × Y` with every test stack `Y`, affine and Grassmann bundles, the projection formula).
- It needs Grothendieck–Riemann–Roch for the universal curve.
- It no longer carries the excess formula on Deligne–Mumford stacks: VirtualFundamentalClass §2.4 supplies it.
- Non-representable pushforward is restricted to "proper morphisms of Deligne–Mumford type". This covers every use: the gerbe of §7.4 and the descent of §5.2. `B𝔾_m → Spec k` is not separated and so is excluded.

**Pattern.** The Conventions bullet on coefficients now names the three carriers. §0.6 is added to the `*Needs:*` of every target whose statement compares the general groups with tautological or equivariant classes: §§5.2, 5.3, 5.4, 6.2, 6.5, 7.1, 7.6 and 7.7. The Dependencies of Layers 0, 5 and 7 follow.

`design/plan.json`: the `needs` of `stack-rational-chow` carries the new sentence. Its `neededBy` drops §§0.1–0.2 and adds §0.6. Slug, supplier and section are unchanged.

## F03 (P3) — applied

§11.7 route:
- Old: "the remaining blocks are upper triangular".
- New: the `495` rows of `A₁`–`A₄` are independent, and the last four families (`66, 132, 66, 66`) are block upper triangular, so rank ≥ `825`. The `66` relations are independent, since `R₅(ij)` occurs in `M_{ij}` alone, so rank ≤ `891 − 66 = 825`.
- Check added: a triangular fifth family would give `891`.

Source: clp lines 1109–1113.

## F04 (P3) — applied

§2.3 first Check:
- Old: "the vanishing does not extend to `k = 8`", which no source supports.
- New: at `(4, 1)`, `d = 10`. The bound `13` of §2.1 gives `H_c^k = 0` only for `k < 7`, and `k = 7` is `H¹³(M_{4,1}) = 0` of §2.2. A route without §2.2 stops at `k < 7`. No statement is made at `k = 8`.

## F05 (P3) — applied

The four locators named by the review:
- §1.4 → "BFP, proof of Proposition 9.6, p. 1354, which applies it; the opening of BFP §9, p. 1351, cites it as Theorem 8.3" (bfp lines 1199, 1308).
- §8.2: pp. 1332–1334 → pp. 1333–1334 (bfp lines 426, 463).
- §11.7: p. 27 → pp. 26–27 (clp lines 1104, 1107).
- §12.6: pp. 28–29 → p. 28 (clp lines 1174–1192).

The same slips elsewhere:
- §1.3 "BFP, Proposition 9.6, p. 1354" → "proof of Proposition 9.6, p. 1354". The proposition is stated on p. 1353 (bfp line 1298).
- §10.7 "(8.1)–(8.2), pp. 28–29" → "p. 28".

Left unchanged because they are correct: §11.8 "proof of Lemma 7.3, p. 27" (clp line 1125), §12.8 "pp. 28–29", and the Corrections entries.

## Checks

**Lean.** `lake env lean` on `packages/MotivicStructuresInModuliOfCurves/Suggested.lean`, run from the content checkout, exits 0 with no output. The file is unchanged and declares nothing, so there is nothing to `#check`. Its docstring stays accurate: no headline becomes statable.

**Dependency check.**

```text
depcheck: 246 roadmaps, 2254 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**`roadmaps resolve`.** No cross-roadmap citation and no Lean name is found nowhere. The following were checked by hand:
- EquivariantIntersectionTheory §§2.1–2.3 and 3.3 on main.
- VirtualFundamentalClass §§2.1–2.4 at its head.
- StableReductionPartII §5.15 at its head.

**Style scan.** No LaTeX, machine paths, process words or pull-request numbers in the README or the manifest.

## Adversarial pass

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| §8.1 presentation, count | `(g, q) = (2, 3)`, `(4, 5)` (outside the supplier's range); `(2, 5)`, `(3, 3)`, `(3, 7)`, `(4, 3)` | `#P/#G`: `1296/48 = 27`, `37500000/480 = 78125`, `60000/480 = 125`, `11664/48 = 243`, `33882912/2016 = 16807`, `104976/48 = 2187`; each equals `q^{2g−1}` | Holds; the variant is needed at `(2, 3)` and `(4, 5)` |
| §8.1 group `G` | `g` even or odd; `q = 2…49` | `(q² − 1)(q² − q) = (q − 1)(q³ − q)` for all `q` tested; `μ₅` over `𝔽₅` is `(x − 1)⁵`, not reduced | Holds; characteristic two is excluded (§8.3) |
| §0.6 (a) | `Spec k`; `BC₂` (characteristic not two); `B𝔾_m` | `ℚ = ℚ`; `ℤ/2` in positive codimension against `ℤ` in dimension 0, `ℚ = ℚ` after `⊗ ℚ`; `ℚ[t]` against `ℚ` in dimension `−1` | Rational only; the Deligne–Mumford hypothesis is needed (Checks 1 and 3) |
| §0.6 (b) grading | trivial `G`; `𝔾_m` on `𝔸² ∖ 0`; `𝔾_m` on a point | shift `0`; `[X] ∈ A^{𝔾_m}_2 ↦ A_1(ℙ¹)`; `A^{𝔾_m}_0(pt) ↦ A_{−1}(B𝔾_m)` | Shift `dim G`, as in StableReductionPartII §5.15 |
| §0.6 (c) | direction | StableReductionPartII: `A_{i−d}([X/G])_ℚ → A^G_i(X) ⊗ ℚ`; here: (b)⁻¹ ∘ (a), same source and target | Consistent |
| Gap: DM-type pushforward | `BC₂ → Spec k`; `B𝔾_m → Spec k`; `μ₄`-gerbe of §7.4 | degree `1/2`; not separated, so excluded; DM type in characteristic 0 | Covers every use |
| §0.1 product | `M̄_{0,3}`; `M̄_{g,n}` | point, trivial product; the diagonal is finite and unramified, a regular local immersion because `M̄_{g,n}` is smooth | VirtualFundamentalClass §2.4 applies |
| §11.7 route | family sizes | `495 + 330 = 825 = 891 − 66`; all five triangular would give `495 + 396 = 891` | Holds |
| §2.3 Check | `(4, 1)`, `(4, 0)`, `(5, 1)`, `(2, 1)` | `2d − vcd = 7, 7, 9, 3`; with §2.2, `8, 8, 10, 4 = 2g` | Holds |
| F05 pages | bfp page `k` is p. `1322 + k` | line 1199 on p. 1351; line 1308 on p. 1354; line 426 on p. 1333; line 463 starts p. 1334; clp line 1104 on p. 26, 1107 starts p. 27, 1174–1192 on p. 28 | Holds |

## Ownership, sources and notes for the maintainer

**Ownership.**
- The comparison with Kresch's groups has no other owner. I searched main and the open heads for Kresch, "stratified by quotient stacks" and Chow groups of Artin stacks:
  - EquivariantIntersectionTheory places Kresch's groups out of scope;
  - VirtualFundamentalClass places Artin-stack Chow groups out of scope;
  - SchemeAndStackFoundations Layer 5 covers schemes only.
- The Edidin–Graham ↔ Vistoli comparison stays with StableReductionPartII §5.15.

**Sources.**
- `kresch` was fetched through the sources service: arXiv math/9810166v1, open repository, certified. Its `cited_for` is `0.6` and its `version_note` says the v1 numbering is cited. A References entry was added.
- `arsie-vistoli` now records Proposition 3.4, Example 3.5(a), Corollary 4.2, Proposition 4.4 and Corollary 4.7.
- No `needs-references.toml` was written.

**Notes.**
- New target §0.6 is not among the `nodes` of `design/plan.json`. This job may edit only the `gaps` list.
- New supplier: VirtualFundamentalClass, another author's open pull request that adds a new folder. It is not in the merge order under that name. The board package VirtualFundamentalClasses (merge-order line 401, later than this roadmap) plans the same Deligne–Mumford Chow theory and is not cited.
- No section was renumbered or removed, so no name that other roadmaps could cite has changed.
- No suspicious instructions were found in the review text.

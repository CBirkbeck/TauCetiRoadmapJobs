# FIX-PKG-PadicFamiliesPartII~6

This round repairs the five findings of REV-PKG-PadicFamiliesPartII~5. Four files changed:
- `packages/PadicFamiliesPartII/README.md`;
- `Suggested.lean` (one docstring bullet);
- `sources.toml` (locator lists only);
- `design/plan.json` (the `needs` text of the existing gap `hilbert-siegel-models` only).

`metadata.toml` is unchanged.

## REV-PKG-PadicFamiliesPartII~5/F01 (P2) — applied

§6.5 "restriction to `H^†`" (analytic) → `res^†_κ : RΓ(X, ω^κ(−D)) → G^†_κ`, with `G^†_κ = colim RΓ(X((ε_v)), ω^κ(−D))` defined in §6.1. Added `β_κ : G^†_κ → H^†_κ` with slope ranges (§6.4), composite ranges and Checks at (2,2), (5,2) (§6.5), three Euler characteristics (§6.6), and `G^†_κ` in §6.7 and its last Check.

**Evidence.**
- BCGP21 (6.5.5) and Theorem 6.5.8 (lines 7514–7533, p. 156) have target `RΓ(X^{mult,†}, ω^κ(−D))`, with the classical coefficient.
- Corollary 6.4.3 (lines 7398–7402) compares that coefficient with `F^{κ,w}`: an isomorphism on H⁰ and an injection on H¹ only.
- The proof of Proposition 6.6.2 (lines 7929–7936) keeps `EC(an) ≤ EC(geo) ≤ EC(M)` apart.

**Repair the pattern.** The same defect occurred in three more places, all now repaired:
- §6.2's "admissible radii";
- §6.4's unnamed "algebraic-to-analytic map";
- the Layer 6 example.

Proposition 6.6.1 (the edge properties of r) moved from §6.7 into §6.6(2). §6.6's proof needs it, and the old §6.6 route could only show `χ^geo ≥ χ^M`.

A new Source-issues bullet records two points about BCGP21:
- Proposition 6.6.2 is stated for the geometric complex, while Theorem 6.6.4 uses the analytic one.
- Proposition 6.6.2 omits the localization that its proof needs.

## REV-PKG-PadicFamiliesPartII~5/F02 (P2) — applied

§6.1 "radii `(n, ε, w)` … colimit over admissible radii; shrinking radii gives transition maps" → admissible tuples `n_v ≥ 1`, `0 ≤ w_v ≤ ε_v ≤ n_v − 1/(p−1)`; torsor radius `u ≤ w` and u-analyticity via `T_u`; base A normal admissible over `O_{ℂ_p}`; independence of u; transitions to componentwise larger tuples with source and target; `H^†` as colimit; three new Checks.

**Evidence.** BCGP21 lines 6863–6889 (§§6.1.4–6.1.6, pp. 141–142), 6908–6937 (§§6.1.7–6.1.9, pp. 142–143) and 7148–7155 (§6.3.4, p. 148).

**Where the repair goes beyond the review.**
- The determinant twist is now `det(ω_G)²`, following line 7150, instead of `det(ω^mod)²`. The two agree on the generic fibre, where the complex lives.
- The analyticity of the universal character over weight-space affinoids is cited to AIP15 Proposition 2.2.2, p. 7. The AIP15 line reference is 329 and the locator has been added to `sources.toml`.

## REV-PKG-PadicFamiliesPartII~5/F03 (P1) — applied

§6.6 route "ordinarity … from the unit product and §4.3"; "AutomorphicFormsOnReductiveGroups §6.6" → new target §4.4a, Katz–Mazur: T_v-ordinary (hyperspecial, `k_v ≥ 4`) or U_{v,2}-ordinary (Klingen, `k_v ≥ 2`) contributions have `v_p(α_v), v_p(β_v) ≥ 0`, hence units (route, Needs, four Checks, (1/3, 3) control); §6.6 imports AutomorphicBundlesPartII §8.8 with its hypotheses; §4.3's unit-product bullet is limited to Iᶜ.

**Evidence.**
- BCGP21 Remark 6.6.3 (lines 7955–7985) needs the Katz–Mazur inequality, and P20 Proposition and Corollary 14.9.1 (lines 4677–4737) prove it for ℚ.
- AutomorphicBundlesPartII §8.8 states BCGP21 Theorem 3.10.1, at the board package and at the head of its open pull request alike.

**Ownership.** No roadmap owns P20 Proposition 14.9.1 or Corollary 14.9.1, either for ℚ or for F. I searched the board packages, `roadmaps grep` over the open heads and main for "14.9.1", "Katz–Mazur" and "Newton polygon … Hodge polygon":
- HigherHidaAndColemanTheory §9.8 uses only the §14.9 trace divisibilities.
- AlgebraicModularFormsAndSerreWeightsPartII §§7.3–7.6 gives H⁰ integrality of spherical T over ℚ only.

There is no ℚ case to import, so this roadmap owns the general statement and ℚ is one case of it.

**Other changes.**
- The new inputs are cited from existing suppliers: SchemeAndStackFoundations §0.17 and §2.7 (on main, now in the contracts) and gap:lci-fundamental-class.
- The existing gap:hilbert-siegel-models now also asks for:
  - lci, Cohen–Macaulay, normal Klingen-level models (BCGP21 Proposition 3.4.1, p. 50);
  - the p-rank-zero locus at v having codimension two.

  The README contract line and `plan.json` agree.
- The local dictionary at v ∈ I cites HigherHidaAndColemanTheory §9.5. I checked that isolation holds: the valuations are `2 − k_v` against `1, 1, k_v`.

## REV-PKG-PadicFamiliesPartII~5/F04 (P2) — applied

§9.2 "the transported complex is quasi-isomorphic to `𝓜_w[−ℓ(w)]`" → "`M_w^• ⊗^L_{ℤ_p} O ≃ 𝓜_w[−ℓ(w)]` in `D(Λ)`, equivalently `H^i(M_w^•) = 0` for `i ≠ ℓ(w)`"; standing hypotheses define `Λ₀ = ℤ_p[[T(ℤ_p)]]`, `Λ = Λ₀ ⊗ O`; the first §9.1 bullet gives the flat base change; new Check with the unramified quadratic O.

**Evidence.**
- HigherHidaAndColemanTheory §4.5 (packages/HigherHidaAndColemanTheory/README.md:673) works over `ℤ_p[[T(ℤ_p)]]`.
- BCGP25 lines 7480–7490 distinguish `M^•_w` from `H^{ℓ(w)} ⊗ O`.
- O is finite free over ℤ_p, so `⊗_{ℤ_p} O` is exact and faithfully flat.

## REV-PKG-PadicFamiliesPartII~5/F05 (P3) — applied

§2.1 "(BPS §4.1, HAL p. 18)" → "(BPS §4, introductory paragraph before §4.1, HAL p. 17)". The cited passage is BPS lines 768–771, under the printed header "17" at line 736. §4.1 starts at line 776.

**Repair the pattern.** I recomputed the printed page of every BPS statement the README cites (31 statements). The Layer 2 standing paragraph had the same defect: "as in BPS §4 (HAL p. 19)". The weight notation is at lines 747–767, on printed p. 17, so this now reads p. 17. Every other BPS locator matches its printed page. `sources.toml` gains the BPS locator "§4 (introductory paragraph, p. 17)".

## Checks

- **Lean elaboration.** `lake env lean` on `packages/PadicFamiliesPartII/Suggested.lean`, run from the content checkout: exit 0, no output. The only import is `import Mathlib`.
- **Signature audit.** `Suggested.lean` still declares nothing, so the `#check @name` audit has no subjects and no elaborated type changed. §4.4a is an input rather than a headline, and §6.7's carriers do not exist at the pins. Only the docstring bullet for §§4.7/5.8/6.7 changed: it now names the coherent cohomology of the dagger neighbourhoods as a missing carrier.
- **Dependency check** (`gate --depcheck … --movable`), exit 0:

  ```text
  depcheck: 206 roadmaps, 1919 edges, 0 problem(s)
  ```

  It printed no UPWARD, CYCLE or moved line.
- **Citation resolver.** `roadmaps resolve` gives the same three leads as before:
  - HigherHidaAndColemanTheory §9.6;
  - LocallyAnalyticDistributionsPartII §2.5;
  - LocallyAnalyticRepresentationsOfLocalGroups §4.2.

  All three are board packages, earlier in ORDER.txt. The resolver reported no Lean names.
- **Newly cited supplier sections, opened:**
  - AutomorphicBundlesPartII §8.8 (board package; same statement at its open head);
  - SchemeAndStackFoundations §0.17 and §2.7 (main);
  - HigherHidaAndColemanTheory §§6.6 and 9.5 (board package).

  All three suppliers precede this roadmap in ORDER.txt or are on main.
- **Files.** `sources.toml` parses, with the six ids unchanged. `plan.json` parses and only the `gaps` entry for `hilbert-siegel-models` changed (checked by structural comparison).
- **Gate failures.** None were listed for this round.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §6.1 admissible tuple | p=3, n=1, (ε,w,u)=(1/4,1/8,1/16) and ε=3/4 | bound 1−1/2=1/2; 1/4≤1/2, 3/4>1/2 | first admitted, second excluded |
| §6.1 u-analyticity | order-3 χ of ℤ₃^×, u≤1 vs u>1 | ℤ₃^×∩(1+3^uO)=1+9ℤ₃ for u>1; for u≤1 identity theorem forces χ(4)=1, but χ(4)=ζ₃ | analytic iff u>1; needs n≥2 since (2,3/2,3/2,3/2) has 3/2≤3/2 |
| §6.1 transition direction | (1,1/4,1/8)→(2,1/2,1/4) at p=3 | 1/2≤3/2; (1−3^{−1/8}z)^{−1}: on the w=1/4 disc \|3^{−1/8}z\|≤3^{−1/8}<1, with a pole at z=3^{1/8} in the w=1/8 disc | map only toward larger parameters |
| §6.4 slope ranges | F=ℚ, Ω(k,r): m=k+1 | m−3=k−2, m=k+1 | agrees with HigherHidaAndColemanTheory §9.6 item 4 |
| §6.5 composite | (2,2) and (5,2), F=ℚ, I={p} | geometric bounds 1 and 4; all-degree BGG −2 and 1; H⁰ bound 1 and 4 | slope 0: H⁰ iso and H¹ inj only, versus full q-iso |
| §6.6 inequalities | dims (1,2),(1,1),(1,1) | χ = −1, 0, 0; β: 1→1 iso, 1→2 inj; r: 1→1 inj, 1→1 surj | maps alone allow strict χ^an<χ^geo |
| §6.6 witness reduction | add (p−1)p^N | parity kept, as (p−1)p^N is even for odd p; l_v=2 on I kept | density in W_cl holds |
| §4.4a | (α,β)=(1/3,3), p=3, k_v=4 | normalized valuations (−1,1,2,4), sum 6; Hodge (0,0,3,3), sum 6; first slope −1<0 | excluded; endpoints alone do not detect it |
| §4.4a, ℚ case | k_v=k+2 | Hodge (0,0,k+1,k+1); hyperspecial needs k≥1, so k_v≥4 by parity; Klingen k_v≥2 | matches P20 Corollary 14.9.1 |
| §4.4a local isolation | α,β units | pair-product valuations 2−k_v, 1, 1, k_v; distinct from 2−k_v for every k_v≥2 | HigherHidaAndColemanTheory §9.5 applies |
| §9.2 coefficients | O=ℤ_{p²}, C=ℤ_p[0]; O=ℤ_p | ℤ_p-ranks 1 vs 2 before; after extension 2 and 2 (O-rank 1) | the extension is needed; identity when O=ℤ_p |
| §2.1 locator | BPS lines 736, 768–771, 776, 786 | printed p.17 holds the §4 intro; p.18 holds §4.1.1–4.1.2 | corrected (2 sites) |

## Ownership and consequences for other roadmaps

- **§4.4a ownership.** This roadmap owns the Katz–Mazur target §4.4a; no roadmap on main, in the board packages or at the open heads states it. HigherHidaAndColemanTheory §9.8's ℚ route ("isolated spherical refinement of §9.5 for the weight-large equality of dimensions") has the same unowned input as P20 Lemma 14.8.3, which uses Corollary 14.9.1. That roadmap could cite PadicFamiliesPartII §4.4a with F = ℚ, but it precedes this one in the merge order. Its maintainer should state the ℚ case there, or the order of ownership should be settled; no edit here can do it.
- **Changes visible to citing roadmaps.**
  - The heading §6.1 changed title but kept its number.
  - §4.4a is new.
  - No id was removed or renumbered. No other roadmap cites Layer 6 or Layer 4; GSp4NonregularModularityLifting cites only the former E6/S7/F8 ids, whose mapping table is unchanged.
- **Ownership against open pull requests.** I checked it against the 201 open roadmap pull requests this job lists, through `roadmaps grep`, and against the board packages.
- **Untrusted text.** No suspicious instructions were found in the review or in the fetched text.

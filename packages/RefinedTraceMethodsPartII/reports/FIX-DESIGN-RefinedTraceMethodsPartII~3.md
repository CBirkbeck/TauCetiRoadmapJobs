# FIX-DESIGN-RefinedTraceMethodsPartII~3

Review settled: REV-DESIGN-RefinedTraceMethodsPartII~2 (findings F01–F04). Files edited: `packages/RefinedTraceMethodsPartII/design/README.md`, `packages/RefinedTraceMethodsPartII/design/plan.json`, `packages/RefinedTraceMethodsPartII/sources.toml`.

## F01 (P2) — applied

I checked this against akn-delta Definition 8.1 (line 1701–1704: `c : H → sc_p(N)` is a map of `(ℕ,≥)×ℤ`-filtered modules, and H and N are p-complete), Construction 7.3 (line 1557), the mod-p map `sc_p(N)/p → N^{≥p⋆}/p` (lines 1693–1699) and the proof of Lemma 8.5 (lines 1763–1769). The finding is right. With `c : H^{≥0} → N^{≥0}` the axioms give no map `N^{≥j} → N^{≥j−i}`. On the absolute 𝔽₂ package the naive reduction `8b ↦ 4b` is nonzero while `can` is zero, so it cannot factor as `can ∘ α`.

Changes:
- **§8.2 definition.** Old: "c a φ_A-semilinear map `H^{≥0} → N^{≥0}`". New: H and N are p-complete and complete, and `c : H → sc_p(N)` is a filtered semilinear map. `sc_p(N)` is described with its 0-th piece `N^{≥0}` and its mod-p map to `N^{≥p·⋆}/p`, so mod p c induces `H^{≥m}/p → N^{≥pm}/p`. cφ is spelled out in the syntomic complex.
- **Finite-stage bullet.** The mod-p cφ is now defined as the composite through `N^{≥p(j−i)}/p`, which exists only modulo p. "is not itself an equivalence" becomes "need not be an equivalence (zero on absolute 𝔽₂ at i = 1, j = 3)". The proof idea of Lemma 8.5 is added (lines 1759–1769). The map on the quotients is the one induced by the comparison square.
- **Second Check.** It now states that the sc_p-induced cφ factors through `can : N^{≥4}/2 → N^{≥2}/2 = 0`. It also states that the naive `8b ↦ 4b` is nonzero, so the factorization needs the filtered c.
- **plan.json 8.2.** The statement, the locator (Construction 7.3, lines 1689–1699) and test `F2_weight1` mirror these changes.

The same pattern appears in §8.3: the package `Δ_{R/A}` named c without its filtration. It now says that c is the filtered map `Δ^{[⋆]}_{R/A}{⋆} → sc_p(N^{≥⋆}Δ̂^{(1)}_{R/A}{⋆})` of akn-delta Lemma 7.5 (line 1579). plan.json 8.3 (statement, locator) and the `akn-delta` locator in `sources.toml` (Construction 7.3; Lemma 7.5) are updated to match. §8.4 (line 719) defines cφ through Definition 7.7 of the source and needs no change.

## F02 (P3) — applied

A script parses every `*Needs:*` line and expands each range against the headings of the cited roadmap: QWittVectors, PrismaticCohomology, PrismaticCohomologyPartII and PartIII, KTheoryFiniteLocalFields and RefinedTraceMethods at their current heads. It then compares the result with plan.json. Only sections that exist are added, for example PrismaticCohomology has no §0.75 or §2.11.

The seven targets the review named are fixed:
- 3.5: added RefinedTraceMethods §2.9 and Mathlib `Pi.addCommGroup`. The README now reads Mathlib `AddCommGroup`, `Pi.addCommGroup`; `Pi.addCommGroup` is the `to_additive` form of `Pi.commGroup`, Mathlib `Algebra/Group/Pi/Basic.lean` line 119.
- 5.3: added targets 3.2 and 3.3.
- 5.4: added RefinedTraceMethods §4.17.
- 8.3: added PrismaticCohomology §§1.2, 1.3, 2.1–2.10, 2.12, and PrismaticCohomologyPartII §§4.4–4.9, 4.19, 4.25.
- 8.6: added targets 8.3 and 8.4.
- 9.2: added PrismaticCohomologyPartIII §7.0.
- 9.4: added target 8.2 and PrismaticCohomology §§0.73, 0.74, 0.76.

The same pattern elsewhere:
- 8.1: added PrismaticCohomology §0.74.
- 9.1 and 9.5: added KTheoryFiniteLocalFields §§1.2–1.6.
- 1.3: added `Nat.Coprime`.
- 1.5: added `Rat`.
- 4.3: added `Ideal`.
- 2.1: the README now names `Ideal.Quotient.mk`, as the plan does.

After the repair the script finds no README entry missing from the plan. Its only remaining output is the parenthesised supplier references (AInfCohomology §AI.7.2, BordismFormalGroups §F6.5), which the README does list.

## F03 (P3) — applied

Checked against riggenbach-double Corollary 5.8 (line 517) and Lemma 5.13 (lines 668–674), and hn-cusp lines 304–311. The degree-0 homotopy of `THH(R;ℤ_p)^{hC_{p^n}}` is `A_inf/(d·d̃_n) ≅ W_{n+1}(R)`; for 𝔽_p it is `ℤ_p[u,v]/(uv−p, p^n v)`, whose degree 0 is `ℤ/p^{n+1}`.

- **§3.4.** Old: "on π_0 and in even degrees `V : W_{n−1} → W_n`; on positive even degrees of hC `W_n → W_{n+1}`". New: Tate constructions in every even degree and hC in negative even degrees: `W_{n−1} → W_n`. hC in even degrees ≥ 0: `W_n → W_{n+1}`, with the π_0 formula.
- **Check n = 2.** Now gives both values, `tC_{p²}`: ℤ/p² and `hC_{p²}`: ℤ/p³, with the transfer as `V : W_1 → W_2` and `V : W_2 → W_3`.
- **plan.json 3.4.** The statement and test `Fp_n2` mirror this.

Other uses of the same object agree with the corrected form: the §3.5 Examples (`A_v = W_{v+1}(k)`), the §7.1 Check (`ℤ/p → ℤ/p²` for `hC_1 → hC_p`) and §6.1 (multiplication by p^u).

## F04 (P3) — applied

In §4.2's non-example, the old "`ℤ → ℤ/p`, ℤ → ℤ/p with I = pℤ" is replaced. The square is now the reduction map f : A = ℤ → B = ℤ/p with I = pℤ and `A/I = B/f(I) = ℤ/p`. It is not a Milnor square because f(I) = 0. Its birelative term is `K(ℤ,pℤ)` (because `K(ℤ/p, 0) = 0`). The conclusion and the citation (RefinedTraceMethods §4.17 Checks) are kept. plan.json 4.2 test `non_milnor` mirrors it.

## Checks

**Dependency gate:**

```text
candidate: RefinedTraceMethodsPartII is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 56 roadmaps, 650 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No supplier was added beyond those already cited, and every added prerequisite is a section of a roadmap the README already cites.

**Citations.** I ran `roadmaps resolve` after the edits. It reports no cross-roadmap citation and no Lean name that is found nowhere.

The worker's lead (`BigWitt.TruncationSet`, README line 97) is a false positive. It is QWittVectors §1.1's structure, declared in QWittVectors' `Suggested.lean` as `TauCetiRoadmap.QWittVectors.BigWitt.TruncationSet` (`structure TruncationSet`, line 71 of that file at its head). It is not a Mathlib or Tau Ceti name.

**Suggested.lean.** There is none at the design stage, so the `#check` comparison and elaboration do not apply.

**Ownership.** No new construction was introduced. The filtered `sc_p` structure belongs to the existing §8.2 target, which this roadmap already owns (see the earlier ownership record: no roadmap on main or open plans cohomology relative to a δ-ring).

**Sources.** No new source was fetched. Every locator added is to akn-delta, riggenbach-double or hn-cusp in the cache, and I read each at the line cited. `needs-references.toml` is not written.

## Adversarial pass (changed statements)

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §8.2 mod-p cφ via `sc_p` | abs. 𝔽₂, i=1, j=3 | `can: 8ℤ₂/16 → 4ℤ₂/8` is 0. sc_p route `N^{≥4}/2 → N^{≥2}/2`, `16b ∈ 8ℤ₂`, is 0. So `can − cφ = 0 = can∘id`. Naive `8b ↦ 4b ≠ 0` | factorization holds only with the filtered c | definition and Check repaired |
| §8.2 compatibility with the integral cφ | `sc_p(N)^{≥0} = N^{≥0}`, mod-p map at level 0 | level 0 of `…→𝔽_p →0→ 𝔽_p` maps to `…0→𝔽_p` by the identity. So the mod-p cφ followed by `can` to `N^{≥0}/p` is the reduction of `N^{≥j} → N^{≥0}`. 𝔽₂: integral `8b ↦ 4b ∈ ℤ₂`, which is 0 mod 2 | consistent | stated in bullet |
| §8.2 bound | (p−1)j > pi ⟺ p(j−i) > j | p=2, i=1: j=3 gives 4 > 3 ✓; j=2 gives 2 > 2 ✗ | equivalence verified | stated |
| §8.2 BK Check under new definition | `(ℤ₂⟦z⟧, ℤ₂)`, i=1, j=3 | `φ(E) ≡ E²` mod 2, so sc_p-induced = naive. `can − cφ` on `N^{≥3}/2`: `f ↦ z(f − z f²)`, an automorphism followed by can. Formula (k, k²); j=2: (0, k) | unchanged Check stays correct | none |
| §8.3 c refines c₀ | oriented transversal prism, d | `φ_A(d) = d^p + pδ(d)`: `d^p ∈ N^{≥p}` (weight 1 of `N^{≥p⋆}`), `pδ(d) ∈ p·N^{≥0}` (weight 1 of `p^⋆ℤ`) | in filtration 1 | added clause |
| §3.4 transfer indices | 𝔽_p, n=1, 2; negative degrees | hC: π₀ `ℤ_p/p^{n+1}`; transfer `ℤ/p → ℤ/p²` (n=1) and `ℤ/p² → ℤ/p³` (n=2), ×p. Tate: `0 → 𝔽_p` (n=1), `𝔽_p → ℤ/p²` (n=2). hC degree −2: v with `p^n v = 0`, `ℤ/p^n`, so `W_{n−1} → W_n` | corrected statement matches all | statement and Check repaired |
| §3.4 positive degrees | 𝔽_p, degree 2, n=1 | `p²u = p·u·uv = u²(pv) = 0`, so `ℤ/p² = W_2` | matches `W_{n+1}` | none |
| §4.2 non-example | A=ℤ, B=ℤ/p, I=pℤ | f(I)=0, not an ideal isomorphic to I. `K(B, 0) = 0`, so birelative = `K(ℤ, pℤ)` | well-formed non-example | rewritten |
| 3.5 Mathlib names | `Pi.addCommGroup` | exists as `to_additive` of `Pi.commGroup` (Algebra/Group/Pi/Basic.lean:119), used in Algebra/Ring/Pi.lean:55 | exists at pin | Needs updated |

## For the maintainer

- No name that other roadmaps cite changed. The §8.2 definition of prismatic packages now carries the filtered `c : H → sc_p(N)`, and consumers of `C_A` (none outside this roadmap) should read it that way.
- Ownership against open pull requests was checked through `roadmaps grep` in the earlier round. No new object was introduced in this round.
- Nothing suspicious was found in the review text.

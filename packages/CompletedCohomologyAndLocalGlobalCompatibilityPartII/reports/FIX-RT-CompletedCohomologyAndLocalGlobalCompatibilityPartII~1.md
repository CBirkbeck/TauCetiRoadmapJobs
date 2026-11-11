# Repair report: red-team round 1 of CompletedCohomologyAndLocalGlobalCompatibilityPartII

Files changed: `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md`, `design/plan.json` (top-level `gaps` only), `sources.toml` (new key `AB`). `Suggested.lean` and `metadata.toml` are unchanged: the Lean file declares nothing, and no finding touches a statable headline.

## RT-CompletedCohomologyAndLocalGlobalCompatibilityPartII~1a/F01 (P2) — applied

gap:berthelot-points-components (README and plan): "components are the generic fibres of the connected components of the normalization" → "components, with reduced structures, are the images under the normalization map of the rigid generic fibres of those connected components" (CON line 1059–1061). §5.2 route now says why the images are the fibres (Spf R□,χ)^rig (closed immersions); cusp Check added to §5.2.

## RT-CompletedCohomologyAndLocalGlobalCompatibilityPartII~1a/F02 (P2) — applied

§3.4 now defines `Cδ(H,L)={f : f(zh)=δ(z)^{-1}f(h), z∈Z_H}` with left translation, so z acts by δ(z) (DPS lines 1981–1984; BIP lines 2436–2439), and relates it to §3.5's fixed-centre regular module. Three Checks added: Z_H=1; H=Z_H=ℤ_5^×, δ(z)=z (line of h↦h^{-1}, 2 acts by 2; opposite convention gives 1/2); the constant 1 is excluded.

## RT-CompletedCohomologyAndLocalGlobalCompatibilityPartII~1a/F03 (P2) — applied

Verified: EP Proposition 3.25 (EP line 902) asserts |I(n)|∼q_E^n at every depth, false where gcd(n,e)≠1. §3.3's count now sums over admissible depths only, which have bounded gaps (α₀^j, j≡1 mod e(q_E−1), EP Lemma 3.16; all depths for unramified E). Negative-control Check E=ℚ_5(√5) added. gap:minimal-stratum-types restricts the count likewise; §6.5 points to §3.3.

## RT-CompletedCohomologyAndLocalGlobalCompatibilityPartII~1b/F01 (P1) — applied

Verified: parent §5.2(1) covers only K-types σ^{(cr)}(h,τ); EP lines 1206–1209 just refer to CEGGPS Lemma 4.17(1). Added gap:smooth-test-quotients (parent §5.2): reduced O-flat faithful quotients for smooth tests on every open H, with inertial-type recognition and an N=0 clause. §§3.2, 5.3, 5.4, 6.5, their Needs and the Layer 3/5/6 Dependencies cite it. Steinberg K-type Check added to §5.3.

## RT-CompletedCohomologyAndLocalGlobalCompatibilityPartII~1b/F02 (P2) — applied

§2.2 (formerly §2.3) now gives the dictionary: twisting identifies R_detρ̄ with the parent's Λ_Z and xψ with x_Z (x_Z(c)=δ(c)). Λ_Z acts on M∞ by transposition, so c∈Λ_Z acts as the group element c⁻¹ (CEGGPS lines 2759–2765). Projectivity comes from the parent's Λ[[K]]-projectivity (Cor. 4.26). Check added: d=1, ℚ_5, x_Z(5)=[2] while 5 acts by [3].

## RT-CompletedCohomologyAndLocalGlobalCompatibilityPartII~1b/F03 (P1) — applied differently

The inputs are now stated in §3.3: (a) coinvariant growth, from CompletedCohomologyPartII §5.8 (the exact owner, not NoncommutativeAndEquivariantIwasawa); (b) the domain property, via new gap:torsion-free-iwasawa-domain (NoncommutativeAndEquivariantIwasawa §0.11; AB §4.3), plus grade and global dimension from its §§F.1, 0.11; (c) EP Lemma 2.22 is stated here. §0.9 is not needed. Supplier subsection added; Checks added.

## RT-CompletedCohomologyAndLocalGlobalCompatibilityPartII~1b/F04 (P2) — applied differently

The descent sentences in §1.2 and §4.2 are replaced, and the Conventions now say that M∞ is built over the standing O, which contains every χ-value. §4.1 proves 𝔮∩R=𝔭χ without coefficient enlargement by a dimension count (LocalGaloisDeformationRings §F.0.1, DeformationAndDerivedPatchingAlgebra §1.12) rather than going-down, which needs R∞ to be flat over R□, a fact no supplier states. A dimension Check is added.

## RT-CompletedCohomologyAndLocalGlobalCompatibilityPartII~1b/F05 (P2) — applied

gap:algebraic-capture is split into gap:capture-formalism (Lemmas 2.2–2.5, 2.7–2.9 and 2.14–2.17 stated in words, tensor stability only for W≠0) and gap:algebraic-capture (EP Proposition 3.1 alone). gap:principal-series-types and gap:minimal-stratum-types are rewritten as explicit statements: objects, dimensions, invariants, non-isomorphism, counts and occurrence. Changed in the README and plan; the duplicated prose paragraph is shortened.

## RT-CompletedCohomologyAndLocalGlobalCompatibilityPartII~1b/F06 (P3) — applied

Verified: nothing cites the old §2.2, and BIP lines 2447–2483 do not use Lemma 6.4. Deleted §2.2 with its Checks, and renumbered the old §2.3 to §2.2, updating the internal citations in §4.1, Layer 4 and Worked examples. LocalGaloisDeformationRings §1.19 moves to §2.2's Needs. ClassFieldTheory Layer 7 stays, because §2.2 uses it. The Conventions' "character-root theorem" mention is removed.

## Checks run

- `lake env lean packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/Suggested.lean` (from the content checkout): exit 0, no output. No `TauCeti.*` import, so nothing was built first.
- Mechanical `#check @name` comparison: not applicable. `Suggested.lean` declares no `def`, `theorem` or `instance`, so there is no elaborated signature to compare. The README names no backticked Lean declaration of this roadmap's own.
- Dependency check (`gate --depcheck … --movable`):

```text
depcheck: 231 roadmaps, 2083 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line. The two suppliers added here, NoncommutativeAndEquivariantIwasawa and CompletedCohomologyPartII §5.8, are both earlier in the merge order. CompletedCohomologyPartII was already a supplier.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- Sources: AB (Ardakov–Brown, arXiv:math/0511345v1) was fetched through the sources service and recorded in `sources.toml` (certified, open repository). No `needs-references.toml` was produced.
- Gaps: the 16 README contract slugs equal the 16 `gaps` entries in `design/plan.json`, matching by supplier and section. Only the top-level `gaps` key of the plan differs from the previous commit.

## Gate failures

- tex=37 (TeX-style `_{…}`/`^{…}` outside code spans, from the README contract for gap:principal-series-types and seven other lines written in this round): the formulas in the two SmoothRepresentationsOfLocalGroups contracts (gap:principal-series-types, gap:minimal-stratum-types), in §2.2 (`R_{detρ̄}`), in §3.3 (the proof sketch and the ℚ_5(√5) Check) are now inline code spans. In §3.4 and its two Checks, `^{-1}` became `⁻¹`. The `needs` of the two gaps in `design/plan.json` were updated the same way, so they still equal the README contract sentences. No mathematics changed: once backticks are removed and `^{-1}` is read as `⁻¹`, the README is identical to its earlier state, and nothing in the plan outside `gaps` changed. A count afterwards found 0 hits outside code spans and no line with an odd number of backticks. Re-run afterwards: `lake env lean` on `Suggested.lean` (unchanged) exited 0, and the dependency check output is shown above.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| gap:smooth-test-quotients | V=0; H=K with V=σ(τ); Vχ; V(α,θ); inflated Steinberg K-type, d=2 | zero test → zero ring, reduced and flat, no points; parent §5.2(1) recovered; principal series: N=0 forced; supercuspidal: inertial restriction of an irreducible parameter forces an unramified twist, same restriction to K; Steinberg: π with N≠0 and N=0 both contain it, so the clause is off | true as stated; Check added (§5.3) |
| gap:capture-formalism | empty family; H={1}, M=O, W=0; M=O/ϖ | kernel M; W=0 tests give kernel O, so W≠0 is needed; torsion module not captured | consistent with §3.1 Checks |
| gap:algebraic-capture | 𝐆=Res GL_d over O_F, L containing embeddings of F | generic fibre split, so EP Proposition 3.1 applies | true |
| gap:principal-series-types | d=1; i=d conductor bound | χ_d of conductor n−d+1≥n₀ needed for X(n)≠∅; d=1 gives q^n characters | n−d+1≥n₀ added |
| gap:minimal-stratum-types | ℚ_5(√5), n even/odd; unramified E | even: no minimal α, count 0; odd: ≍q_E^n; unramified: every n | count restricted to admissible depths |
| §3.3 admissible depths | α₀ of valuation −n₀, j≡1 mod e(q_E−1); inverse of a minimal element | gap e(q_E−1)n₀; inverse has gcd(e,−v)=1 and inverse residue | bounded gaps hold |
| §3.3 (b) | H=ℤ_p×ℤ/p | k[[H]]≅k[[T]][s]/(s^p), s·s^{p−1}=0; k[[H]]/(s)≅k[[T]] has δ=1=dim H but k[[T]]-rank 1, not a multiple of p | torsion-freeness needed; Check added |
| §3.3 (c) | H=ℤ_p, Π=functions mod p^j | dim Π^{H_n}=p^j against [H:H_n]=p^n | criterion correctly inapplicable; Check added |
| §3.3 (a) | ℤ_p², anisotropic filtration (existing Check) | p^{2n} against p^{3n/2} | power filtration required, as in CompletedCohomologyPartII §5.8 |
| §3.4 Cδ | Z_H=1; H=Z_H=ℤ_5^×, δ(z)=z; constant 1 | C(H,L); line of h↦h^{-1}, (2·f)=2f; opposite convention gives h↦h with action 1/2; 1≠2^{-1} | sign pinned; three Checks |
| §2.2 dictionary | d=1, F=ℚ_5, ψ(Art 5)=[2]; d=2, ψ=1, u=2 (existing) | x_Z(5)=[2], group action [3] since [2][3]=[1]; δ(2)=2, compact action 1/2 | matches BIP Lemma 6.6; Check added |
| §4.1 contraction | R=O[[u]], A=O[[x]]/(x(x−ϖ)); prime (x,u) | minimal primes (x),(x−ϖ): dim 2=2+1−1, contraction 0; (x,u): dim 1, contraction (u), dim R/(u)=1<2 | argument needs minimality, which holds; Check added |
| §4.1, χ-values without enlargement | F=ℚ_p(ζ_p), d=1 | μ_p(F)⊂σ(F)⊂L, so all χ are O-valued and R[1/p]=∏R□,χ[1/p] over O | Conventions remark added |
| gap:berthelot-points-components | A=ℤ_5[[x,y]]/(y²−x³); A=R□ | disc→cusp bijective, tangent dimensions 1 against 2; for R□ the normalization is ∏R□,χ, closed immersions | images, not fibres; for R□ they coincide; Check added |
| §5.2 local route | L as in the Conventions | no further extension needed for R□[1/p]=∏R□,χ[1/p] | wording aligned |

Context check: the README's generality matches the gap statements (every open H, every smooth V, every O and k of a finite extension). No Lean binders are involved.

## Ownership against open work

- The coinvariant growth belongs to CompletedCohomologyPartII §5.8, at the head of its open pull request, and is cited, not restated.
- Grade, global and canonical dimension belong to NoncommutativeAndEquivariantIwasawa §§F.1, 0.11, at the head of its open pull request.
- The domain property for torsion-free compact p-adic analytic groups has no owner. I searched main and the open heads for a domain or zero-divisor theorem for Iwasawa algebras and found none, so it is declared as gap:torsion-free-iwasawa-domain at NoncommutativeAndEquivariantIwasawa §0.11. That section owns the finite global dimension the proof uses.
- Reduced quotients for smooth tests: the only statements are the parent's §5.2 for K-types σ(τ), and searches for EP Theorem 5.3 and CEGGPS Lemma 4.17 found no other owner. So this is gap:smooth-test-quotients on the parent.
- No declaration name is introduced.

## For the maintainer

- **New supplier gaps for other roadmaps.**
  - CompletedCohomologyAndLocalGlobalCompatibility: gap:capture-formalism and gap:algebraic-capture (§5.3, replacing the old compound gap:algebraic-capture), and gap:smooth-test-quotients (§5.2).
  - NoncommutativeAndEquivariantIwasawa: gap:torsion-free-iwasawa-domain (§0.11).
  - SmoothRepresentationsOfLocalGroups: gap:principal-series-types and gap:minimal-stratum-types (§SR.5.2), with sharpened statements.
- **Parent §5.1's central-character label.** The parent §5.1 says the specialisation has "compact character ξ(c)=x_Z(c)" and smooth-dual character ξ⁻¹. This is CEGGPS's printed labelling (CEGGPS lines 2867–2875), which is reversed relative to the transposition of CEGGPS lines 2759–2765, as BIP Lemma 6.6 shows. This roadmap now reads it through the dictionary in §2.2. The parent may want to say that ξ is the Λ_Z-character. That is outside this package.
- **Renumbering.** The old §2.3 is now §2.2. No roadmap on main or in an open pull request cites this roadmap, so no mapping table is needed.
- **Source issues found while verifying.**
  - EP Proposition 3.25 (p. 358) asserts the per-depth count at depths with no minimal element.
  - EP Lemma 2.6 fails for W=0.
  - CEGGPS §4.22, before Corollary 4.26, labels the compact and smooth central characters the opposite way to the transposition.
  - EP p. 349 cites Ardakov–Brown "Th. 4.3"; in arXiv v1 that is the unnumbered Theorem of §4.3.
- **Fetched text treated as data.** No suspicious instructions were found in the reviews, the sibling roadmaps or the sources.

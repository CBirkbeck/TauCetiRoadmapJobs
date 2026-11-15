# FIX-DESIGN-RationalAnalyticPrismatization~16

This round handles the findings of REV-DESIGN-RationalAnalyticPrismatization~15. There is one review, so the ids are unqualified. Files changed: `packages/RationalAnalyticPrismatization/design/README.md` and `packages/RationalAnalyticPrismatization/design/plan.json`. `sources.toml` is unchanged: no new work is cited, and the new locators (ALRS Proposition 5.8.10 proof of (3), ABLB Definition 4.3.6) are already in the manifest's locator lists. The package has no `Suggested.lean` at the design stage.

All five findings are right and all are applied. No section, target or layer id changed.

## F01 (P2) — applied

Old (11.8, README and `plan.json`): "π_{X,1}: X^HT → X × K^HT", "descending … to X × K^HT", "L_{X^HT/(X×K^HT)}". New: "π_{X,1}: X^HT → X ×_{GSpec(K)} K^HT = X × Q_p^HT, where K^HT = GSpec(K)^HT ≅ GSpec(K) × Q_p^HT by 9.1 (T_{GSpec(K)} = 0)". The other two occurrences now have the base ×_{GSpec(K)}. *Needs* gains §9.1 (`plan.json` prerequisite `target:9.1`). New Check `mixed_base`, the ℚ_{p²} witness.

Verification:
- ALRS line 8146–8152 writes the product without a base.
- By the README's own 9.1, π_X: X^HT → X × Q_p^HT is a gerbe banded by T_X^†{1}. For GSpec(K) with K/ℚ_p finite étale, T = 0, so K^HT ≅ GSpec(K) × Q_p^HT.
- For K = ℚ_{p²} and X = GSpec(K), K ⊗_{ℚ_p} K ≅ K × K. So the product over ℚ_p is K^HT ⊔ K^HT, and X^HT = K^HT lands only on the diagonal copy. That map is not a torsor under B0.
- With the base, π_{X,1} = id and (1) becomes 9.1 with T_X = T_{X/K}.

Pattern search: I searched for "K^HT", "× K", "×K^" and every unsubscripted "A × B" whose factors live over K. Besides 11.8, the only use of K^HT is 11.10 ("recovers K^HT = GSpec(K(μ_{p^∞}))/Γ^la"), which is not a product and is correct. 9.1, 10.10, 11.2 and 11.5 form products over ℚ_p or over a perfectoid D, as intended. 11.1 already has the twisted fibre product.

## F02 (P3) — applied

Old (10.11, README and `plan.json`): "Z = BU × X^la/G^la with U open in H(ℚ_p)^la". New: "U an open subgroup of 𝐇(ℚ_p)^la = 𝐇^an ×_{𝐇^{an,dR}} 𝐇(ℚ_p)^dR (3.4) for an affine algebraic group 𝐇 over ℚ_p".

Further changes:
- Proof route, old: "reduce to T = BH^an via the cartesian squares". New: pass along BU → B𝐇(ℚ_p)^la, then use the square B𝐇(ℚ_p)^la = B𝐇(ℚ_p)^sm ×_{B𝐇^{an,dR}} B𝐇^an. For BΓ^la, shrink Γ, use algebraic Lie algebras, and induct on dim Lie(Γ) (ALRS line 7654).
- New `plan.json` hypothesis and new Check `torsor_algebraicGroup`.

Verification:
- ALRS line 7634–7635 has an affine algebraic group over ℚ_p and the definition of 𝐇(ℚ_p)^la, which is 3.4 applied to 𝐇^an.
- In the README sentence, H is first a compact p-adic Lie group (Lemma 5.8.8), and "H(ℚ_p)" means nothing for it.
- The old route also wrongly sent BΓ^la through H(ℚ_p)^la for every Γ. ALRS line 7654–7700 instead uses exponential groups, the abelian and semisimple base cases, and induction through an abelian extension. The route now says so.

The bold 𝐇 does not collide with any other letter: the README uses 𝒢 for rigid groups (10.3) and H only for p-adic Lie groups.

## F03 (P3) — applied

Old (11.3, README and `plan.json`): "Γ_d = ℤ_p^{×,la} ⋉ ℤ_p^{d,la}". New: "Γ_d = ℤ_p^× ⋉ ℤ_p^d, the p-adic Lie group in which ℤ_p^× acts on ℤ_p^d by multiplication (the group G_mixed of 10.10 with ℤ_p(1) trivialized), so that Γ_d^la = ℤ_p^{×,la} ⋉ ℤ_p^{d,la}".

Verification:
- ALRS line 396 and line 4693 define Γ_d as the la-stack and then write Γ_d^la and Γ_d^cont. Under the Conventions, (−)^cont and (−)^la apply to p-adic Lie groups only.
- The new Γ_d makes Γ_d^cont in 11.3 (statement and third Check) and in 12.x (line 1890) well defined. I checked both uses.
- The action matches 9.9: (a, b)(a′, b′) = (aa′, a′b + b′) from (a, b)·(q♭, T♭) = (q♭^a, q♭^b T♭).

## F04 (P3) — applied

Old (2.6, README and `plan.json`): "static quotient of an overconvergent Tate algebra K⟨T_1,…,T_n⟩_{≤r} (ABLB Definition 4.3.6". New: "… K⟨T_1,…,T_n⟩_{≤r} for some r > 0 (ABLB Definition 4.3.6". ABLB line 2386 has "for some r > 0".

New Check (`berk_daggerRadius`, non-example):
- K⟨T⟩_{≤0} is the ring of germs at 0, with T ∈ Nil†, and its spectrum is one point.
- It is no static quotient of K⟨T_1,…,T_n⟩_{≤r} with r > 0. The argument works for every r > 0, including radii outside |K^×|: all h(g_1,…,g_n) converge on one fixed disc |T| < ρ, so 1/(1 − T/c) with |c| < ρ is not in the image.

Pattern search: "_{≤r}" elsewhere is the intended r ∈ ℝ_{≥0} of 1.2 (Nil† = A_{≤0}) or the radii of 10.3, which are restricted to (0, 1].

## F05 (P3) — applied

Old (2.6, second Check, README and `plan.json` `berk_compactification`): "… have the same Gelfand stack GSpec(ℚ_p⟨T⟩), so X ↦ X′ is not injective on rigid spaces that are not partially proper". New:
- The disc and Spa(ℚ_p⟨T⟩, ℤ_p + pℤ_p⟨T⟩) share the open affinoid algebra ℚ_p⟨T⟩, so both give GSpec(ℚ_p⟨T⟩).
- X′ does not see the integral elements and factors through the canonical compactification. That compactification is partially proper but not a rigid space.
- Full faithfulness is asserted only on partially proper rigid spaces.

Verification:
- RigidAnalyticGeometry §6.2 (main) defines rigid spaces as classical Tate spaces, so A^+ = A°.
- The canonical compactification has A^+ = integral closure of ℤ_p + A°°. Here A°° = pℤ_p⟨T⟩, because sup norms lie in p^ℤ. An f ∈ ℤ_p⟨T⟩ integral over ℤ_p + pℤ_p⟨T⟩ has reduction algebraic over 𝔽_p inside 𝔽_p[T], so in 𝔽_p. Hence A^+ = ℤ_p + pℤ_p⟨T⟩ ≠ ℤ_p⟨T⟩.
- The old conclusion compared a rigid space with a non-rigid one, so the example did not show what it claimed.

## Adversarial pass (changed and added statements)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 11.8(1) with base | K = ℚ_{p²}, X = GSpec(K) | X^HT = K^HT ≅ GSpec(K) × Q_p^HT (9.1, T = 0); X ×_{GSpec K} K^HT = K^HT; π_{X,1} = id, band T^† = 0 | holds | statement |
| 11.8(1) without base (old) | same | GSpec(K ⊗ K) × Q_p^HT = 2 copies; image = diagonal copy only | false | replaced |
| 11.8(1) general X | X smooth over K | X ×_{GSpec K}(GSpec K × Q_p^HT) = X × Q_p^HT; 9.1 gives gerbe banded by T_X^†{1} with T_X = T_{X/K} (K/ℚ_p étale) | holds | — |
| 11.8(2) | X = GSpec(K); X = A¹_K | L_{X^HT/(X×_K K^HT)} = 0 = Ω¹{−1}[−1]; L_{X^HT/X} = O[−1] (11.2, first Check); for A¹: L of BG_a^†{1}-torsor = O{−1}[−1] = Ω¹{−1}[−1] | holds | — |
| 11.8 Check 2 (G_m over K) | X = G_m | base X ×_{GSpec K} K^HT = G_m × Q_p^HT, as 9.5 uses | holds | — |
| 10.11 algebraic 𝐇 | 𝐇 = G_a; 𝐇 = GL_n | G_a(ℚ_p)^la = ℚ_p^la (3.4 first Check), U = ℤ_p^la open; GL_n(ℤ_p)^la = one coset of GL_n(ℚ_p)^la (10.3) | holds | statement, Check |
| 10.11 route for BU | U = 𝐇(ℚ_p)^la | square B𝐇(ℚ_p)^la = B𝐇(ℚ_p)^sm ×_{B𝐇^{an,dR}} B𝐇^an (ALRS line 7649); corners sm and dR are their own relative de Rham stacks (5.8.1(2)); B𝐇^an is the T^an case | holds | route |
| 10.11 route for BΓ^la | Γ = ℤ_p^n; Γ with semisimple Lie algebra; Γ with g = ℚ_p ⋉ ℚ_p | open in G_a^n(ℚ_p); open in 𝐇(ℚ_p) (g algebraic); induction: 0 → a → g → f → 0 with a = ℚ_p, dim f = 1 | holds | route |
| 10.11 trivial cases | Γ finite; G trivial | Γ^la = Γ^sm, own de Rham stack; B1 = point | holds | — |
| 11.3 Γ_d | d = 0 | Γ_0 = ℤ_p^×, Div¹ = FF^la_{ℚ_p^cyc}/ℤ_p^{×,la} (9.7) | holds | statement |
| 11.3 Γ_d | d = 1 | A = (log q)q∂_q, B = (log q)T∂_T: [A, B] = B since q∂_q(log q) = 1; Lie(ℤ_p^× ⋉ ℤ_p) has [a, b] = b | holds | — |
| 11.3 Γ_d^cont | d = 0 | O ⊗ C(ℤ_p^×, ℚ_p) against O ⊗ C^la(ℤ_p^×, ℚ_p) (third Check) | holds | — |
| 2.6 r > 0 | r = 0 | K⟨T⟩_{≤0} = germs, T ∈ Nil† (X ↦ T from ℚ_p⟨X⟩_{≤0}), A^u = K, M = point; image of K⟨T_1..T_n⟩_{≤r} has radius ≥ ρ, 1/(1 − T/c), \|c\| < ρ, missed | excluded | statement, Check |
| 2.6 r > 0 | r = 1, K = ℚ_p | ℚ_p⟨T⟩_{≤1} = colim_{r>1} ℚ_p⟨T/r⟩, †-rigid, Berkovich-smooth (third Check) | admitted | — |
| 2.6 r > 0 | r = 2 ∉ \|ℚ_p^×\| | radius argument does not use r ∈ \|K^×\|: \|g_i(T)\| ≤ r on \|T\| < ρ, h converges on radius > r | consistent | — |
| 2.6 one-point cover | M(A) = point | a †-rational localization onto all of M(A) admits a retraction A⟨f/g⟩ → A (1.6), and idempotence then gives A⟨f/g⟩ ≅ A | holds | — |
| 2.6 Check 2 | closed disc vs compactification | A°° = pℤ_p⟨T⟩; A^{+c} = ℤ_p + pℤ_p⟨T⟩ ≠ ℤ_p⟨T⟩; X′ = GSpec(ℚ_p⟨T⟩) for both | holds | Check |
| 2.6 Check 2 (old) | same pair | second space is not a rigid space (RigidAnalyticGeometry §6.2: A^+ = A°) | conclusion unsupported | replaced |

Every Check of 2.6, 10.11, 11.3 and 11.8 was re-read against the changed statements, and the values are recorded above. Each of these subsections now has 4–5 Checks. Every target and test statement of `plan.json` occurs verbatim in the README (scripted: 0 missing).

## Checks run

Dependency check (gate), output:

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 238 roadmaps, 2273 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. Between my two runs the roadmap and edge counts changed (239/2277, then 238/2273). That reflects the live index of open pull requests, not this edit.

The `#check` elaboration pass was not run, because the package has no `Suggested.lean` at the design stage.

## Gate failures

None listed for this round.

## Notes for the maintainer

- No id that other roadmaps cite changed. 2.6, 10.11, 11.3 and 11.8 keep their numbers. No `plan.json` target name changed. Three test names were added: `mixed_base`, `torsor_algebraicGroup` and `berk_daggerRadius`.
- No new cross-roadmap citation was added, and no supplier changed. Ownership is unchanged: the edits only correct this roadmap's own statements, so no construction was newly claimed. I did not run a new ownership search against open pull requests in this round; the review's audit of this head stands.
- No `needs-references.toml` was written: every passage used is in ALRS, ABLB or the roadmaps on main.
- Source issues confirmed while verifying: ALRS Theorem 6.3.2 writes the product without its base (line 8146). ALRS (1.2.1) and Remark 4.10.15 write Γ_d as a stack and then decorate it (lines 396, 4693). The README follows neither slip.
- No text in the review asked for anything outside this package. Nothing suspicious was found.

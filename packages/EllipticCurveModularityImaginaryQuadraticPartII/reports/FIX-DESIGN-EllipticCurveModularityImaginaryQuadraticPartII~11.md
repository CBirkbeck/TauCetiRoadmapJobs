# FIX-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~11

One review: `REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~10`, three P3 findings. All three
are right and are applied. The review's "For the human reviewers" section (scope, two licence notes)
lists no finding and changes nothing here.

## F01 (P3) — applied

Verified: ACC23 line 2313 fixes a dominant weight `λ ∈ (ℤⁿ₊)^Hom(F,E)` together with the good subgroup,
and the Hecke algebra of Theorem 3.1.1 acts on `RΓ(X_K, V_λ)` (ACC23 lines 2343–2349). §5.3 uses weight
zero: the complexes are CN23's `C•(K, O(χ⁻¹))` (CN23 lines 4318–4329), trivial algebraic coefficients with
a finite character at `R`, and full Iwahori level with trivial character at `P` (CaptainSude26 lines
299–301), i.e. `λ = 0`.

Changed: Supplier obligations "a good level `K`; a finite …" → "a good level `K`; a dominant weight `λ`
(Theorem 5.3 uses `λ = 0`); a finite …", and "the localized Hecke algebra generated together with" →
"the localized Hecke algebra of level `K` and weight `λ`, generated together with". The gap `detail` in
`plan.json`: "a good level;" → "a good level; a dominant weight λ (λ = 0 for 5.3);" and "Hecke algebra
with torus operators" → "Hecke algebra of weight λ with torus operators". `needs` unchanged.

Pattern: `λ` already denotes the unit power series of the Tate parameter in §§7.1–7.2 (`q_A = s³λ(s)`).
The Conventions record every reused letter, so their last bullet now adds: in the supplier obligations
`λ` is ACC23's dominant weight; in §§7.1–7.2 it is the unit power series. No other occurrence of `λ`.

## F02 (P3) — applied

Verified: §7.1(c) and its two Checks say the quotient fibre, before the `A₁` point is resolved, has two
rational components meeting at the image of the fixed node (the `A₁` point `z₁z₂ = s²`, thickness two)
and at the image of the exchanged pair (an ordinary node, thickness one); after resolution it is a cycle
of three rational curves. Check 1 recomputed: one fixed node gives two rational curves meeting twice,
arithmetic genus `2 − 2 + 1 = 1`. Three fixed nodes would give genus two.

Changed (§7.2, route for (a)): "no longer a cycle of type `I₃` with nodes of thicknesses two and one
before resolution" → "no longer two rational curves meeting in two nodes of thicknesses two and one
(type `I₃` once the thickness-two node is resolved)". Pattern: the other occurrences (§7.1(c), its Checks,
the 7.1 statement and the `width_thickness` test in `plan.json`) already say this correctly.

## F03 (P3) — applied

Verified: README §2.4 cites LeHung26 §5, lines 364–366 (page 9 begins at line 341, page 10 at 379), and
§8.1 cites LeHung26 Remark 1.3.1, line 125 (page 3 begins at line 95, page 4 at 140). The manifest's
`locator` lacked both.

Changed: `LeHung26` `locator` gets "; Remark 1.3.1 p.3; Section 5 p.9" appended. Pattern: the same gap
between the README's References and the manifest's `locator` was in four more entries. Appended:
CaptainSude26 "Section 4 setting p.6; paragraph after Lemma 5.1 p.11; proof of Theorem 1.1 p.14";
OpenAI26 "Proposition 9.3 p.26; Section 9.4 pp.27-28"; CN23 "Section 5.6 pp.81-87 (…)"; ACC23
"Theorem 3.1.1 p.58; Section 3.1 pp.57-58; Section 6.5.12 p.178". In the References: LeHung26
gains "Remark 1.3.1, p. 3", "Remark 4.2, p. 9" and "§5, p. 9 … the CM case (lines 364–366)", and
CaptainSude26 gains its paragraph after Lemma 5.1 (p. 11) and the proof of Theorem 1.1 (p. 14). I
checked every page against the page markers of the cached texts. No new source, no new key.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Supplier obligations, weight clause | ACC23 setting with `λ = 0` and `n = m = 2`; CN23 coefficient module | `V_0 = O`; CN23's `O(χ⁻¹)` has `KS → ∏_R Iw_v → O^×`, `diag(a,b,c,d) ↦ χ_v(a/d)` (CN23 lines 4311–4319): a finite character with no algebraic part, so the algebraic weight is `0`; at `P` the character is trivial, so the torus operators of `diag(u,1)`, `diag(1,u)` are `1` and `P_{v,σ} = (X − 1)²` (§5.3 Check 1) | consistent with §5.3 and its Checks | weight added |
| Supplier obligations, `λ = 0` vs a nonzero weight | `λ = (1,0)` at one embedding | `V_λ` would be the standard representation; weight-zero `π` (Hodge–Tate weights `{0,1}`, Conventions) has cohomology only with `λ = 0` | `λ = 0` is the one §5.3 needs | none |
| Conventions, letter `λ` | all occurrences | supplier obligations (two, the weight); §7.1 lines `q_A = s³λ(s)`, `λ(0) ≠ 0`; §7.2 `λ(0) ∈ O_{K_v}^×`, "`λ` converges to a unit" | two meanings, scoped | sentence added |
| §7.2 reduction condition | thickness before and after resolution; `m_v = 1, 5, 7` | `2 + 1 = 3 = 1 + 1 + 1`; `v(q_A) = 3m_v = 3, 15, 21`; quotient genus `2 − 2 + 1 = 1` with one fixed node | agrees with §7.1(c)–(d) | wording fixed |
| Manifest locators | page markers | LeHung26 p.3 at line 95, p.9 at 341, p.10 at 379; CaptainSude26 p.6 at 257, p.11 at 507, p.14 at 667, p.15 at 685; OpenAI26 p.26 at 1117, p.27 at 1161, p.28 at 1206; CN23 p.81 at 4196, p.87 at 4491; ACC23 p.57 at 2291, p.58 at 2332, p.178 at 7156 | every added page matches | locators extended |

## Checks

Dependency check (output in full):

```text
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2257 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

Other checks: `plan.json` parses as JSON and `sources.toml` as TOML after the edits. The citation resolver
run on the edited README lists only the three source-key leads (`LeHung26, §4.4`, `OpenAI26, §9.4`,
`CaptainSude26, §4`). These are sources, not roadmaps, so they are false positives, and it finds no Lean
name. This is a design with no `Suggested.lean`, so there was no elaboration and no `#check` comparison.
No gate failures were listed for this round.

## For the maintainer

- No Lean name, section, layer or target id changed, so no other roadmap's citation is affected.
- The gap `acc-torsion-inertial-comparison` (AutomorphicGaloisRepresentationsPartII AG2.5) now also
  states the weight. Its `needs` sentence is unchanged.
- No new supplier and no new source. Ownership is unchanged, so no new ownership search was needed.

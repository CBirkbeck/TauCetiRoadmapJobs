# FIX-DESIGN-QuasiRiemannHypothesis~6: repair of the design review

Review answered: `REV-DESIGN-QuasiRiemannHypothesis~5` (4 findings, all P3).
Files changed: `packages/QuasiRiemannHypothesis/design/README.md` (§§3.1, 8.4, 11.3, Downstream
consumers) and `packages/QuasiRiemannHypothesis/design/plan.json` (3.1 API `rescale`, 8.4 locator, 11.3
test `bims`). The plan still has 11 layers, 55 targets, 161 tests and `gaps = []`.
`packages/QuasiRiemannHypothesis/sources.toml` is unchanged: no new work is cited, and `kubota1968`
(`cited_for` 8.4), `bimsissac2017` (11.3) and `openai2026quasiRH` (11.3) already cover the sections
that cite them. No target was added, removed or renumbered. I read the review's "For the human
reviewers" section and changed nothing because of it.

## F01 (P3) — applied

§8.4 locator: after "`patterson1977` §3, (3.9)–(3.11), pp. 130–131" → added "; `kubota1968` p. 265 writes
the open interval `1 < s < 2`, and the pole at `s = 2` for trivial `χ` is the one of §8.3's example,
where `ζ_K(s − 1)` has its pole". `plan.json` 8.4 `locator.where` gains the same clause. The statement
`(1, 2]` stays as it is.

Evidence: `kubota1968` lines 235–236 (page 7 of the extraction, printed p. 265) give the poles in
`1 < s < 2`. §8.3's Check has `φ(s) = (π/(s − 1)) ζ_K(s − 1)/ζ_K(s)` for `SL₂(ℤ[i])`, `χ = 1`, and
recomputing gives `Res_{s=2} φ = π · (π/4)/ζ_K(2)` with `ζ_K(2) = ζ(2) G ≈ 1.50670`, so the residue is about
`1.63762`, which is nonzero.

Same pattern elsewhere: I looked for other places where the README's statement differs from what its
locator prints. §7.4 already says that the source takes `a₀ = 51/100`. The separation
`min(1, 1/r₊)/Y` of §10.2 and the Layer 6 Examples is pinned by a Check against `min(1, r₊)/Y`
(`1/√91 ≈ 0.105`, between `1/13` and `1`). The source's line there (`openai2026quasiRH` line 2179)
comes from an OCR of an image-only scan in which the fraction displays nearby are garbled. So I did
not write that the source prints `min(1, r₊)`: from the extraction alone, a misprint cannot be told
apart from a lost fraction bar. The Check already states the right value and excludes the wrong one.

## F02 (P3) — applied

§11.3 Check: "it takes `ϵ = 11/24` and gives exponent `48` … at `7/8` it takes `ϵ = 7/16` and gives `32`" →
"for some `ϵ < 1/2` … every `ϵ` with `5/12 < ϵ < 1/2` is admissible and that route gives every exponent
above `4/(1 − 5/6) = 24` (`48` at `ϵ = 11/24`), against `12` here; at `7/8` it admits every `ϵ` with
`3/8 < ϵ < 1/2` and gives every exponent above `16` (`32` at `ϵ = 7/16`, the choice of
`openai2026quasiRH` Corollary 1.2)". `plan.json` 11.3 test `bims` was changed to match.

Evidence: `bimsissac2017` lines 598–600 (Conjecture 6.3 asks for some `0 ≤ ϵ < 1/2` and the open strip)
and lines 671–675 (Theorem 6.7, exponent `4/(1 − 2ϵ)`). `openai2026quasiRH` lines 285–286 take
`ϵ = 7/16` and give `A = 32` "for example", without optimizing. I changed two things in the review's
wording. "At `7/8` every `ϵ > 3/8`" now carries the upper bound `ϵ < 1/2` that the conjecture
imposes. "The source's `ϵ = 7/16`" now names whose choice it is: `openai2026quasiRH`'s, not
`bimsissac2017`'s. The pattern does not occur elsewhere: §11.3's own locator says "with exponent
`32` at `7/8`", which is what Corollary 1.2 states, and no other Check fixes a free parameter of
another route.

## F03 (P3) — applied

Downstream consumers: "**AnalyticNumberTheoryPartI or AnalyticNumberTheoryPartIII, Part II**" →
"**AnalyticNumberTheoryPartIII, Part II**".

Evidence: the scope section ("Part IIs of ExplicitPrimeCounting, AnalyticNumberTheoryPartIII and
ZerosOfLFunctions") and `plan.json` `consumers` (`AnalyticNumberTheoryPartIII`) already named only that
roadmap. On main, AnalyticNumberTheoryPartIII Layer 10 is "from a zero-free region to an error term"
(its scope section describes 10.2 as "the qualitative transfer" from a zero-free region). So it is
the base whose Part II takes `ψ(x) − x ≪ x^(11/12+ε)`. AnalyticNumberTheoryPartI's prime-error section
(§1.9, "Prime error terms under RH and GRH") takes `Re ρ = 1/2` as a hypothesis, not a zero-free
half-plane. I also checked the other consumer names for the same slip. The six
bullets and the six `plan.json` consumers now name the same roadmaps, and so do the scope section's
three Part IIs. None of them names two roadmaps.

## F04 (P3) — applied

§3.1 bullet: "Rescaling, `w_k(x) = w(e^k x)` (`d = 1`), multiplies `ŵ` … and leaves `‖·‖_{J,sep}`
unchanged" → "… gives a profile for the translated set `Ω − k` (`(w_k)_log(u) = w_log(u + k)`), multiplies
`ŵ` by the unit phase `e^(ikt)` and leaves `‖·‖_{J,sep}` and every `p_j` unchanged, so the constant
`≪_{J,d,Ω}` of §3.2 is the same for `Ω` and `Ω − k`". `plan.json` 3.1 API `rescale` was changed to match.

Evidence: `(w_k)_log(u) = w(e^(u+k)) = w_log(u + k)` is supported in `Ω − k`. At `Ω = [0, 1]`, `k = 5`
that is `[−5, −4]`, which is disjoint from `Ω`. `ŵ_k(t) = ∫ w_log(v) e^(−it(v − k)) dv = e^(ikt) ŵ(t)`. I
changed the review's "the constants of §3.2 depend on `Ω` only up to translation" to name the one
constant of §3.2 that depends on `Ω`, the first bound `‖w‖_{J,sep} ≪_{J,d,Ω} p_{J+d+2}(w)`. Its two sides
are invariant under translating `w_log`, so a constant valid for `Ω` is valid for `Ω − k`. The other
bounds of §3.2 do not mention `Ω`. Same pattern: §3.3's pieces `W_G(e^k x) χ(log x)` are cut off by
`χ(log x)`, so their logarithmic support is `supp χ` for every `k`, as the README says. §10.5's "rescaled
scales" are scales of probes, not profiles on a fixed `Ω`. §10.2's `Ω` is a different object: a
compactly supported weight in `q_m/Q`.

## Checks

Dependency check (`gate --candidate … --only QuasiRiemannHypothesis`), after all edits:

    candidate: QuasiRiemannHypothesis is not in the merge order yet; checked as if placed after BianchiModularForms (the intake inserts it when its design is accepted)
    depcheck: 261 roadmaps, 2606 edges, 0 problem(s)

There is no UPWARD or CYCLE line. `roadmaps resolve` on the README finds no cross-roadmap citation and
no Lean name that is found nowhere. The earlier lead `SieveApplications.leastNonresidue` no longer
appears, and it is a declaration that SieveMethodsAndPrimePatterns §2.9 names on main.

There is no `Suggested.lean` at the design stage, so nothing was elaborated and no `#check` pass was
run. A scan of the added text found no LaTeX delimiters, process words or machine paths. `plan.json`
parses, and only the three edited strings differ.

Ownership: no construction was added. The only consumer name that changed is AnalyticNumberTheoryPartIII,
Part II, which is a planned extension. It does not exist yet, and its base roadmap on main is not
asked to change.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §8.4 pole set on `Re s ≥ 1` | `SL₂(ℤ[i])`, `χ = 1`; `(Γ₂, κ_P)` | `Res_{s=2} φ = π(π/4)/ζ_K(2) = 2.46740/1.50670 = 1.63762 ≠ 0`; pole `4/3 ∈ (1, 2)`, eigenvalue `8/9` | `(1, 2]` holds; the source's `(1, 2)` misses `s = 2` | F01 |
| §11.3 Check, other route | `ϵ = 5/12, 11/24, 21/50`; at `7/8`: `ϵ = 3/8, 7/16` | `4/(1 − 2ϵ) = 24` (excluded, open strip), `48`, `25`; `16` (excluded), `32` | every exponent `> 24` (`> 16`), all `> 12` (`> 8`) | F02 |
| §11.3 Check, strip condition | `ϵ = 5/12`; `ϵ = 1/2` | `1/2 + 5/12 = 11/12`, not `> 11/12`, so a zero on `Re s = 11/12` is not excluded; `ϵ = 1/2` is excluded by the conjecture's `ϵ < 1/2` | range `5/12 < ϵ < 1/2` | F02 |
| Consumer of `ψ(x) − x ≪ x^(11/12+ε)` | scope section; consumers bullet; `plan.json` | AnalyticNumberTheoryPartIII in all three | one roadmap | F03 |
| §3.1 rescaling | `Ω = [0, 1]`, `k = 5`; `k = 0` | support `[−5, −4]`; `|e^(5it) ŵ(t)| = |ŵ(t)|`; `sup |∂^α w_log(· + 5)| = sup |∂^α w_log|`; `k = 0` gives `w` itself | profile for `Ω − k`, norms unchanged | F04 |
| §3.2 first bound under translation | `Ω` against `Ω − k` | both sides are invariant under translating `w_log`; the integration-by-parts route constant uses `vol(Ω) = vol(Ω − k)` | same constant | F04 |

## For the maintainer

- No name that another roadmap cites has changed. No roadmap cites QuasiRiemannHypothesis.
- The Downstream consumers list now names AnalyticNumberTheoryPartIII, Part II alone as the home of
  `ψ(x) − x ≪ x^(11/12+ε)`. The base roadmap is not asked to change.
- The source issue the review recorded about `openai2026quasiRH`'s Lemma 6.2 proof (`min(1, r₊)/Y`)
  cannot be settled from the cached text, which is an OCR. The README states the correct separation
  and pins it with a Check.
- I found no suspicious instruction in the review text.

# Repair report: LocalLanglandsCorrespondenceForG2, review REV-PKG-LocalLanglandsCorrespondenceForG2~9

Four findings, all P3. All four were verified against the sources and the supplier, and all four are applied. Files changed: `packages/LocalLanglandsCorrespondenceForG2/README.md`, `sources.toml` and `design/plan.json` (the `gaps` entry of symplectic-steinberg-generic-parameter only). `Suggested.lean` is unchanged.

## F01 (P3) — applied

§0.9 and References [C]: "Corollary 6.8, pp. 149–150" → "pp. 150–151" (C line 2282 on p. 150, proof ending at line 2314 on p. 151). Pattern: the other C locators were checked and are right: §0.0 p. 149 (line 2238) and §0.10 pp. 147–148 (lines 2148, 2176).

## F02 (P3) — applied

Contract symplectic-steinberg-generic-parameter: "discrete" → "cuspidal", in the README, the scope paragraph and `plan.json` `needs`. New locators: MagaardSavin Prop. 8.2 (p. 10, over ℚ, uses only Arthur) and KS Lemma 2.1 / Cor. 2.2 (p. 16). The contract now says why every use (§§1.7, 2.3, 3.1, 3.11, 6.4, 8.1, 10.6) is cuspidal. MagaardSavin was fetched and completed in the manifest; KS locator and References were extended.

## F03 (P3) — applied

§3.11(ii)(a) route: a bounded ψ_u gives the tempered L-packet (§3.15). For an unbounded ψ_u, §5.1's image gives a globally generic σ′ with parameter A, so ψ_u is generic, and §3.25 makes the component the irreducible standard module with parameter ψ_u. §§3.25 and 5.1 were added to the Needs, dependencies, supplier bullet and scope list. New Check: an unbounded split real place. Pattern: §3.15 and §5.3 routes, the §2.3 Check, the Notes on GF §2.7(a).

## F04 (P3) — applied

§10.5 route: "so it extends to PGSp₆" → it is a representation of the image of Sp₆(F) (normal, quotient F×/F×²) and occurs in the restriction of an irreducible σ, without extending to it in general; twisting σ by χ ∘ sim keeps the restriction (as GS line 1638). New Check: σ ⊗ χ ∘ sim ≅ σ makes the restriction reducible and non-extendable (and the SL₂ ⊂ PGL₂ analogue). There are no other extension claims in the README.

## Evidence read for the four findings

- F01: C lines 2213 (head of p. 149), 2256 (p. 150), 2282 (Corollary 6.8), 2301 (p. 151), 2314 (end of proof).
- F02: MagaardSavin lines 394–397 (statement, σ cuspidal, a prime q), 398–427 (proof: Steinberg lies only in the packet of the Aubert dual of the trivial parameter; unbounded packets are full inductions); KS line 637 (standing hypothesis: cuspidal, cohomological, a Steinberg place), lines 693–700.
- F03: ModularityAndLanglandsExtensions at its open head: §3.15 (ψ bounded on L_F), §3.17 (ψ_v ∈ Ψ̃⁺_unit may be unbounded, through Arthur's extension), §3.25 (members of generic L-packets are irreducible standard modules, for local F of characteristic zero, archimedean included), §5.1 (image of the generic transfer for Sp: distinct unitary self-dual orthogonal-type cuspidal summands with trivial total central character). MagaardSavin lines 422–424.
- F04: GS lines 1635–1643 (the proof picks σ with σ♭ ⊂ rest(σ) and twists it; nothing is extended).

## Checks run

- `lake env lean packages/LocalLanglandsCorrespondenceForG2/Suggested.lean` from the content checkout: exit 0. The only diagnostics are `declaration uses 'sorry'` at 118:8 (`griess_conjugacy`) and 137:8 (`spin7_not_acceptable`). The Tau Ceti module `TauCeti.Algebra.Octonion.Basic` already had its object file.
- `#check @` on all five declarations (`octonionAut`, `octonionRep`, `griess_conjugacy`, `sumSquaresSeven`, `spin7_not_acceptable`) in one scratch file, elaborated once. The types are identical to those in the worker's signature list and agree with §§0.0 and 0.8 of the README. No binder was lost, and nothing changed: no finding touched the Lean file.
- Dependency check, output exactly:

```text
depcheck: 249 roadmaps, 2390 edges, 0 problem(s)
```

  It shows no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- `design/plan.json` parses. Only the `needs` and `neededBy` of symplectic-steinberg-generic-parameter changed. `sources.toml` parses (14 sources).
- Residue scan of README and Suggested.lean (LaTeX delimiters, machine paths, pull-request numbers, process words): no hits. The `$…$` strings in `sources.toml` titles are the service-recorded titles and were already there.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Contract symplectic-steinberg-generic-parameter, cuspidal σ | n = 1 (SL₂); n = 3 at v with St; constituent of Σ⏐Sp₆ | SL₂: parameters μ (GL₃ cuspidal, can be St at v), χ ⊞ μ₂ dihedral (N = 0 everywhere), three quadratic characters (N = 0), 1 ⊠ ν₃ (trivial rep); only the first has St. n = 3: exponents of Sym⁶ at diag(q^(1/2), q^(−1/2)) are 3, …, −3, each once, so one summand (7, 1). Global component group: centralizer of an irreducible orthogonal 7-dim rep in SO₇ is {1} (−1 has det −1) | True; every use is cuspidal | "discrete" → "cuspidal"; locators added |
| Same contract, over a number field | k = ℚ (source) against general k | MS uses strong approximation and Arthur 1.5.1/1.5.2/7.1.1 only; nothing specific to ℚ | Holds over k | Stated with this reason |
| §3.11(ii)(a), bounded ψ_u | Π_u = St at v₁; compact real place, λ = 0 | Sym⁶ tempered; at the real place sgn ⊕ Ind((z/z̄)^m), m = 1, 2, 3, bounded | §3.15 packet suffices | None |
| §3.11(ii)(a), unbounded ψ_u | split real u, exponent (⏐·⏐^a, ⏐·⏐^b, ⏐·⏐^(−a−b)), a, b > 0, a + b < 1/2 | product of the three characters = 1; Sp₆ exponent (a+b, b, a); coroot pairings a, b, b−a, a+2b, 2a+b, a+b, a+b, b, a ∈ (−1, 1), none a nonzero integer, so irreducible; GL₇ exponents differ by at most 2(a+b) < 1, so A_u irreducible; parameter 1 ⊕ ⏐·⏐^(±a) ⊕ ⏐·⏐^(±b) ⊕ ⏐·⏐^(±(a+b)) on both sides | Needs §3.25 (and §5.1 for genericity); as repaired | Route, Needs, Check |
| Genericity of ψ_u via §5.1 | A = ⊞ μ_i a generic parameter of Sp₆ (§3.8) | μ_i distinct, orthogonal type, ∏ ω_(μ_i) = 1: exactly the Sp image conditions of §5.1. σ′ globally generic, ψ_(σ′) = A by isobaric strong multiplicity one, σ′_u ∈ Π̃_(ψ_u) | Hypothesis of §3.25 met | Stated in the route |
| §3.15 route, components from packets | globally generic constituent, unbounded localization | generic member present, so §3.25 applies directly | Same repair | +§3.25 |
| §5.3 route, A_v has parameter v ∘ L(π) | θ(π) a generic discrete series, with ψ_v bounded or unbounded | unbounded ⇒ members are irreducible standard modules from proper P with λ ≠ 0, not square-integrable; contradiction ⇒ bounded ⇒ the tempered packet containing θ(π) (partition, §3.15(c)) | Holds with §3.25 | +§§3.15, 3.17, 3.25 |
| §2.3 Check, St at u | localization bounded / unbounded | St not fully induced; St only in the packet of Sym⁶ (MS lines 412–419) | True via the contract (Σ globally generic, constituent cuspidal) | Cites the contract |
| §10.5 route | σ with σ ⊗ χ ∘ sim ≅ σ, χ ≠ 1; SL₂ ⊂ PGL₂, dihedral σ with exactly one χ | End of restriction ⊇ ⟨1, A⟩ with A: σ → σ ⊗ χ ∘ sim non-scalar ⇒ reducible; an extension σ′ of a constituent τ gives σ ⊂ Ind(τ) = ⊕_μ σ′ ⊗ μ ∘ sim ⇒ σ⏐ = τ irreducible, contradiction; SL₂: two constituents (Labesse–Langlands) | "extends" false; "occurs in a restriction" true (an irreducible quotient of the induction from a finite-index normal subgroup) | Route, Check |
| §10.5, twist step | L_w(σ) = φ̃ ⊗ χ | L_w(σ ⊗ χ ∘ sim) = φ̃ ⊗ χ² = φ̃; χ ∘ sim is trivial on Sp₆(F), so the restriction is unchanged | Holds | Stated |
| §0.9 locator | Corollary 6.8 | printed pp. 150 (statement, start of proof) and 151 (end of proof, line 2314) | Fixed | pp. 150–151 |

## Ownership and suppliers

No new construction or target is stated here. The irreducibility of standard modules in generic L-packets is owned by ModularityAndLanglandsExtensions §3.25. It was read at the head of its open pull request through `roadmaps show`; that roadmap is not among the 244 listed in the brief, but it is earlier in the merge order. It is cited here, not restated. §5.1 of the same roadmap was already a supplier. The contract symplectic-steinberg-generic-parameter keeps its supplier (ModularityAndLanglandsExtensions, Layer 3) and its slug; only its hypothesis and locators changed. Ownership against the other open pull requests was not checked by reading each one: nothing new is owned.

## For the maintainer

- The contract symplectic-steinberg-generic-parameter now asks for less: cuspidal rather than discrete σ. That is what MagaardSavin and KS prove, and it covers every use. If ModularityAndLanglandsExtensions states it, it can state it for cuspidal σ.
- ModularityAndLanglandsExtensions §3.25 is newly consumed, in §§3.11, 3.15 and 5.3. A revision of that roadmap that renumbers §3.25 would break these citations.
- No Lean name changed. No id that other roadmaps cite changed.
- No text was quoted as suspicious. The review contained no instructions beyond its findings.

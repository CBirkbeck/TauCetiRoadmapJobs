# Repair report: HochschildHomologyAndHKR, design round 13

Review resolved: `REV-DESIGN-HochschildHomologyAndHKR~12`. It has one finding, F01 (P3). The
finding is right and is applied. While repairing it I also found a negative control the design was
missing: flatness of `A` cannot be dropped from `HH_n ≅ Tor_n`. It is now a Check.

Files edited:

- `packages/HochschildHomologyAndHKR/design/README.md`: Summary, Scope and ownership (Layer 4
  bullet), Generality paragraph, Exact supplier contracts (From Mathlib, From Tau Ceti), How to
  read the build, §4.5 (statement, route, *Needs:*, two new API bullets, three new Checks), Layer 4
  Dependencies, References (Weibel94).
- `packages/HochschildHomologyAndHKR/design/plan.json`: target 4.5 (statement, hypothesis, locator,
  prerequisites, two new API entries, three new tests).
- `packages/HochschildHomologyAndHKR/sources.toml`: the Weibel94 locator and version note now also
  list §§2.2 and 3.2. The key, status (`uncertified`, settled) and `cited_for` are unchanged.

No new work is cited, so no `needs-references.toml` was written. There is no `Suggested.lean` at the
design stage, so there was no `#check` binder audit and no elaboration.

## REV-DESIGN-HochschildHomologyAndHKR~12/F01 (P3) — applied

**Verified.** For `k`-flat `A`, every `A^{⊗n}` is `k`-flat. This is §4.2's first API bullet, and
Mathlib has the instance in `Mathlib/RingTheory/Flat/Basic.lean:235`. So
`B_n(A) ≅ Aᵉ ⊗[k] A^{⊗n}` is a flat left `Aᵉ`-module, because
`N ⊗_{Aᵉ} (Aᵉ ⊗[k] X) ≅ N ⊗[k] X`. The augmentation `B_•(A) → A` is a resolution over every `k`
(§4.2), and flat resolutions compute `Tor`. Projectivity is needed only for `Ext` (§4.4) and for
the Yoneda comparison (§5.4).

The reviewer's witness checks out. Take `k = ℤ` and `A = M = ℚ[x]`. Then `ℚ ⊗_ℤ ℚ = ℚ` and
`Aᵉ = ℚ[x,y]`, and the resolution by `x − y` gives `Tor = ℚ[x], ℚ[x], 0`. This matches
`HH₀ = ℚ[x]` (§3.1), `HH₁ = Ω¹_{ℚ[x]/ℤ} = ℚ[x]dx` (§3.4) and `HH_{≥2} = 0`.

**Change (old → new).** Old: "for `A` projective as a `k`-module `HH_n(A,M) ≅ Tor_n^{Aᵉ}(M,A)`". New:
"for `A` flat as a `k`-module", with the route above. §4.5 adds flatness over `Aᵉ`, two API
bullets (free and `Aᵉ ⊗[k] X` flat; flat resolutions compute `Tor`), the witness and two negative
controls as Checks. Plan hypothesis: `Module.Flat k A`.

**Two departures from the suggested repair, and why.**

1. *A definition of flatness over `Aᵉ`.* Mathlib's `Module.Flat` assumes `[CommSemiring R]`
   (`Mathlib/RingTheory/Flat/Basic.lean:83`, class at line 114). It therefore says nothing about the
   noncommutative `Aᵉ`. Neither pinned library has a noncommutative flatness predicate; I grepped
   both for `class … Flat`. §4.5 now defines it in prose: `N ↦ N ⊗_{Aᵉ} F` preserves injective maps
   of bimodules.
2. *A different proof route for the flat-resolution bullet.* The suggested route was dimension
   shifting in the resolved variable. That needs the long exact sequence of
   `Functor.leftDerived` along a short exact sequence. Pinned Mathlib does not have it:
   `Mathlib/CategoryTheory/Abelian/LeftDerived.lean` has none. Pinned Tau Ceti has only the
   length-one presentation case (`TauCeti/CategoryTheory/Abelian/LeftDerived.lean`). Its
   `isZero_Tor_succ_of_flat` covers commutative rings and flatness of the *fixed* variable. No
   roadmap that this one may cite states the sequence. The route stated instead uses only pinned
   tools:
   - a comparison map `P_• → F_•`; an exact target suffices (Weibel94 §2.2);
   - the long exact homology sequences in the coefficient variable `M`, which exist because the
     terms are flat;
   - their naturality, `HomologicalComplex.HomologySequence.δ_naturality`
     (`Mathlib/Algebra/Homology/HomologySequenceLemmas.lean:56`);
   - free bimodules, which have no higher homology on either side;
   - induction on `n` with the five lemma,
     `CategoryTheory.Abelian.isIso_of_epi_of_isIso_of_isIso_of_mono`
     (`Mathlib/CategoryTheory/Abelian/DiagramLemmas/Four.lean:138`).

   The vanishing `Tor_n(M,F) = 0` for flat `F` is the special case `F_• = F`.

**New negative control.** Take a prime `p`, `k = ℤ`, `A = ℤ[x]/(px)`, and `M = 𝔽_p` with `x`
acting by `0`.

- *Hochschild side.* The normalised chains are `V^{⊗_{𝔽_p} n}` with `V = x𝔽_p[x]`, with the
  boundary of `𝔽_p[x]` over `𝔽_p`. So `HH₂(A,𝔽_p) = 0`.
- *`Tor` side.* In `Aᵉ = ℤ[x,y]/(px,py)` the annihilator of `x − y` is `pℤ`, and the annihilator
  of `p` is `(x,y)`. So `⋯ → (Aᵉ)² --(x,y)--> Aᵉ --p--> Aᵉ --(x−y)--> Aᵉ → A` starts a free
  resolution. Its differentials vanish modulo `(p,x,y)`, so `Tor₂^{Aᵉ}(𝔽_p,A) = 𝔽_p`.

The Generality paragraph cites this example. It is recorded in plan test `tor_nonflat_algebra`.

**Same pattern elsewhere.** I searched the README and plan for every statement of
`HH_n ≅ Tor_n` and for "projective as a `k`-module" or "`k`-projective". I repaired:

- the Summary;
- the Generality paragraph;
- How to read the build;
- the Scope bullet for Layer 4, which now names the computation of `Tor` by flat resolutions;
- plan target 4.5 and its API entry `homologyIsoTor`.

Left as they are, because the hypothesis is needed:

- §4.2's projective-resolution clause;
- §4.4 (`Ext`) and §5.4 (cup = Yoneda);
- §1.4 cochains, which already uses flat for chains and projective for cochains;
- §7.6;
- §8.2 and §8.4, which concern polynomial algebras and so are free.

§6.3 already uses flatness.

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §4.5 `HH_n(A,M) ≅ Tor_n^{Aᵉ}(M,A)`, `A` `k`-flat | `k = ℤ`, `A = M = ℚ[x]` (flat, not projective: the summand `ℚ` is divisible and not free) | `Aᵉ = ℚ[x,y]`. `M ⊗ [ℚ[x,y] --(x−y)--> ℚ[x,y]] = [ℚ[x] --0--> ℚ[x]]`, so Tor is `ℚ[x], ℚ[x], 0`. HH is `ℚ[x]` (§3.1), `ℚ[x]dx` (§3.4, `Ω_{ℚ/ℤ} = 0`), then `0` | holds | Check added |
| same | `A = k` | `Aᵉ = k`. Tor is `M, 0, 0`. `C_n(k,M) = M` with `b_n = Σ_{i=0}^n (−1)^i`, which is `1, 0, 1, 0, …` for `n = 1, 2, 3, 4`, so HH is `M, 0, 0` | holds | none |
| same | `k = 0`; `A = 0` | every module is `0` | holds | none |
| same | `n = 0`, any `A` | both sides are `M/[A,M]` (§3.1, `Tor_0 = M ⊗_{Aᵉ} A`) | holds without flatness | none |
| same, flatness dropped | `p` prime, `k = ℤ`, `A = ℤ[x]/(px)`, `M = 𝔽_p` | `ann(x−y) = pℤ`: `(x−y)(c+g) = 0` forces `c̄ + g = 0` in the domain `𝔽_p[x,y]`. `ann(p) = (x,y)`. Tor: `𝔽_p, 𝔽_p, 𝔽_p`. HH via normalised chains `V^{⊗n}`, `V = x𝔽_p[x]`: `𝔽_p, 𝔽_p·x, 0`; `x⊗x² − x²⊗x = b(x⊗x⊗x)` | `HH₂ = 0 ≠ 𝔽_p = Tor₂` | negative control added |
| same, flatness dropped | `k = ℤ`, `A = 𝔽_p` | `Aᵉ = 𝔽_p`. Tor is `𝔽_p, 0, 0`, and so is HH (`b_n` alternates `0, 1`) | agree; flatness is sufficient, not claimed necessary in every instance | none |
| flatness over `Aᵉ`: free ⇒ flat; `Aᵉ ⊗[k] X` flat for flat `X` | `X = k` | `Aᵉ ⊗ k = Aᵉ`, free | holds | none |
| same | `k = A = ℤ`, `X = 𝔽_p` (not flat) | `𝔽_p ⊗ (pℤ ↪ ℤ)` is `𝔽_p --0--> 𝔽_p`, not injective | not flat: the hypothesis is needed | none |
| flat resolutions compute Tor; `Tor_n(M,F) = 0` | `k = A = ℤ`, `M = ℤ/p`, `F = ℚ` | `Tor₁(ℤ/p, ℚ) = ℚ[p] = 0` | holds (`ℚ` flat, not projective) | Check added |
| same | `N = ℚ/ℤ`, `F_• = [ℤ → ℚ]` | `H₁ = ker(ℤ/p → ℤ/p ⊗ ℚ = 0) = ℤ/p`; resolving `ℤ/p` by `ℤ --p--> ℤ` gives `(ℚ/ℤ)[p] = ℤ/p` | the two agree | Check added (also the non-flat `ℚ/ℤ` with `Tor₁ ≠ 0`) |
| same, flatness of the terms dropped | `F_• = [𝔽_p]` resolving `𝔽_p` over `ℤ`, `M = 𝔽_p` | `H₁(𝔽_p ⊗ F_•) = 0` but `Tor₁(𝔽_p,𝔽_p) = 𝔽_p` | the hypothesis is needed | none |
| route step: five lemma at `n = 1` | `0 → ℤ --p--> ℤ → ℤ/p → 0`, `N = ℚ/ℤ` | `H₁(ℤ/p ⊗ X) = ker(N --p--> N) = ℤ/p` for both `X = P_•` and `X = F_•`; `φ₀` is the identity on `L ⊗ N = Q ⊗ N = N` | `φ₁` is iso | none |
| route step: `B_n(A)` flat for flat `A` | `n = 0`; `A = ℚ[x]` over `ℤ` | `B₀ = Aᵉ` is free. `B_n = ℚ[x,y] ⊗_ℚ ℚ[x]^{⊗n}` is free over `Aᵉ` here | holds | none |
| Generality and Summary consistency | §§4.4, 5.4 (`Ext`, `k`-projective), §6.3 (`k`-flat), §8.4 (free) | the hypotheses of every statement now match the README text | consistent | none |

## Checks run

**Dependency check** (the `gate` command of the brief):

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2243 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The repair adds no roadmap supplier.

**Citations.** `roadmaps resolve` on the edited README lists no cross-roadmap citation and no Lean
name found nowhere. That tool did not check names outside TauCetiRoadmap ("no pinned Lake
packages on this host"), so I opened every new library name at the pins:

- `Module.Flat.rTensor_preserves_injective_linearMap` (`Mathlib/RingTheory/Flat/Basic.lean:121`);
- `HomologicalComplex.HomologySequence.δ_naturality` (`HomologySequenceLemmas.lean:56`);
- `CategoryTheory.Abelian.isIso_of_epi_of_isIso_of_isIso_of_mono` (`DiagramLemmas/Four.lean:138`);
- `CategoryTheory.ProjectiveResolution.lift` (`Abelian/Projective/Resolution.lean:92`; its target
  is a `ProjectiveResolution`, as the README says);
- `TauCeti.BalancedTensorProduct.finsuppScalarRight` (`Balanced/Finsupp.lean:69`);
- `TauCeti.BalancedTensorProduct.lid` (`Balanced/Unit.lean:48`);
- `TauCeti.BalancedTensorProduct.rid` (`Unit.lean:122`);
- `TauCeti.BalancedTensorProduct.outerFactors` (`OuterFactors.lean:88`).

**Parsing.** `plan.json` and `sources.toml` re-parse.

**Hygiene.** I scanned the added lines for LaTeX delimiters, process words and machine paths. The
only match is the phrase "five lemma", followed by a backticked name; it is not a Lean `lemma`.

No gate failures were listed in the brief.

## For the maintainer

- No Lean name or cross-roadmap citation changed. No supplier contract with another roadmap
  changed, and the gap `smooth-hkr-antisymmetrisation` is untouched.
- **Ownership.** §4.5 now owns two new things:
  - flatness of left `Aᵉ`-modules;
  - the computation of `Tor` over `Aᵉ` by flat resolutions.

  I searched by object at main and at the open heads:
  - `roadmaps grep` for flat resolutions, `Tor` over the enveloping algebra or a noncommutative
    ring, and acyclic resolutions of left derived functors. No roadmap owns these.
  - SpectralSequencesAndConvergencePartII (open) explicitly excludes "Tor of one-sided modules over
    noncommutative rings".
  - Its "computation by F-acyclic resolutions" concerns right derived functors, and the roadmap is
    not an admissible supplier. TopologicalSheafCohomology (main) states the right-derived case for
    sheaf sections only.

  Neither pinned library has a flatness predicate over a noncommutative ring. Ownership was checked
  against the open pull requests through the roadmap tool.
- Weibel94 is cited at two further sections, §2.2 (the comparison theorem) and §3.2 (Tor and flat
  resolutions). Like its existing locators, these are by section only and uncertified.
- **Untrusted text.** The review contains no instructions beyond its findings.

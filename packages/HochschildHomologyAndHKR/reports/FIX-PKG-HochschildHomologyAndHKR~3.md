# FIX-PKG-HochschildHomologyAndHKR~3

This round settles `REV-PKG-HochschildHomologyAndHKR~2`. That review has one finding, called F01 in
its list and R01 in its summary and table; they are the same finding. The review's "For the human
reviewers" section (uncertified sources, the licence of Ginz05) lists no finding, and nothing was
changed because of it. Its "Source issues" (Ginz05 errata) are not findings either.

## F01 (P3) — applied

README, Scope and ownership, "Variants kept here":

- **New entry.** §8.4's homological computation (`homological_hkr_mvPolynomial`) is the polynomial
  case of KTheoryFiniteLocalFields §4.0's smooth HKR comparison, which stays there. The entry says
  how §8.4 differs: classical complex, named map, explicit basis, every `k`, Koszul proof, no gap.
- **Pattern repair.** The §3.4 entry also names §4.0's derived-chain Check `HH₁(A/ℤ) = Ω¹_{A/ℤ}`.

### Verification

The claim is right.

- **What KTheoryFiniteLocalFields says.** At its open head, `KTheoryFiniteLocalFields/README.md`
  line 674 (Layer 4, §4.0, target "Cyclic homology foundations") proves "the HKR comparison
  HHₙ(A/k)≃Ωⁿ_(A/k) for smooth commutative k-algebras". It works on DGAInfinity Layer 8's derived
  Hochschild chains and names no map. Its Check at line 679 says that for `ℚ[t]` over `ℚ`,
  `HH₂` vanishes.
- **What the README lacked.** The Scope section leaves that comparison to §4.0 (README lines
  69–72), but "Variants kept here" had no entry for §8.4. The difference was stated only inside
  §8.4 itself.
- **RefinedTraceMethods.** §1.9 at its open head, target "The antisymmetrisation map and the HKR
  projection", names `ε_n` on the derived chains. It proves `π_n ε_n = n!` and that `ε₁` is an
  isomorphism. Its Connes-operator target makes `μ_n = π_n/n!` a quasi-isomorphism for smooth `A`
  when `ℚ ⊆ k`. Its Check for `k[x,y]` is a Check, not a target. So the entry mentions §1.9 only for
  naming the map, and says that §8.4 does not use the gap. The gap contract under "Exact supplier
  contracts" already records what §1.9 lacks.

### Why the wording differs slightly from the suggested repair

The suggested text is correct. I made three changes:

- I added "(which §6.3 identifies with the derived chains, `R` being free over `k`)". The polynomial
  case of §4.0 and §8.4's statement are about the same group only through §6.3, and §6.3 needs
  `k`-flatness. Without flatness the two groups differ: for `k = ℤ`, `R = 𝔽_p`, the derived `HH₂`
  is `𝔽_p` while the classical `HH₂` is `0` (§6.4 Checks).
- I named RefinedTraceMethods §1.9 as the owner of the map `ε_n`, since "the antisymmetrisation as
  the map" is exactly what separates §8.4 from §4.0.
- I wrote "which §6.4(d) uses for the general smooth case". This places the gap without contradicting
  the gap contract, which says that §7.6 also uses it, through §6.4(d).

### The pattern elsewhere

I searched every kept statement of this roadmap that is a case of an object that
KTheoryFiniteLocalFields §4.0 or RefinedTraceMethods §1.9 keeps:

- **§3.4 (`HH₁(R,R) ≅ Ω¹_{R/k}`).** Its entry named RefinedTraceMethods §1.9 but not §4.0's
  derived-chain Check `HH₁(A/ℤ) = Ω¹_{A/ℤ}` (line 678 at that head). Both are now named.
- **§6.4(d) (`ε^cl_n` an isomorphism for smooth `R`).** This is not a variant. It is the transport
  of the supplier statement, gap:smooth-hkr-antisymmetrisation, through §6.3. The Scope's "owns"
  bullet already covers it ("the description of the antisymmetrisation and projection maps of
  RefinedTraceMethods §1.9 on the classical complex"). The new entry names it as the one place the
  gap is used for the general smooth case.
- **§8.4 in cohomology and §7.6.** These are owned here. A search of main and the open heads found no
  other owner of cohomological HKR. `roadmaps grep -i 'Hochschild.Kostant.Rosenberg|HKR
  (theorem|comparison|isomorphism)|polyvector'` hits only KTheoryFiniteLocalFields §4.0,
  RefinedTraceMethods §§1.9–1.10, CyclicHomologyLieHomologyAndQuasiFreeAlgebras and
  RefinedTraceMethodsPartII. All of them are about homology: the latter two leave `HH` and HKR to
  KTheoryFiniteLocalFields §4.0, and the first two are the objects named above. On main, no README
  that mentions Hochschild states an HKR theorem; those hits are Hochschild–Serre, Ado–Hochschild or
  THH references.

`Suggested.lean`, `sources.toml`, `metadata.toml` and `design/plan.json` are unchanged. No backticked
name was added or removed: `homological_hkr_mvPolynomial` was already declared and already named in
§8.4.

## Checks

- **Elaboration.** `lake env lean packages/HochschildHomologyAndHKR/Suggested.lean`, run from the
  content checkout, exits 0. It prints seven `declaration uses 'sorry'` warnings (lines 119, 138, 168,
  205, 219, 236 and 256) and nothing else. `Suggested.lean` was not changed this round. Both imported
  `TauCeti.*` modules were already built.
- **Signatures by `#check`.** I put `#check @name` for all 13 declarations into one scratch file
  after the file's own text and elaborated it once (exit 0). Every elaborated type carries its
  binders:
  - `homology_one_linearEquiv_kaehler`: `k R`, `CommRing`, `Algebra`.
  - `nonempty_linearEquiv_ext`: the five bimodule instances, `SMulCommClass A Aᵐᵒᵖ M` and
    `Module.Projective k A`.
  - `cohomological_hkr_hom_kaehler`, `cohomological_hkr`: `Algebra.Smooth k R` and
    `Module.Projective k R`; the former also `IsCentralScalar R M` and the symmetric-bimodule
    instances.
  - `homological_hkr_mvPolynomial`: `k`, `m`, `n`.
  - The defs carry only the instances their types use.

  The types match the README statements of §§1.2, 3.4, 4.4, 5.1, 6.2, 7.5, 7.6 and 8.4. Nothing
  changed.
- **Dependency check** (`gate --depcheck … --movable`):

      depcheck: 244 roadmaps, 2274 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **Citation resolver** (`roadmaps resolve` on the README after the edit): no cross-roadmap citation
  and no Lean name found nowhere. The worker's run listed one lead,
  `TauCeti.StarkSystems.toExteriorBidual` (README line 1959). It is not a pinned declaration. It is a
  name that IntegralIwasawaTheory plans in §12.6, on main (`TauCetiRoadmap/IntegralIwasawaTheory/README.md`
  line 1847 defines `toExteriorBidual R r M` in the namespace `TauCeti.StarkSystems`). Our README
  cites it in a *Needs* line as IntegralIwasawaTheory §12.6's, which is correct. No change.
- **Gate failures listed in the brief:** none.

## Adversarial pass (changed text)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| New entry: §8.4 is the polynomial case of §4.0 | `k = ℚ`, `m = 1`, `n = 2` | §4.0 Check: `HH₂(ℚ[t]/ℚ) = 0`. §8.4: `Ω² = ⋀²(R dX) = 0` and `HH₂ = 0`. `b(1⊗X⊗X⊗X) = X⊗X⊗X − 1⊗X²⊗X + 1⊗X⊗X² − X⊗X⊗X = 1⊗X⊗X² − 1⊗X²⊗X = ε^cl₂(dX ∧ dX²)`, and `dX ∧ dX² = 2X dX ∧ dX = 0` | agree; only §8.4 gives the map | none |
| same, where the map matters | `k = 𝔽₂`, `m = n = 2` | §4.0: `HH₂ ≅ Ω²`, free of rank 1, with no map named. §1.9: `π₂ε₂ = 2 = 0`, so nothing in degree 2. §8.4: `[1⊗X₁⊗X₂ − 1⊗X₂⊗X₁]` is a basis vector (it pairs to `1` with `∂₁ ∪ ∂₂`) | "without the gap" is accurate | none |
| same, degenerate | `m = 0`; `n = 0` | `R = k`. For `n ≥ 1`: `Ω^n_{k/k} = 0`, `HH_n(k,k) = 0` (as `k̄ = 0`) and §4.0's `HH_n(k/k) = 0`. For `n = 0`: all three equal `R` | agree | none |
| same, the clause "free over `k`" | `k = ℤ`, `R = ℤ[X]`; contrast `R = 𝔽_p` | `ℤ[X]` has a monomial basis, so it is flat and §6.3 identifies classical with derived `HH`. For `𝔽_p`: derived `HH₂(𝔽_p/ℤ) = 𝔽_p` but classical `HH₂(𝔽_p,𝔽_p) = 0` (`b₂ = 1`, `b₃ = 0`) | the clause is needed; it holds for polynomial `R` | clause added |
| same, `ε_n` of §1.9 against `ε^cl_n` | `n = 2` | §1.9 uses `a_{σ⁻¹(i)}`, §8.4 uses `r_{σ(i)}`. Since `sgn σ = sgn σ⁻¹`, summing over `S₂` gives `1⊗x⊗y − 1⊗y⊗x` in both. §6.4(a): `ε^cl_n ↦ ν_n ε_n` | the same map up to the sign `ν_n`; the entry does not claim equality | none |
| Extended §3.4 entry: §4.0 checks `HH₁(A/ℤ) = Ω¹` | `A = ℤ[x]`; `A = 𝔽_p` (not flat) | `ℤ[x]`: `HH₁ = ℤ[x] dx` on both complexes. `𝔽_p`: `Ω¹_{𝔽_p/ℤ} = 0`; derived `HH₁ = 0` (odd degrees vanish, RefinedTraceMethods §1.10); classical `HH₁ = ker b₁ / im b₂ = 𝔽_p/𝔽_p = 0` | agree even without flatness, as the entry says ("flat or not") | none |
| Gap placement ("which §6.4(d) uses for the general smooth case") | gap contract text | The contract says "Only §6.4(d), and §7.6 through it, use the statement", and §8.4's *Needs* line does not list the gap | consistent | dropped "only" |

## Ownership and sources

- **Ownership against open work.** Checked through `roadmaps grep` and `roadmaps show`, at the heads
  of the open pull requests and on main (above). The kept variant has one owner of the general
  statement, KTheoryFiniteLocalFields §4.0, which is earlier in the merge order. This roadmap owns
  only the classical-complex polynomial computation, now said so in Scope.
- **Sources.** No source was fetched, added or changed. The new text cites sections of this
  roadmap and of other roadmaps, not sources.
- **Missing texts.** `needs-references.toml` was not written: no missing text was needed.

## For the maintainer

- No name that other roadmaps cite changed. No id, section or Lean declaration was added, removed or
  renumbered.
- The new Scope entry cites KTheoryFiniteLocalFields §4.0 and RefinedTraceMethods §1.9 as they are
  at their open heads. The README already cited both before this round, so no new dependency
  appears.

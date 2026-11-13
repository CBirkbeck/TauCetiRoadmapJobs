# Repair of PerfectoidQuotientsPartII (package, round 3)

Findings settled: the five findings of `REV-PKG-PerfectoidQuotientsPartII~2` (one P2, four P3). All
five were verified against the pinned libraries, the supplier roadmaps and the cached sources;
four are applied as asked, and one (R04) is applied with a corrected citation for one step. No
finding was disputed and none is marked not actionable. No supplier gap was needed; the plan's
`gaps` list is unchanged.

## REV-PKG-PerfectoidQuotientsPartII~2/R01 (P2) — applied

Verified: `TauCeti/RingTheory/Perfectoid/Integral.lean:76` declares
`TauCeti.Perfectoid.IsIntegralPerfectoid p A`, with the same three fields as the local class.

Old → new: the local `class IsIntegralPerfectoid` → `import TauCeti.RingTheory.Perfectoid.Integral`
and `open TauCeti.Perfectoid (IsIntegralPerfectoid)`. Contract moved to "From Tau Ceti", with its
API. Scope, Conventions, the P1.24 contract, the How-to-read paragraph and the module docstring now
name the Tau Ceti predicate. Three `IsAdicComplete (p)` binders, now supplied by the instance
`isAdicComplete_span_natCast`, were dropped.

Pattern: `*Needs:*` lines that used P1.24 only for the predicate (Q5.6, Q5.7) now cite Tau Ceti
(`of_perfectRing` for Q5.7). The Dependencies of Layers Q5, Q6, Q8, Q9 and Q10 add the Tau Ceti
predicate. P1.24 is still cited for what Tau Ceti lacks: the injectivity half of BMS1 Lemma 3.10 (i),
compatible roots of unit multiples (Lemma 3.9) and the converse criterion.

## REV-PKG-PerfectoidQuotientsPartII~2/R02 (P3) — applied

Verified: for `A = 𝒪_C`, `ϖ = p^{1/p}`, `m = 1`, `j = 0`, inverting `ϖ` turns the stage into
`C[T^{1/p^∞}]`, which is not finitely generated over `C`.

Old → new (Q9.2 Check): "each stage … is syntomic over `A`" → "is ind-syntomic over `A`: the
filtered colimit over `n ≥ j` of the syntomic `A[T^{1/pⁿ}][X_j]/(ϖ^{m/pʲ}X_j − T^{1/pʲ})` (Q7.6)". The
`𝒪_C` witness is recorded as a non-syntomic control, and each finite stage becomes `C[T^{1/pⁿ}]` after
inverting `ϖ`.

Pattern: two more places made the same claim about algebras over `A_0 = A[T^{1/p^∞}]`. The Layer Q7
Examples called the blowup algebras `A_0[X]/(ϖ^m X − P)` stages with Q7.6 fibrewise nonvanishing;
they are now ind-syntomic colimits of the finite hypersurfaces. The Layer Q9 introduction now reads
"increasing union of ind-syntomic blowup algebras". The Q9.2 proof route was already correct: it
applies Q7.6 to `A[T^{1/pⁿ}][X_j]/(…)`.

## REV-PKG-PerfectoidQuotientsPartII~2/R03 (P3) — applied

Verified: for `p` odd, `p^{1/p}` does not lie in the completed `ℤ_p[ζ_{p^∞}]`. It cannot be in the
abelian tower, and Krasner's lemma carries this to the completion. Also, `ℤ₃[3^{1/3}][√3]` already
contains `3^{1/3}`.

Old → new:
- Q9.4 Check: "`p^{1/p^∞}` already exist" → unit multiples of `p` have compatible roots (BMS1
  Lemma 3.9), but neither `p` nor `1 + p` has a `p`-th root there, for `p` odd. The degree argument
  is given in the Check, with the integral perfectoidness of the ring cited to BMS1 Example 3.6.
- Q10.5, first Check: restricted to `R = ℤ_p`, `p` odd, using valuations in `(1/2)ℕ`. The ramified
  `R = ℤ_p[p^{1/p}]` is added as a negative control.
- Q10.5, second Check: uses `b_k = ((p♭)^{1/pᵏ})♯` with `b_0 = vp`. Then
  `c_k^{pᵏ} = (u/v̄) b̄_k^{pᵏ}`, and `c_k/b̄_k` is a unit by `p`-integral closedness. `b_k ∈ √(pR_∞)`.
  The completed cyclotomic ring is a valid `R_∞` that contains no `p`-th root of `p`.

Pattern: every other `p^{1/p}` in the README is in a ring that contains it by construction:
`𝒪_C`, the completed `ℤ_p[p^{1/p^∞}]`, `Ã` of Q9.6, `R⁺`, and the Q10.4 cover. The Q10.5 proof route
already uses unit multiples. `sources.toml` and References add BMS1 Definition 3.5 and Example 3.6,
p. 21 (BMS1 line 1013).

## REV-PKG-PerfectoidQuotientsPartII~2/R04 (P3) — applied differently

Verified:
- PrismaticCohomology §0.61, at its supplied head (README line 1169), states δ-functoriality in prose,
  with no `Prismatic.IsDistinguished.map`.
- SchemeAndStackFoundations on main, §§0.12–0.14, has no `henselization_flat` or
  `henselization_quotient_pow`. Its lines 175–195 redirect to Tau Ceti.
- The native declarations are at the pin: `Henselization/IndEtale.lean:47,60`, `Quotient.lean:81`,
  `Etale/IndEtale.lean:94`, `Henselian/Quotient.lean:34` and `Henselian/Ideal.lean:110`.

Old → new:
- §0.61 is cited in prose.
- The SchemeAndStackFoundations contract → a Tau Ceti bullet: `TauCeti.Henselization.algebra`,
  `henselian`, `indEtale`, `TauCeti.Algebra.IndEtale.flat`, `quotientPowEquiv`,
  `faithfullyFlat_of_le_jacobson`, `RingHom.henselianRing_of_surjective` and
  `Ideal.henselianRing_radical_iff`.
- Q9.3 and Q9.6 proof routes, their Needs lines, the Layer Q9 Dependencies and the Scope bullet now
  cite these.

Two departures from the suggested repair:
1. The review asks to cite `faithfullyFlat_of_le_jacobson` "directly", but that lemma does not apply
   to Q9.3. There `ϖ` need not lie in the Jacobson radical of the ring being henselized; for example,
   `p ∉ Jac(ℤ_p[T])`. The faithful flatness needed is over the base `A`. So Q9.3 cites ind-étaleness,
   `quotientPowEquiv` and Stacks Lemma 10.39.15. Q9.6 uses `faithfullyFlat_of_le_jacobson`, since
   `Ã` is `p`-Zariski there.
2. SchemeAndStackFoundations is no longer named as a supplier. No target of it beyond the native API
   is used: the integral-extension permanence in §0.14 is cited nowhere in this package.

## REV-PKG-PerfectoidQuotientsPartII~2/R05 (P3) — applied

Verified: the content repository's `lake-manifest.json` pins Mathlib `1b1ccf4b…` and Tau Ceti
`2fd255d9…`.

Old → new: "Pinned at `6b7abb3c…`" and "Pinned at `a91d3aaf…`" → "At the Mathlib (resp. Tau Ceti)
revision pinned by the repository's `lake-manifest.json`". This is the review's second option, and it
cannot go stale. No main roadmap writes pin hashes; four refer to `lake-manifest.json`.

## Checks

- **Elaboration**: `lake env lean packages/PerfectoidQuotientsPartII/Suggested.lean`, run from the
  content checkout, exits 0 with exactly 15 warnings, all `declaration uses 'sorry'`. No `TauCeti.*`
  build was needed: the object file of `TauCeti.RingTheory.Perfectoid.Integral` exists. The imports
  are `import Mathlib` plus four individual Tau Ceti modules, all used. There is no `set_option` and
  no sorry'd data.
- **Signatures**: in a scratch copy, `#check @name` for all 18 remaining declarations and for
  `TauCeti.Perfectoid.IsIntegralPerfectoid` elaborated (exit 0).
  - Each type matches its README statement.
  - The only change is the deletion of three redundant `[IsAdicComplete (Ideal.span {(p : _)}) _]`
    binders, in `isAdicComplete_preTilt_iff`, `untilt_dvd_iff_and_exists_isUnit_mul_untilt` and
    `exists_approximation`. These are now supplied by the instance `isAdicComplete_span_natCast`.
  - No section binder was lost.
  - The value-group universe of `exists_approximation` and
    `isTopologicallyNilpotent_iff_forall_lt_one` is still an independent `u_2`.
  - The native class has the same explicit arguments as the deleted local class (`p`, `A`), so no
    call site changed.
- **Dependency check** (command of the brief): output:

  ```text
  depcheck: 236 roadmaps, 2136 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line.
- **Citations** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name was
  found nowhere. The tool did not check names outside TauCetiRoadmap ("no pinned Lake packages on this
  host"), so I checked every Tau Ceti name added this round at the pin, with file and line (R01, R04).
  The PerfectoidQuotients, PerfectoidSpaces, EnhancedDerivedSheaves and DerivedDeRhamCohomology names
  in the supplier contracts were all found in their roadmaps.
- **Style sweep of the diff**: no LaTeX delimiters, machine paths, process words or review references.
  No Lean line added this round exceeds 100 columns. The one existing 101-column line, the body of
  `IsSyntomic`, is untouched.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| Native predicate in all headlines; dropped `IsAdicComplete (p)` binders | `𝔽_p`; zero ring; `ℤ_p` | For `𝔽_p`: `(p) = ⊥`, `IsAdicComplete ⊥` holds, `of_perfectRing` applies, and `PreTilt 𝔽_p p = 𝔽_p`. For the zero ring: `of_subsingleton` holds, but `Fact ¬IsUnit p` fails, so headlines needing a nonzero ring exclude it, as before. For `ℤ_p`: not integral perfectoid (Tau Ceti example file). The instance gives the same Prop as the dropped binder. | No change in meaning; binders removed |
| Q9.2 Check (ind-syntomic stage) | `A = 𝒪_C`, `m = 1`, `j = 0`; `n = j`; `A = 0` | Colimit after inverting `ϖ`: `C[T^{1/p^∞}]`, not finitely generated. Stage `n` after inverting `ϖ`: `C[T^{1/pⁿ}]`, relative dimension 1. At `n = j` the relation `ϖ^{m/pʲ}X − Y` eliminates `Y`, giving `A[X]`, which is syntomic. At `A = 0` everything is zero, consistent. | Fixed (R02) |
| Q7 Examples (finite hypersurfaces) | `P = T`, `m = 1`; `P = 1` | `ϖX − Y^{pⁿ}` is `−Y^{pⁿ} ≠ 0` in fibres where `ϖ = 0`. For `P = 1`, `ϖX − 1` is a unit in those fibres, giving empty fibres, which Q7.6 allows. | Fixed (R02 pattern) |
| Q9.4 Check, `p` | `p = 3, 5`; `p = 2` | `X³ − 3` and `X⁵ − 5` are Eisenstein. `[ℚ_p(ζ_p):ℚ_p] = 2` (resp. 4) does not divide 3 (resp. 5). At `p = 2`, `√2 = ζ_8 + ζ_8⁻¹` lies in the tower, so the Check correctly says `p` odd. | Fixed (R03) |
| Q9.4 Check, `1 + p` | `p = 3`: `4`; `p = 5`: `6` | Cubes of units of `ℤ_3` are `≡ ±1 mod 9`, and `4 mod 9 = 4`. Fifth powers of units of `ℤ_5` are `≡ ±1, ±7 mod 25`, and `6` is not among them. So `X^p − (1+p)` is irreducible, and the same degree argument applies. | Kept, with proof |
| Q10.5 Check, `S = ℤ_p[√p]` | `p = 3`; `p = 2`; `R = ℤ₃[3^{1/3}]` | `v₃(S∖0) ⊆ (1/2)ℕ`, which does not contain `1/3`. At `p = 2`, `√2 ∈ S`, so `p` odd is needed. Over the ramified `R`, `S` contains `3^{1/3}`, recorded as a negative control. | Fixed (R03) |
| Q10.5 Check, unit multiples | `R = ℤ₃`, `R_∞` = completed `ℤ₃^{cycl}`, `c = 3`; `k = 0` | `(ζ₃ − 1)² = −3ζ₃`, so `v = −ζ₃` and `b_1 = ζ₃ − 1`. Then `(c_1/b̄_1)² = (−ζ₃)⁻¹`, a unit. At `k = 0`, `c_0/b̄_0 = v̄⁻¹`. And `b_k^{3ᵏ} = v·3 ∈ 3R_∞`, so `b_k` maps to 0 in the reduced `(R_∞/3)_perfd`. | Fixed (R03) |
| Q9.3 henselization step | `B = ℤ_p[T]`, `ϖ = p`, over `A = ℤ_p` | `1 + pT` is not a unit, so `p ∉ Jac(B)` and `faithfullyFlat_of_le_jacobson` does not apply. Still, `B^h/p = 𝔽_p[T] ≠ 0` hits the only closed point of `Spec ℤ_p`, so `A → B^h` is flat and faithfully flat by Stacks Lemma 10.39.15. | Cites ind-étaleness, `quotientPowEquiv` and the Stacks lemma (R04) |
| Q9.6 henselian steps | `Ã` `p`-Zariski; `Ã = ℤ`; `p = 2` | `(p) ≤ Jac(Ã)`, so `faithfullyFlat_of_le_jacobson` applies. For `ℤ` (not `p`-Zariski), `ℤ_(p)^h/q = 0` for primes `q ≠ p`, so the map is not faithfully flat. `ϖ^p = p` gives `√(ϖ) = √(p)`; at `p = 2`, `(√2)² = 2`. | Cites the Tau Ceti lemmas (R04) |
| `quotientPowEquiv` contract | `n = 0`; `(ℤ₃, (3))`, `n = 1` | At `n = 0` both quotients are 0. At `n = 1`, `𝔽₃ ≅ 𝔽₃`. | As stated |
| Pins | Manifest | Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…` are the pins used by both elaborations. | Fixed (R05) |

## Ownership and overlaps

No construction was added. The repairs only point to existing owners: Tau Ceti for the predicate
and the henselization API, and prose citations of PrismaticCohomology §0.61. The overlap report
lists no conflicting open pull request and no dropped id. The edge to SchemeAndStackFoundations is
removed; no new supplier edge is added.

## For the maintainer

- PerfectoidSpaces P1.24 on main still plans `IsIntegralPerfectoid`, which Tau Ceti now has as
  `TauCeti.Perfectoid.IsIntegralPerfectoid`. That is for a revision of PerfectoidSpaces, not this
  package. This package now consumes the predicate from Tau Ceti and P1.24 only for the criteria Tau
  Ceti lacks.
- Deleted Lean name: `TauCetiRoadmap.PerfectoidQuotientsPartII.IsIntegralPerfectoid`. No roadmap on
  main, at an open head or in the board packages cites it.
- PurityForFlatCohomology and EtaleDualityAndPerverseSheavesPartII cite only section ids of this
  package (§§Q5–Q6, Q10.1), and none of them changed.
- No missing source; `needs-references.toml` was not written.

# FIX-RT-PerfectoidQuotientsPartII~1

Repair of red-team round 1 (passes a and b) on `packages/PerfectoidQuotientsPartII`. Fifteen
findings, merged where they overlap into thirteen sections. Every finding was checked against the
cited sources, the sibling roadmaps and the pins. None is disputed and none is marked not
actionable. One finding (1a/F04) is settled through an existing supplier instead of the proposed
supplier gap, so the plan's `gaps` list stays empty. One headline theorem is added to
`Suggested.lean` (1a/F05).

## RT-PerfectoidQuotientsPartII~1a/F01 (P1) — applied

Verified. With multiplicative valuations, `x | y` means `|y| ≤ |x|`. The witness `x = 1`,
`y = p♭` in `𝒪_C` refutes the old text. Old (Q6.3 proof route): "then `v(x_n) ≤ v(y_n)`". New:
`x_n^{pⁿ} = x♯` divides `y_n^{pⁿ}`, so `|y_n|^{pⁿ} ≤ |x_n|^{pⁿ}`, hence `|y_n| ≤ |x_n|` (torsion-free
value group), that is, `x_n | y_n`. I added a Q6.3 Check that pins the direction on the same
witness. I found no other valuation inequality in Q6 with this direction problem.

## RT-PerfectoidQuotientsPartII~1a/F02, RT-PerfectoidQuotientsPartII~1b/F04 (P3) — applied

Verified. Take `A = 𝒪_C × 𝔽̄_p` and `ϖ = (p^{1/p}, 1)`. Then `ϖⁿA = p^{n/p}𝒪_C × 𝔽̄_p`, and these
ideals meet in `0 × 𝔽̄_p ≠ 0`, so `A` is not `ϖ`-adically separated and Q5.4 (2) does not apply.
Old: "for `ϖ = (p^{1/p}, 1)` both sides are 0". New (both repairs combined): the admissible root
`(p^{1/p²}, 0)` also gives `0 × 𝔽̄_p` on both sides, since its `p`-th power `(p^{1/p}, 0)` divides `p`.
`(p^{1/p}, 1)` is now recorded as inadmissible, with the nonzero intersection. No other Check uses
a non-separated element.

## RT-PerfectoidQuotientsPartII~1a/F03 (P2) — applied

Verified. When `a = 0`, multiplication by `aⁿ` is not injective on `V`, so the snake-lemma sequence
fails. For example, `V = ℤ_p`, `𝔮 = 0` would embed `ℚ_p/ℤ_p` into `ℤ_p`. New proof route (Q6.5):
the case `a = 0` is trivial. For `a ≠ 0`, `aⁿ` is injective on `V` and on `V_𝔮`, and the outer terms
are the kernel and cokernel of `aⁿ` on `V_𝔮/V`. For the valuation topology, `𝔮 = 0` gives the
discrete trivial valuation. I extended the `a = 0` Check with the witness.

## RT-PerfectoidQuotientsPartII~1a/F04 (P1) — applied differently

Verified: no contract gave a Frobenius lift; PerfectoidSpaces P7.16a owns only the Cohen carrier.
Instead of a new gap, I cite the existing owner DeformationAndDerivedPatchingAlgebra §1.10, earlier
in the merge order. It lifts any unital residue map from a Cohen ring `C` to a complete local `R`.
With `R = W` and `x ↦ x^p` this gives `φ_W` for imperfect `k` too.

Changes:

- a supplier contract for §1.10 and a scope import line;
- citations in Q10.2, Q10.4 and their Needs lines;
- a Q10.2 Check that the lift is a choice over `𝔽_p(t)`.

No Witt-vector substitute is used.

## RT-PerfectoidQuotientsPartII~1a/F05 (P2) — applied

Verified: no declaration concluded that the cover embeds in `(R⁺)^∧`. Added
`exists_faithfullyFlat_isIntegralPerfectoid_injective_completion`, a shorter name for the proposed
theorem with the same signature. Its hypotheses are complete regular local domain, `CharZero`,
residue `CharP p` and `F`-finite residue field. Its conclusion is a faithfully flat, integral
perfectoid `R'` in `Type u` with an injective `R`-algebra map to `AdicCompletion (span {p}) R⁺`.
Q10.4 now names it as a `**Theorem**` line. It is also listed in the Summary, in "How to read the
build" and in the module docstring.

## RT-PerfectoidQuotientsPartII~1a/F06, RT-PerfectoidQuotientsPartII~1b/F06 (P3) — applied

Verified against the cached texts: BS22 line 2175 (p. 56), BS22 line 2431 (p. 62), BS22 lines 3215
and 3221–3222 (p. 83; p. 84 starts at line 3224), and CS24 line 486 (p. 12).

Changes:

- References: "Theorem 7.4 and its proof, pp. 61–62" → "Theorem 7.4, p. 56, and its proof, p. 62".
- Q10.3 and Q10.4: "Remark 10.13, p. 84" → "p. 83".
- Q5.6: "pp. 12–13" → "p. 12".

The remaining BS22 and CS24 page locators were rechecked and are correct.

## RT-PerfectoidQuotientsPartII~1b/F01 (P2) — applied

Verified: at its head, PerfectoidQuotients §0.4 states `perfectoid_compatible_roots_iterated_frobenius`
only for `p`-torsion-free `R`. Q9.2 allows `p = 0`; for example `A` the `t`-completion of
`𝔽_p[t^{1/p^∞}]` with `ϖ = t`. New text: iterate the bijection `x ↦ x^p : Â_0/π → Â_0/π^p` of
PerfectoidSpaces P1.24 at `π = ϖ^{1/pʲ}`, `1 ≤ j ≤ t`. Each `π^p` divides `p`, and `Â_0` is
`π`-complete. Cited as CS24 (2.1.2.4), p. 11 (CS24 line 425). The name appeared nowhere else.

## RT-PerfectoidQuotientsPartII~1b/F02 (P3) — applied

Verified: ArcTopologyAndDescent is at merge-order line 109 and does not cite this roadmap. Its §12.6
owns CS24 Lemma 2.2.2. I repaired the same pattern in the other consumer claims:

- PurityForFlatCohomology's contract cites Q5.2, Q5.4, Q6.3–Q6.7, Q7.1, Q7.3 and Q10.1, not Q9. Its
  bullet now says so.
- The ArcTopology bullet is replaced by EtaleDualityAndPerverseSheavesPartII. That roadmap cites
  Q5.1–Q5.3 and Q6.2–Q6.7 for CS24 Theorem 2.2.7 (its §8.5).
- The "Not owned here" paragraph now assigns Lemma 2.2.2 to ArcTopologyAndDescent §12.6.

## RT-PerfectoidQuotientsPartII~1b/F03 (P3) — applied

Verified: `S = R ⊕ (p, x)√x` is a subring of `R[√x]` over `R = ℤ_p⟦x⟧`. With `c = px`, `S[1/c]` is
étale (discriminant `4x`). `S ≅ R ⊕ 𝔪` is `p`-torsion-free, so
`Tor_1^{R/pⁿ}(S/pⁿ, k) = Tor_1^R(𝔪, k) = Tor_2^R(k, k) = k`. The Q10.6 Check now says the source
vanishes for normal `S` in dimension two but not for this non-normal `S`. For normal `S`, a nonzero
source needs `dim R ≥ 3`.

## RT-PerfectoidQuotientsPartII~1b/F05 (P3) — applied

Verified: Tau Ceti's `IsStandardSyntomicOfRelativeDimension m` requires `Nat.card ι = m + Nat.card σ`
(`TauCeti/RingTheory/Syntomic/StandardSyntomic.lean`), and `0 = m + 1` has no solution. Q7.6 is now
stated for `n ≥ 1`. For `n = 0`, `g` lies in no prime, so it is a unit, and `A/(g) = 0`. This zero
algebra is standard syntomic of every relative dimension `m`, via `A[x_1, …, x_{m+1}]/(1)`: it is flat
and has no nontrivial fibre.

## RT-PerfectoidQuotientsPartII~1b/F07 (P3) — applied

Verified, Bha18 lines 469–479: Proposition 5.2 assumes `p`-torsion-free `R` and gives almost
faithful flatness. It gives faithful flatness when `R` is unramified, and in general with
modification (a). Equal characteristic is not covered. The README Q10.2 citation and both
`Suggested.lean` docstrings (module and theorem) now cite:

- Bhatt–Scholze Remark 3.11 for complete mixed characteristic;
- Proposition 5.2 with modification (a) for `p`-torsion-free `R`;
- the perfection, faithfully flat by Kunz's theorem, in characteristic `p`.

## RT-PerfectoidQuotientsPartII~1b/F08 (P3) — applied

Verified: README Q6.8 states three unnumbered theorems. In the `Suggested.lean` docstring of
`exists_surjective_of_isSMulRegular_of_roots`, "README Q6.8 (2), made explicit…" → "README Q6.8,
second theorem; made explicit…". The other "README Q…" references in the Lean file (Q8.4, Q10.2,
Q10.4, Q10.5, Q10.6) all exist.

## RT-PerfectoidQuotientsPartII~1b/F09 (P3) — applied

Verified: "kept variant" describes an editing decision. The two sentences now say how the statement
differs:

- Q5.2: "This is the product clause of PerfectoidQuotients §0.6 (`integralPerfectoid_pi_iff`)
  without its perfectoid hypothesis."
- Q5.3: "This is the form, for integral perfectoid rings with torsion and possibly without a Tate
  structure, of the isomorphism …".

No other "kept" remains in the README.

## Checks

- **Elaboration.** `lake env lean packages/PerfectoidQuotientsPartII/Suggested.lean`, run from the
  content checkout: exit 0. 16 warnings `declaration uses 'sorry'` (15 before plus the new
  theorem), no errors. All four imported Tau Ceti `.olean` files were present.
- **Signatures.** I put `#check @name` for all 19 declarations into one scratch file and elaborated
  it once (exit 0). Each elaborated type matches its README statement. The new theorem keeps all of
  `IsDomain`, `IsRegularLocalRing`, `IsAdicComplete (maximalIdeal R) R`, `CharZero R`,
  `CharP (ResidueField R) p` and the `Module.Finite … fieldRange …` `F`-finiteness binder; `R'` lies
  in `Type u`. No other declaration's type changed; only docstrings were edited.
- **README/Lean agreement.** Every `theorem` and `def` name of `Suggested.lean` appears backticked in
  the README. `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name
  "found nowhere".
- **Dependency check** (`gate --depcheck … --movable`), complete output:

      depcheck: 230 roadmaps, 2067 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line. The new supplier, DeformationAndDerivedPatchingAlgebra,
  is at merge-order line 79, before this roadmap at line 220.
- **Manifest.** `sources.toml` records:
  - Stacks tags 0328 and 0329 (Lemmas 10.160.6–10.160.7, read at Stacks lines 20586–20605), with
    `cited_for` "Exact supplier contracts";
  - CS24 locator (2.1.2.4).

  No new source was needed and `needs-references.toml` was not created.

## Adversarial pass on added and changed statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Q6.3 divisibility step | `𝒪_C`, `x = 1`, `y = p♭`; `y = 0`; `x = y` | `|y_n| = |p|^{1/pⁿ} ≤ 1`, `z_n = p^{1/pⁿ}`, `z_{n+1}^p = z_n`; `0 = x·0`; `z = 1` | holds; reversed inequality would make `p` a unit |
| Q5.4 Check, `ϖ = (p^{1/p²}, 0)` | `A = 𝒪_C × 𝔽̄_p` | `ϖ^p = (p^{1/p}, 0)`, `(p^{1/p},0)(p^{1−1/p},0) = (p,0) = p`; `A/ϖⁿ = 𝒪_C/p^{n/p²} × 𝔽̄_p`, limit `A`; `A[ϖ] = 0 × 𝔽̄_p` | admissible, both sides `0 × 𝔽̄_p` |
| Q5.4 negative instance `(p^{1/p}, 1)` | same `A` | `(p^{1/p},1)^p = (p,1)`, `(p,1)(1,0) = p`; `⋂ (p^{n/p}𝒪_C × 𝔽̄_p) = 0 × 𝔽̄_p` | not separated, excluded |
| Q6.5, `a = 0` | `V = ℤ_p`, `𝔮 = 0` | kernel of `0` on `V` is `V ≠ 0`; would need `ℚ_p/ℤ_p ↪ ℤ_p` | sequence false; statement trivially true |
| Q6.5, `a ≠ 0` | `V = 𝒪_C`, `𝔮 = 𝔪`, `a = p` | `V_𝔮 = V`, `V_𝔮/V = 0`, sequence `0 → 0 → V/pⁿ → V/pⁿ → 0 → 0` | exact, completeness of `V` |
| Q6.5 valuation topology, `𝔮 = 0` | `V = ℤ_p` | `V_0 = ℚ_p` with trivial valuation, basis `{v < 1} = {0}` | discrete, complete |
| Q7.6, `n = 0` | `A = ℤ`, `g = −1`; `g = p` | `−1` in no prime, `A/(g) = 0`, presentation `ℤ[x_1]/(1)`: `1 = 0 + 1` generators, flat, no fibre; `g = p` vanishes at `(p)` | holds; `g = p` excluded by hypothesis |
| Q7.6, `n = 1` | `ℤ_p[x]/(1 + px)` | `≅ ℚ_p`, generic fibre dim `0 = n − 1`, special fibre empty | holds (existing Check) |
| Q9.2 Frobenius step | `A = 𝔽_p[t^{1/p^∞}]^∧`, `ϖ = t`, `p = 0`; `A = 𝒪_C`, `ϖ = p^{1/p}` | perfect ring: `x ↦ x^p` maps `(t^{1/pʲ})` onto `(t^{1/p^{j−1}})` bijectively; BMS1 3.10 (i) for `𝒪_C` | P1.24 covers both; the PerfectoidQuotients target covers only the second |
| Frobenius lift (DeformationAndDerivedPatchingAlgebra §1.10, `R = C`) | `C = ℤ_p`; `W(𝔽_{p²})`; `k = 𝔽_p(t)` | every endomorphism of `ℤ_p` is the identity (`φ(pᵏℤ_p) ⊆ pᵏℤ_p`); `ζ ↦ ζ^p`, identity fails as `ζ̄^p ≠ ζ̄`; `t ↦ t^p`, `t ↦ t^p + p` both reduce to `f ↦ f̄(t^p) = f^p mod p`, residue of image nonzero | exists; unique iff perfect in these cases |
| New headline (Q10.4) | `R = ℤ_p`; `R = ℤ_p[√p]` (`f = p − x²`); `k = 𝔽_p(t)`, `d = 2`; `k = 𝔽_p(t_1, t_2, …)`; equal characteristic; `dim R = 0` | `R̂_∞ = ℤ_p[p^{1/p^∞}]^∧ ⊆ 𝒪_{ℂ_p}`; stages `ℤ_p[p^{1/(2pⁿ)}]`; rank `p^{3n}`; `Module.Finite` fails; `CharZero` fails; field with `CharZero` and residue `CharP p` impossible | true; excluded cases as intended; injectivity from `R_∞ ∩ pⁿR⁺ = pⁿR_∞` |
| Q10.6 Check, non-normal `S` | `R = ℤ_p⟦x⟧`, `S = R ⊕ 𝔪√x`, `c = px`; `p = 2` | `(a+b√x)(a'+b'√x) = aa' + bb'x + (ab'+a'b)√x ∈ S`; `S[1/c] = R[1/c][T]/(T² − x)`, discriminant `4x` a unit; `Tor_1 = Tor_2^R(k,k) = ∧²k² = k` | source `k ≠ 0`; theorem still consistent (only the image is claimed killed) |
| Q10.2 citation | Bha18 lines 469–479 | hypotheses `p`-torsion-free; faithfully flat in the unramified case, in general with modification (a) | citation now matches |
| Downstream consumers | PurityForFlatCohomology contract; EtaleDualityAndPerverseSheavesPartII §§8.1–8.5; SchemeAndStackFoundationsPartII package; ArcTopologyAndDescent §12.6 | cited ids Q5.2, Q5.4, Q6.3–Q6.7, Q7.1, Q7.3, Q10.1; Q5.1–Q5.3, Q6.2–Q6.7; Q7.1–Q7.3; none | bullets match the citations |

## Ownership and overlaps

- **Frobenius lifts on Cohen rings.** I searched by object (Cohen ring with Frobenius lift, formal
  smoothness of Cohen rings, Stacks 0322 and 0329) over main and the open heads.
  - DeformationAndDerivedPatchingAlgebra §1.10 owns Cohen rings, truncated formal smoothness and
    coefficient lifting. This roadmap cites it and does not restate it.
  - PadicDifferentialEquationsAndRigidCohomology takes a Frobenius lift as a hypothesis and does not
    state its existence.
  - PerfectoidSpaces P7.16a owns the carrier only.
- **New theorem.** No readable roadmap declares
  `exists_faithfullyFlat_isIntegralPerfectoid_injective_completion`. DirectSummandsAndBigCohenMacaulay
  owns Bhatt's almost faithfully flat `K°`-cover, which is a different object.
- **Overlaps file.** The overlaps file lists no open pull request that changes this roadmap and no
  dropped id. The closest roadmaps were compared as above.

## For the maintainer

- **New name.** `exists_faithfullyFlat_isIntegralPerfectoid_injective_completion` (README Q10.4). No
  existing name changed or was removed, and no section id moved.
- **New supplier.** DeformationAndDerivedPatchingAlgebra §1.10 is still an open roadmap pull
  request, earlier in the merge order. If it renumbers §1.10, the citations in the supplier
  contract, Q10.2, Q10.4 and the Layer Q10 Dependencies must follow.
- **Unanswered gap.** PurityForFlatCohomology declares `gap:regular-tower-tilt` on Q10.1 of this
  roadmap: the tilt of the completed perfect-residue tower. This package does not yet state it.
  Neither review raised it as a finding, so it is untouched here; it is a decision for whoever
  settles that gap.
- **Plan file.** `design/plan.json` is unchanged; its `gaps` list remains empty.
- **Source issues.** The source-issue notes in both reviews (CS24, BS22, Wedhorn, Stacks misprints)
  record problems in the sources and need no edit here. The README already handles those that
  affect statements: monic of positive degree, nonempty products for ind-fppf, and part (c) of
  Proposition 2.1.11.
- **Review text.** Neither review contained instructions addressed to the repairer; nothing
  suspicious to quote.

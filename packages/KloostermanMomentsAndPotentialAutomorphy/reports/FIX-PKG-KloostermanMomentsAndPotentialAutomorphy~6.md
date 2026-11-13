# FIX-PKG-KloostermanMomentsAndPotentialAutomorphy~6

This round settles the two findings of `REV-PKG-KloostermanMomentsAndPotentialAutomorphy~5`. Both
are correct, and both are applied.

The F02 repair cites the supplier MixedHodgeModulesAndIrregularHodgeTheory. Resolving that citation
showed that this roadmap cited the supplier by a stale numbering, so every MHM citation was
renumbered (see "Citation resolution" below).

Files changed:
- `packages/KloostermanMomentsAndPotentialAutomorphy/README.md`;
- `packages/KloostermanMomentsAndPotentialAutomorphy/design/plan.json`: only the `section` field of
  the existing gap `irregular-stationary-phase`, `§11.5` → `§9.5`.

Unchanged: `Suggested.lean`, `metadata.toml`, `sources.toml`. No Lean name was added, removed or
renamed, and no new source was needed.

## REV-PKG-KloostermanMomentsAndPotentialAutomorphy~5/F01 (P2) — applied

**Verification.** The summary said "the middle factors are the Euler factors of a motive `M_k`".
That is false at the bad primes, for both parities of `k`. I recomputed the moments independently,
with exact field arithmetic over `𝔽₃`, `𝔽₉`, `𝔽₂₇`:

| Case | Moments | `Z_k(3; T)` | `M_k(3; T)` | Inverse Euler factor at 3 |
|---|---|---|---|---|
| `k = 6` (even) | `26, −730, 19682` | `1 + 26T − 27T² = (1 − T)(1 + 27T)` | `1` (§8.2: `u = v = m = 1`) | `evenEulerFactorInv 6 3 = 1 + 27T` (§8.6) |
| `k = 9` (odd) | `53, 115181, −9408475` | `1 + 53T + 58995T² − 59049T³ = (1 − T)(1 + 54T + 3¹⁰T²)` | `1 + 54T + 3¹⁰T²` | `(1 + 54T + 3¹⁰T²)(1 − 243T)` (§§8.3, 8.5) |

For `k = 9` the extra factor comes from `Θ⁺₃ = {3}`. Its eigenvalue is
`legendreSym 3 (−2)·3⁵ = 243`.

**Change, old → new** (summary, l. 6–13). "the middle factors are the Euler factors of a motive
`M_k`" → the middle de Rham cohomology realizes `M_k`. Its inverse Euler factor is `M_k(p; T)`
except at:
- the odd `p` with `p² ≤ k`, for odd `k`;
- the odd `p ≤ k/2`, and `p = 2`, for even `k`.

At those odd primes it is `M_k(p; T)` times explicit linear factors of weight `k + 1`, respectively
`k` (Layer 8). At `2` for even `k` it is shown to exist (Layer 11).

New §8.5 Check: the `k = 9`, `p = 3` row above, as a negative control for "middle factor = Euler
factor".

**Where this differs from the suggested repair.** The suggested text says the Euler factors are
"determined from the middle polynomials and the bad-prime corrections". I state exactly where the
two differ:
- Odd `k`: `Θ⁺_p ≠ ∅` iff `p` is odd and `p² ≤ k`, since `v_p(a)` odd forces `p ∣ a`, hence
  `ap ≥ p²`.
- Even `k`: `u = ⌊k/(2p)⌋ ≥ 1` iff `p ≤ k/2`.

The suggested text also says the factor at 2 for even `k` is "established" in Layer 11. Layer 11 only
proves that it exists, so the new summary says that.

**Pattern.** I searched for the same identification in the scope list, "How to read the build", the
Layer 8 intro, §§8.1–8.6 and their Examples, §§9.2, 10.4, 11.4–11.5, the Worked examples and the
`Suggested.lean` docstrings. Each of these already distinguishes `M_k(p; T)` from the inverse Euler
factor at bad primes. Instances checked against the new summary:
- `k = 5`, `p = 3`: `9 > 5`, factor `M₅(3; T)⁻¹ = (1 + 27T)⁻¹`, as in the Layer 8 Examples.
- `k = 8`, `p = 3`: inverse factor `1 + 81T`.
- `k = 4`, odd `p`: inverse factor `1`.
- `k = 3`, `p = 2`: inverse factor `1 + 4T`.

## REV-PKG-KloostermanMomentsAndPotentialAutomorphy~5/F02 (P2) — applied

**Verification.** FSY lines 757–767 derive the purity of `M′^H` for `n = 1` from:
- the monodromy filtration of `ψ_{1/τ,1}Π(M^H)`;
- its primitive part;
- "only one Jordan block, by Corollary 4.10 below" (FSY line 767).

FSY Corollary 4.10 (lines 1219–1227) is this roadmap's §5.4, which already Needs §3.6. So §3.6's
"pure of weight `2k + 1` when `r = 2`" used a later section.

**Change, old → new.**
- §3.6 statement (l. 1060–1063): the rank-two purity clause is removed. §3.6 keeps the general bound
  `≥ nk + 1` and points to §5.7.
- §3.6 Checks: the purity/`ΠM^H` bullet moves to §5.7. The `k = 1` bullet keeps only what §3.6
  proves: a nonzero rank-one constant object, `ΠM′^H = 0`, weight bound `≥ 2`. The `k = 2` control
  now attributes the `(3, 3)` class to §5.7.
- §5.4 (l. 1384–1414): the statement now gives the block sizes from FSY Corollary 4.10(1)–(2): `k + 1`
  for `ΠM` and `k` for `M`. The sketch derives them through regular stationary phase and `Sym^k` of the
  block of §2.3, which is added to its Needs. Two new Checks, at `k = 2` and `k = 1`.
- New §5.7 "Weights of the constant quotient in rank two". Its theorem: `M′^H = a^*V[1]` of rank one,
  pure of weight `2k + 1`; `V` is of type `(k, k)`; `ΠM^H` has weights `{k, 2k + 1}`; and
  `H¹(𝔸¹_t, FT M′^H)` has type `(k + 1, k + 1)`. Three Checks. *Needs:* §§3.6, 5.4 and
  MixedHodgeModulesAndIrregularHodgeTheory §§5.3, 9.4, 9.6.
- §6.4: the sketch and Needs now consume §5.7. The sketch's wording is also made precise: `τ = 0`
  gives the weight-`(k + 2)` even class, and `M′` gives the top class.
- Supplier contract (MHM bullet) and the Layer 5 scope line now record this use.

**Where this differs from the suggested repair.**
- *Section number.* The suggestion cites "MixedHodgeModulesAndIrregularHodgeTheory §11.6". That is
  the stale board numbering. The same theorem is §9.6 at the head of the supplier's open pull request,
  and that is cited.
- *Placement.* The corollary is a new §5.7, not a second target inside §5.4. This avoids renumbering
  §§5.5–5.6, which other passages cite. It depends only on §§3.6 and 5.4, so the order is
  §3.6 → §5.4 → §5.7 → §6.4.
- *Normalization.* §5.7 uses the supplier's normalization: the block of `M`, of size `k`, centred
  at `k − 1`, with primitive part `P_{k−1}`. The review's computation uses the block of `ΠM`, of
  size `k + 1`, centred at `k`. Both give the same values.

**Pattern.** Every other use of the weight of `M′^H` or of the infinity block is checked:
- §4.1 uses only the general Fourier-cohomology bounds of §3.6;
- §§5.5–5.6 do not use it;
- §6.4 now cites §5.7.

The "How to read the build" sentence "every subsection uses only earlier subsections" holds again.

## Citation resolution of the supplier MixedHodgeModulesAndIrregularHodgeTheory

The F02 repair must cite this supplier. Its live text is the head of its open roadmap pull request,
which is in this job's list of open roadmap pull requests and was read with `roadmaps show`. It is not the board's
`packages/MixedHodgeModulesAndIrregularHodgeTheory` copy: that copy dates from the package's second
review round, and the board index no longer lists the package.

At the head, Layers 1–7 keep their numbers and the later layers are renumbered. The head's own
former-numbering map covers only the older lettered ids, so it gives no mapping from the numbers
this roadmap used.

I matched the sections by title and body. Every mapped section keeps its title. Most of the
sections cited here have diff similarity 1.00. The lowest is §10.5 (0.45), whose theorem is the same
but whose part (c) now also names a pinned Koszul lemma. I read the head's §§6.5–6.7, 7.7, 8.1, 8.8,
9.5, 9.6, 10.2 and 10.5.

| Board numbering (cited before) | Head numbering (cited now) |
|---|---|
| §8.1 classical embedding | §6.7 |
| §8.2 agreement of filtrations | §7.7 |
| §§9.1–9.6 pair cohomology … examples | §§8.1–8.6 |
| §10.1 `tg` criterion | §8.7 |
| §10.2 zero locus | §8.8 |
| §§11.1–11.6 Fourier cohomology … weights at infinity | §§9.1–9.6 |
| §§12.1–12.9 logarithmic and Newton filtrations | §§10.1–10.9 |

All 43 occurrences were renumbered by exact, context-anchored replacements, each asserted to match
once. They are in:
- the scope bullet and the supplier contract;
- §§3.3, 3.5–3.6 and §4.1 (text and Needs);
- §4.3, §5.4, §5.7, §§6.2–6.5;
- the gap paragraph.

Before this, the resolver flagged the old `11.x` and `12.x` numbers as missing. Worse, the old
`8.x`, `9.x` and `10.x` numbers still resolved at the head, to different content. Examples: the old
"§9.4 middle-degree weights" pointed at the head's constant correction, and the old "§10.1 `tg`
criterion" at its logarithmic complex.

After the renumbering, `roadmaps resolve` reports no unresolved citation and no unresolved Lean name.
The gap `irregular-stationary-phase` is still needed: the head's §9.5 remains regular-input only, and
`grep -i stationary` finds no irregular version.

## Adversarial pass (new and changed statements)

| Statement | Instances | Values computed on each side | Result; change |
|---|---|---|---|
| Summary: inverse Euler factor vs `M_k(p; T)` | `k = 6, p = 3`; `k = 9, p = 3`; `k = 5, p = 3`; `k = 8, p = 3`; `k = 3, p = 2`; `k = 4`, odd `p`; `k = 1` | `1 + 27T` vs `M = 1`; `M₉·(1 − 243T)` vs `M₉ = 1 + 54T + 3¹⁰T²`; `9 > 5` gives `M₅ = 1 + 27T`; `3 ≤ 4` gives `1 + 81T` vs `M₈ = 1`; `1 + 4T = M₃(2; T)`; `1 = M₄`; `1 = M₁` | New summary agrees with §§8.5–8.6 in every case; old one fails at `(6, 3)` and `(9, 3)`. |
| Summary: exceptional primes | `p = 2` with odd `k = 9`; `p = 3`, `k = 7`; `p = 5`, `k = 25` | `Θ⁺₂ = ∅` (needs `v₂(a)` odd, `a` odd: impossible); `9 > 7`, so `Θ⁺₃ = ∅`; `a = 5`: `ap = 25 ≤ 25`, `v₅ = 1` odd, so `Θ⁺₅ = {5}` | "odd `p` with `p² ≤ k`" is exact. |
| §8.5 new Check (`k = 9, p = 3`) | moments over `𝔽₃, 𝔽₉, 𝔽₂₇` | coefficients `1, 53, 58995, −59049`; `(1 − T)(1 + aT + bT²)` gives `a − 1 = 53`, `b − a = 58995`, `b = 59049 = 3¹⁰`; disc `54² − 4·3¹⁰ < 0`, so `|root| = 3^{−5}`; degree `3 = momentDegree 3 9 = 5 − 2` | Consistent with §§8.1–8.3, 8.5. |
| §3.6 bound `≥ nk + 1` (now the only weight claim) | `r = 2, k = 1, 2, 3`; `r = 3, k = 1` | bound `2, 3, 4` vs actual `3, 5, 7` (§5.7); `r = 3`: bound `3`, no exact value claimed | True; no generality lost for `r ≥ 3`. |
| §5.4 block sizes | `k = 1, 2, 3` | `Sym^k J₂`: `k = 2` basis `e₁², e₁e₂, e₂²`, `N e₂² = 2e₁e₂`, `N e₁e₂ = e₁²`: one block of size `3`; rank `N = k`, so `im N` is one block of size `k`; `k = 1`: `N = 0` on `ψ_∞M` (rank 1), `N ≠ 0` on `ψ_∞ΠM` (rank 2) | Sizes `k + 1`, `k` (FSY Cor. 4.10(1)–(2)); a size-`k + 1` block on `M` would exceed rank `k`. |
| §5.7 purity of `M′^H` | `k = 1, 2, 3` | head §9.6 with `w = k`: `P_{k−1}` in `gr^W_{2k−2}` (`0, 2, 4`); `gr^W_{w+(k−1)+2} = gr^W_{2k+1}` (`3, 5, 7`); `rank M′ = (k + 1) − k = 1`, so `W_{k+1}M′ = 0` | Pure of weight `2k + 1`. |
| §5.7 wrong model: primitive index `k` | `k = 1, 2` | weight `2k + 2 = 4, 6`; Fourier class of odd weight `2k + 3 = 5, 7` on a 1-dim space, which Hodge symmetry forbids | Excluded; recorded as a Check. |
| §5.7 Fourier class and §6.4 top class | `k = 1, 2, 3, 4` | head §9.4: `l = (2k + 1) + 1 = 2k + 2`, a one-dimensional class of type `(k + 1, k + 1)`: `(2,2), (3,3), (4,4), (5,5)`; §6.4 lists `(k + 1, k + 1)` | Agree. |
| §5.7 `ΠM^H` weights | `k = 1` | `M^H` weight `1`; `M′^H` weight `3` | `{1, 3}`, not pure. |
| §6.4 sketch: even-`k` class from `τ = 0` | `k = 2, 4` | `P₁(−1)`: weight `nk + 2 = 4, 6`, type `(2,2), (3,3) = (k/2 + 1, k/2 + 1)`; §6.4 lists `(k/2 + 1, k/2 + 1)` | Agree. |
| §3.6 `k = 2` control after attribution | `k = 2` | `ℚ(−2)` weight `4`, `(3,3)` weight `6 = 2k + 2` from §5.7 | Two classes of §6.4. |
| §5.7 degenerate `k = 0` | — | `k ≥ 1` is a hypothesis; at `k = 0`, `M = δ₀` is punctual (§3.6 Check), so head §9.6's input condition fails | Excluded by hypothesis. |
| Head §9.6 hypotheses for `M^H` | `r = 2, k ≥ 1` | `M^H` is pure of weight `k`, irreducible, of rank `k ≥ 1`, with finite singularities, so it is not constant | Hypotheses hold. |

## Checks run

- **Lean.** Ran `lake env lean packages/KloostermanMomentsAndPotentialAutomorphy/Suggested.lean` from
  the content checkout. Exit 0, with exactly four warnings "declaration uses `sorry`", at lines 90,
  109, 191 and 206. No `TauCeti.*` import, so nothing was built.
- **Signatures.** A scratch copy with `#check @name` for all 21 declarations elaborated with exit 0
  (only the same four sorry warnings). The elaborated types are unchanged from the job's
  `signatures.md`, for example `momentSeries_weights` and `momentSeries_eq_intPolynomial` keep
  `[Fact p.Prime]` and `0 < k`. The file is unchanged, so no binder changed.
- **Dependency check.** `gate --depcheck … --movable`:

  ```text
  depcheck: 240 roadmaps, 2194 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` on the README: "Cross-roadmap citations found nowhere: None";
  "Lean names found nowhere: None". The job's lead file listed 7, all of them stale MHM numbers.

No gate failures were listed for this round.

## For the maintainer

- **Stale MHM copy.** The board checkout's `packages/MixedHodgeModulesAndIrregularHodgeTheory` is an
  old copy. Reviewers and fixers reading it will see the stale numbering. The supplier's live text is
  its open roadmap pull request head.
- **MHM's former-numbering map.** It maps only the lettered ids, not the board-era `8.x`–`12.x`
  numbers. Other consumers that cite the board numbering would silently resolve to the wrong
  sections; this roadmap is now on the head numbering.
- **Ownership.** No new object needs a new owner. The weight of the rank-two constant quotient is
  particular to the Kloosterman inverse Fourier object, and the generic input is MHM §9.6 at the head.
  This roadmap's own section numbers are unchanged: §5.7 is new, and §§5.5–5.6 keep their numbers.
- **Cited names.** No name another roadmap cites has changed: no Lean name, and no section number of
  this roadmap.
- **Ownership against open pull requests** was checked with the provided index (`roadmaps show`,
  `roadmaps grep`); the overlap report lists no conflicting head.

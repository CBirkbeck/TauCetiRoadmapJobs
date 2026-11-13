# FIX-RT-LocalFieldsRamificationPartII~2

Repair of red-team round 2 (passes a and b) on `packages/LocalFieldsRamificationPartII`. Ten
findings, eight sections: two pairs overlap and are settled once. Files changed:
`packages/LocalFieldsRamificationPartII/README.md` and one docstring of
`packages/LocalFieldsRamificationPartII/Suggested.lean`. `design/plan.json`, `sources.toml` and
`metadata.toml` are unchanged (no new supplier gap, no new source).

## RT-LocalFieldsRamificationPartII~2a/F01 (P3) — applied

The witness holds. A valuation ring's maximal ideal is finitely generated exactly when it is
principal, exactly when the value group has a least positive element. `ℤ × ℤ` (lexicographic) has
`(0, 1)`, so `𝔪 = (π)` and `R[X]/(πX)` is finitely presented.

Change: §1.5 Check "nondiscrete valuation ring `R`" → "valuation ring whose maximal ideal is not
finitely generated (e.g. `𝒪_{ℂ_p}`)", plus the kernel argument and a negative control (composite ring
of `ℚ_p((t))`, `𝔪 = (p)`). The same rewording is made in the Layer 1 Examples and the §1.5 Prüfer
Check.

Pattern: README line 546 (§1.1 Check, "the normalization need not be a finite `V`-module") is an
existence claim. It is true for a dense-value-group immediate extension (`𝔪_V W = 𝔪_W`, so
`W/𝔪_V W = κ` has dimension 1, not `p`) and is left unchanged.

## RT-LocalFieldsRamificationPartII~2a/F02 (P3) — applied differently

The defect is real: the two EGA contracts need `Spec A′ → Spec A` faithfully flat, and the route
said only "flat". The proposed repair is valid, but it works around surjectivity, which actually
holds by the Prüfer property. Passing to the open image is therefore unnecessary.

Change: §2.1 route gains "`Spec A′ → Spec A` is surjective, hence faithfully flat", with the proof:
if `1 = Σ q_i a_i` with `q_i ∈ 𝔮`, take `q` a `q_i` of least value in `A_𝔮`; then
`q⁻¹ ∈ A′_𝔮 ∩ L = A_𝔮`, which is absurd.

Evidence: `A′_𝔮 ∩ L = A_𝔮` because `s·x ∈ A′ ∩ L = A` for `s ∈ A ∖ 𝔮`. Pass b reached the same
conclusion independently (its §2.1 row). No new supplier is needed, so the *Needs:* line is unchanged.

## RT-LocalFieldsRamificationPartII~2a/F03, RT-LocalFieldsRamificationPartII~2b/F03 (P3) — applied

The witness holds: at `P = ∅`, `hp : ringExpChar (ResidueField V) ∈ P` is false. Every valuation on
a field of characteristic `p` has residue characteristic exponent `p`.

Change: §6.5 Check "the hypothesis holds for every `P`" → "the closedness hypothesis holds for
every `P` and the residue hypothesis exactly for the `P` containing `p`; for those `P` the field is
separably tame, while `t^{1/p}` …". It now agrees with the `P = ∅` Check.

## RT-LocalFieldsRamificationPartII~2a/F04 (P3) — applied

The witness holds. Remark 2.4.7 (temkin17 lines 478–483) lists the separable analogues of the
splitting conditions and says nothing about `P`-closedness or the perfection. The identification of
the Galois groups of `l = k^{1/p^∞}` and of `k` is in §2.4.6, proof of (0) ⇒ (4) (temkin17 lines
469–470, printed p. 108).

Change: §0.3 "Temkin 2017, Remark 2.4.7, p. 108" → "The equivalence is proved here; the
identification of the absolute Galois groups of `K` and of its perfection on which it rests is Temkin
2017, §2.4.6, proof of (0) ⇒ (4), p. 108". The Mathlib lemma now names the direction it proves.

Other occurrences: §6.5 and the docstring of `isSeparablyTameField_of_isSeparablyPClosed` cited Lemma
3.2.5 and Remark 2.4.7 for the separable export, which neither states (Lemma 3.2.5, temkin17 line 796,
p. 116, is `P`-closed ⇒ `P`-tame). Both now say the separable form is derived here. §3.4's citation is
exact and unchanged.

## RT-LocalFieldsRamificationPartII~2a/F05, RT-LocalFieldsRamificationPartII~2b/F01 (P2) — applied

The witness holds. The separable closure of `𝔽_p(t)` is separably `{p}`-closed and imperfect, so
"the analogous separable statements" includes a false one. The true one is the contract
`gap:maximal-separable-p-extension` that AdicCoefficientsAndComparisonsPartII (README line 96, at its
open head) asks of this roadmap.

Change: §0.4 "The analogous separable statements hold inside `Kˢ`" → a proved statement: every
separable `P`-extension lies in a maximal one `K_{sP}`, separable of `P`-number degree and separably
`P`-closed; the perfection statement has no separable form. A new Check covers `𝔽_p(t)` with
`P = {p}` (not perfect, not `{p}`-closed) and `P = ∅`. *Needs:* adds §0.2 and `separableClosure`.

## RT-LocalFieldsRamificationPartII~2a/F06 (P3) — applied

The witness holds:
- §6.1 uses `K_i`, `κ_i` and `p_i`, which §5.2 defines;
- §6.1 uses the §2.7 bullet "residue characteristic exponent `1` ⇒ `IsTameField`";
- the Layer 6 Dependencies line omitted §5.2.

Change: §6.1 *Needs:* "§0.3, §0.4, §5.1" → "§0.3, §0.4, §2.7, §§5.1–5.2"; Layer 6 Dependencies
"(§§5.1, 5.3, 5.6)" → "(§§5.1–5.3, 5.6)".

Other occurrences: §6.2's route recurses on `K_i` and `κ_i`, so its *Needs:* gains §5.2. §6.3 reaches
§5.2 through §5.3, which it already lists.

## RT-LocalFieldsRamificationPartII~2b/F02 (P3) — applied

The witness holds: `K = ℚ`, `L = ℚ(√2)`, `E = L(√3, √6)`, `[E : L] = 2`. The minimal polynomials over
`L` of `√3` and `√6` have coefficients in `ℚ`, but `[ℚ(√3, √6) : ℚ] = 4`.

Change: §0.2 route "contains the coefficients of the minimal polynomials of its generators" →
`L_0` is generated by the coordinates of all `a_i·b_j` in a monomial basis `b_j`, and
`E_0 = L_0(a_i)`. The `L_0`-span of the `b_j` is then `E_0`, so `[E_0 : L_0] = [E : L]`. The witness
is a new Check.

## RT-LocalFieldsRamificationPartII~2b/F04 (P3) — applied

The witness holds: §2.9 uses `[L : K] = e·f` for local fields (README line 986, from
LocalFieldsRamification Layer 3) and for finite separable extensions of complete discretely valued
fields (line 999).

Change: Conventions "asserted only for finite tame extensions of henselian fields" → "proved here
only for …; for local fields it is LocalFieldsRamification's; for complete discretely valued fields
§2.9 derives it from §3a.1's Galois case". Two witnessed failures are added: a defect (`e = f = 1`,
degree `p`) and two prolongations (`ℚ(√2)/ℚ` at 7).

## Checks run

- **Elaboration.** From the content checkout, `lake env lean packages/LocalFieldsRamificationPartII/Suggested.lean`
  exits with status 0. Its output is nine `declaration uses 'sorry'` warnings, one per theorem, and
  nothing else. Both `TauCeti.*` imports had object files at the pin.
- **Binder check.** A scratch file with `#check @name` for all 16 declarations elaborated without
  errors. Every elaborated type matches its README statement and `signatures.md`; none changed (the
  only Lean edit is a docstring). The file has no `variable` block, so no binder can be lost.
- **Dependency check.**

  ```text
  depcheck: 207 roadmaps, 1898 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.
- **Citation resolver** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name
  of TauCetiRoadmap was found missing.
- **Ownership.** The only new object is the maximal separable `P`-extension (§0.4). `roadmaps grep`
  by object over main and the open heads finds only AdicCoefficientsAndComparisonsPartII, which
  requests it from this roadmap, so this roadmap owns it. No `Suggested.lean` name changed.
- **Gate failures.** None were listed for this round.

## Adversarial pass on new and changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions, `[L : K] = e·f` | tame `ℚ_p(p^{1/ℓ})`; wild `ℚ_p(p^{1/p})`; `y^p − y = s t^{−p}` over `𝔽_p(s)((t))`; immediate Artin–Schreier; `ℚ(√2)/ℚ` at 7 | `ℓ = ℓ·1`; `p = p·1` (supplier); `p = 1·p` (§2.9); `p ≠ 1·1`; `2 ≠ 1·1` at each of two prolongations | agrees with §§2.4, 2.9 | 2b/F04 |
| §0.2 descent `[E_0 : L_0] = [E : L]` | `ℚ(√2)`, `E = L(√3, √6)`; `E = L`; `L = K`; `𝔽_p(s,t)`, `L = K(s^{1/p})`, `E = L(t^{1/p})`; non-simple `K(s^{1/p}, t^{1/p})/K`; converse with `F = ℚ(√3)` | `L_0 = ℚ(√2)`, degree `2 = 2`; no generators, degree `1 = 1`; `L_0 = K`, `E_0 = E`; products `a^{p}= t` give `L_0 = K`, degree `p = p`; degree `p² = p²`; `E_0 = ℚ(√3) ⊇ F`, `[E_0 : ℚ] = 2` | true; old route gives `4 ≠ 2` | 2b/F02 |
| §0.3 perfection equivalence | `𝔽_p(t)ˢ`, `{p}`; `𝔽_p(t)`, `{p}`; `q ∉ P` | both sides true (`Kᵃ` is `{p}`-closed); `y^p − y = t` refutes both sides; both directions use only degree preservation, true | true | locator only (2a/F04) |
| §0.4 maximal separable `P`-extension | `P = ∅`; `P` all primes; `𝔽_p(t)`, `{p}`; `𝔽_q`, `{ℓ}` | `K_{sP} = K`; `K_{sP} = Kˢ`; separably `{p}`-closed, `X^p − t` irreducible over it (`t^{1/p} ∉ Kˢ`), degree `p`; `𝔽_{q^{ℓ^∞}}`, every finite extension of degree prime to `ℓ` | true; separable perfection analogue false | 2a/F05, 2b/F01 |
| §1.5 flatness Check | `𝒪_{ℂ_p}`; composite ring of `ℚ_p((t))`; `ℤ_p` | value group `ℚ`, `𝔪` not f.g., kernel `𝔪X·R[X]` not f.g. (its `X`-coefficients give `𝔪`); least positive `(0,1) = v(p)`, `𝔪 = (p)`, `R[X]/(pX)` f.p. and not flat; `𝔪 = (p)`, f.p. | Check correct; negative control shows nondiscrete is not enough | 2a/F01 |
| §2.1 surjectivity of `Spec A′ → Spec A` | `V = ℤ_(p)`, `A′ = ℤ_(p)[√d]`, `d` a nonsquare unit; `A′ = V`; height-2 `V`, `A′ = V_𝔭 = V[1/a]`, `L = K` | fibre over `(p)` is `𝔽_{p²} ≠ 0`, over `(0)` is `ℚ(√d)`; identity; `A = V_𝔭`, identity | surjective in each; the proof uses only that `A_𝔮` is a valuation ring and that `A′_𝔮 ∩ L = A_𝔮` | 2a/F02 |
| §6.5 Check | `𝔽_p(t)ˢ` with `P = ∅`, `{p}`, `{2,3}` (`p = 5`), `{1}` | closed in all four; residue hypothesis false, true, false, false; for `{p}`: only finite Galois subextension is `K`, inertia order `1`, separably tame; `t^{1/p}` purely inseparable, so not tame | consistent with the `P = ∅` Check | 2a/F03, 2b/F03 |
| §6.5 / docstring locators | Lemma 3.2.5 (temkin17 line 796, page header line 778 "116"); Remark 2.4.7 (line 478, page header line 445 "108") | the lemma states `P`-closed ⇒ `P`-tame; the remark states the separable analogues of (1)–(3) | locators now carry what they are cited for | pattern of 2a/F04 |
| §§6.1–6.2 *Needs:* | §6.1 terms `K_i`, `κ_i`, `p_i`; `p_i = 1` clause; §6.2 recursion | defined in §5.2 (chain and `p_i`); §2.7 bullet; `0 < i < d`, heights `i` and `d − i` from §5.2 | lists now complete | 2a/F06 |

## For the maintainer

- AdicCoefficientsAndComparisonsPartII declares `gap:maximal-separable-p-extension` against this
  roadmap. §0.4 (identifier `GF.0/maximal-p-extension`) now states exactly that contract, so the gap
  can be pointed to §0.4. No identifier of the `GF.k` table changed, and no section was renumbered,
  so the citations of AdicCoefficientsAndComparisonsPartII and QuadraticFormInvariantsPartII still
  resolve.
- No Lean name changed. Ownership against open work was checked by object against the open heads
  listed in `open-pull-requests.md`.
- Both reviews' "Source issues" sections flag a gap in Temkin 2017, proof of Lemma 2.3.8: surjectivity
  is not shown. The README route now proves it (§2.1). Those sections list no finding, and nothing
  else was changed because of them.

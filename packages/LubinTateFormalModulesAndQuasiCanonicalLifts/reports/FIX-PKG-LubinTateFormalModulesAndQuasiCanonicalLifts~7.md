# FIX-PKG-LubinTateFormalModulesAndQuasiCanonicalLifts~7

Review settled: `REV-PKG-LubinTateFormalModulesAndQuasiCanonicalLifts~6` (three findings, all P3).
Only `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md` changed. `Suggested.lean`,
`metadata.toml`, `sources.toml` and `design/plan.json` are unchanged. No gap was added: none is needed.

## F01 (P3) — applied

Verified. §5.5 began with an arbitrary elliptic curve over `R`, then used `G[ϖ₀^∞]`, `O₀`-stability
and `G_L`. For `O₀ = W(𝔽_(p²))` and ordinary `E`, the completion has `p`-height 1. A formal
`W(𝔽_(p²))`-module of `O₀`-height `h` has `p`-height `2h` (Conventions), so the completion has no
`O₀`-action. Separately, `K̄` (§5.1, §5.5) and "the integers of `K`" (§5.4) were used, but Layer 5
never named `K`.

Changes:
- **Layer 5 header.** "a finite extension of `F₀`" → "a finite extension `K` of `F₀`, with `K̄` a
  fixed algebraic closure of `K`".
- **§5.5 first sentence.** "Let `G` be the formal completion of an elliptic curve `E`…" → "Let `E`
  be an elliptic curve over `R` whose formal completion … is the formal group underlying the formal
  `O₀`-module `G`". Added: for `O₀ = ℤ_p` every curve qualifies (the `ℤ_p`-action is unique, `[a]`
  being the limit of `[n]`); for `O₀ ≠ ℤ_p` the action is data, and a curve without one is excluded.
- **§5.5 conclusion.** "isomorphic to `G_L`" → "isomorphic, as a formal group, to the formal group
  underlying `G_L`; the `O₀`-action on the completion of `E/H` is transported from `G_L` (for
  `O₀ = ℤ_p`, its unique `ℤ_p`-action)".
- **New §5.5 Check.** The ordinary curve is excluded for `O₀ = W(𝔽_(p²))` (`p`-height 1, not `2h`)
  and admitted for `O₀ = ℤ_p`.

Where this departs from the suggested repair: the reviewer's sentence pointed to "the curve of
§4.4" as the model case. I left §4.4 out of the statement and kept that instance in the existing
§5.5 Check. Naming §4.4 in the statement would have put a section in the statement that its
`*Needs:*` line does not list, which is the F02 defect. My witness for exclusion is the height
count rather than "there is no ring map `W(𝔽_(p²)) → ℤ_p`". The height count does not depend on
knowing `End(G)`.

I checked the same pattern elsewhere. The other places that use an elliptic formal group with a
non-`ℤ_p` action are §4.4, §8.5 and §9.3. All three get the action from the Lubin–Tate
endomorphism of §4.4, through the uniqueness statement of §1.3. §3.7 uses only `O_K = ℤ_p`.
`K̄` is not used elsewhere without a named `K`.

## F02 (P3) — applied

Verified. Each of the four statements names a section that its `*Needs:*` line did not list:
- §3.6 says "the coefficient bases of §3.1".
- §3.7 says "the deformation functor of §3.1".
- §7.2 says "(§6.6)".
- §7.3 says "the field of moduli of §6.6".

Changes:
- §3.6 `*Needs:*` "§§3.4, 3.5" → "§§3.1, 3.4, 3.5".
- §3.7 "§§3.6, 2.1" → "§§3.1, 3.6, 2.1".
- §7.2 "§§7.1, 3.6, 5.2" → "§§7.1, 6.6, 3.6, 5.2".
- §7.3 "§§7.1, 6.2, 6.5, 2.4" → "§§7.1, 6.6, 6.2, 6.5, 2.4".

The layer Dependencies already cover these: §3.1 is internal to Layer 3, and Layer 7 lists §§6.2–6.6.

I repeated the check across the whole roadmap with my own script, which compares the sections named
in each statement paragraph with its `*Needs:*` line for all 50 targets. Apart from these four, every
hit was one of the following, and none is a dependency:
- forward pointers: §0.2→§0.3, §0.3→§9.1, §1.4→§§2.1–2.4 and §3.1, §2.1→§2.2, §4.2→§7.5,
  §4.4→§8.5, §5.4→§§6.2, 6.6, §6.2→§§6.4–6.5, §8.5→§9.3;
- sections of other roadmaps: RelativeFarguesFontaine §2.5, ClassFieldTheory §2.6,
  GrossZagierAndArithmeticHeights §7.2, EndoscopicTransferAndUnitaryTraceComparison §§10.2, 12.3;
- source locators: BKO21 §5.0.x;
- items in §6.5's Needs that sit after a parenthesis my script did not parse; they are listed there.

After the edit the script reports none of the four.

## F03 (P3) — applied

Verified. Both closing sentences refer to a Check that is not in the text.

Changes:
- §1.3: "A wrong Check that forbids this for every `O` contradicts §1.3." → "The claim that the
  additive law is never a Lubin–Tate module fails here: the preceding bullet needs characteristic
  zero."
- §1.4: "A Check calling every unit comparison non-strict fails at `u = 1`." → "The claim that every
  unit comparison is non-strict fails at `u = 1`."

The computed content of both Checks is unchanged. A search for "Check" outside the `**Checks.**`
headers now finds nothing.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| §5.5 data: completion of `E` underlies the `O₀`-module `G` | `O₀ = ℤ_p`, any `E`; `O₀ = W(𝔽_(p²))`, `E` ordinary; `O₀ = W(𝔽_(p²))`, `E` the §4.4 curve (`a_(p²) = −2p`) | ℤ_p: `[p](X) ≡ g(X^p) mod p`, so `[p^k] → 0` (`(𝔪_R, X)`-adically), `[a] = lim [n]`, and any action has `[a] = [n] +_G [p^k]∘[b]`: unique. Ordinary: `p`-height `1 ≠ 2h` for every `h`, no action. §4.4: `[−p]` Lubin–Tate gives `O₀`-height `1`, `p`-height `2` | Holds; ordinary/`W(𝔽_(p²))` case is excluded by the data and recorded as a new Check |
| §5.5 conclusion, `O₀`-action transported | `O₀ = ℤ_p`, `H = E[p]`, `E` supersingular; zero `H`; §4.4 curve, `H = G[p]` | `L = p⁻¹T`, `#C_L = p²`, the quotient is `[p]` up to the target coordinate, and the transported action is the unique `ℤ_p`-action. Zero `H`: identity, action unchanged. §4.4: `L = ϖ₀⁻¹T` with `ϖ₀ = −p`, `#C_L = p² = q₀`, the quotient is `[−p]`, and the transported action is the Lubin–Tate action | Holds |
| §5.5 order-`p` `H` on the §4.4 curve (existing Check) | `p = 2`, `O₀ = W(𝔽₄)` | `G[2](K̄) ≅ 𝔽₄`; an `𝔽₂`-line `{0, x}` is not stable under a primitive cube root of unity `ω ∈ W(𝔽₄)` (`ωx ∉ {0, x}`) | Unchanged; holds |
| Layer 5 header `K`, `K̄` | §5.1 `C_L ⊂ G[ϖ₀^∞](K̄)`; §5.4 "integers of `K`" | `K ⊃ F₀ ⊃ ℚ_p` finite, so `K` is a characteristic-zero local field, consistent with Conventions; `R = O_K` is an `O₀`-algebra | Holds |
| §1.3 equal-characteristic Check | `O = 𝔽_q[[t]]`, `f = tX + X^q`; `q = 2`; `a ∈ 𝔽_q` | `f(X+Y) = t(X+Y) + X^q + Y^q = f(X) + f(Y)`; `f(aX) = taX + a^qX^q = a·f(X)` since `a^q = a`; at `q = 2`, `f = tX + X²` and `(X+Y)² = X² + Y²` | Holds; wording only |
| §1.4 unit-comparison Check | `ℤ₂`, `f = g = 2X + X² = (1+X)² − 1`, `u = 1, 3` | `u = 1`: `X`, derivative 1, strict. `u = 3`: `(1+X)³ − 1 = 3X + 3X² + X³`, derivative 3; `f∘[3] = [3]∘f = (1+X)⁶ − 1` | Holds; wording only |
| §1.4 `c` Check (re-derived because it sits beside an edit) | `q > 2` and `q = 2` | `q > 2`: `πc = π + cπ²`. `q = 2`: `g = πX + (1+π)X²`, `πc + 1 = (1+π) + cπ²`. Both give `c = (1−π)⁻¹` | Holds; untouched |
| §§3.6, 3.7, 7.2, 7.3 `*Needs:*` | sections named in each statement | §3.1, §3.1, §6.6 and §6.6 were missing; now listed | Fixed |

## Checks run

**Elaboration.** `lake env lean packages/LubinTateFormalModulesAndQuasiCanonicalLifts/Suggested.lean`,
run from the content checkout: exit 0 in about 6 s. The only diagnostics are five
`declaration uses 'sorry'` warnings, at lines 77, 91, 113, 129 and 151. No `TauCeti.*` module needed
building.

**Signatures.** I copied the file to a scratch location with `#check @name` for all seven
declarations and elaborated it once:
- `IsLubinTateSeries` and `IsLubinTatePolynomial` keep `CommRing` and `IsLocalRing`.
- The two construction theorems keep `IsDomain`, `IsDiscreteValuationRing`, the `Finite` residue
  field and `Irreducible π`.
- The two field theorems keep `IsNonarchimedeanLocalField`, `CharZero K`, `Irreducible π`, `1 ≤ m`
  and `↑ϖ = ↑π`.
- The elliptic theorem keeps `s = 1 ∨ s = −1`, `IsUnit W.Δ` and the point count.

All seven match their README statements. Nothing changed in the Lean file, and no binder was lost.

**Dependency direction.** Exact output:

```text
depcheck: 207 roadmaps, 1901 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

## Notes for the maintainer

- **Citations and ownership.** No cross-roadmap citation was added or changed, and no new supplier
  was named. The new §5.5 text cites only ModularCurves §7C and §2B, which I confirmed on main
  (headings "7C. Formal completion at the zero section" and "2B. Isogenies and quotients").
  Ownership is unchanged by this round.
- **Names.** No Lean names changed, and no section, layer or target ids changed.
- **Sources.** No new source was used. `needs-references.toml` was not written.
- **Suspicious text.** None found in the review.

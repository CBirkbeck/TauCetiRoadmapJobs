# FIX-RT-EllipticCurveModularityImaginaryQuadraticPartII~2

Repair of red-team round 2 (passes a and b) on `packages/EllipticCurveModularityImaginaryQuadraticPartII`.
Six findings, all verified against the sources and suppliers; all six are repaired, three of them
differently from the suggested text where that text was flawed. Files changed: `README.md`,
`sources.toml`. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

## RT-EllipticCurveModularityImaginaryQuadraticPartII~2a/F01 (P2) — applied differently

§7.4(a): the sentences that prescribed local extensions, applied CHT08 Lemma 4.1.2 and concluded "CM,
`L ∩ F_avoid = F`" in CaptainSude26's order → a family of target completions `N_u` (three cases, with a
proof that the cases do not clash), then the lemma over `F⁺` with avoided field `F̃_avoid`, then
explicit proofs that `L` is CM, soluble Galois, with `L ∩ F_avoid = F`.

*Evidence.* The finding holds: README §7.4(a), before this repair, followed CaptainSude26 lines 550–562
clause by clause. The suggested text calls the Galois closure of `F_avoid` `D`. That letter is already
taken in Layer 7 and the Conventions (`G_D` for the parent's field `D/ℚ`, and `D_t`), so the repair uses
`F̃_avoid`. The repair also proves the intersection claim, which neither the old text nor the suggestion
proved: by linear disjointness, `Gal(L⁺F̃_avoid/F⁺) = Gal(L⁺/F⁺) × Gal(F̃_avoid/F⁺)`; the subgroups
fixing `L` and `F̃_avoid` generate `Gal(L⁺/F⁺) × Gal(F̃_avoid/F)`, so `L ∩ F̃_avoid = F`. The lemma was
checked in two places: GL2ModularityLifting §1.7 (any number field, real places prescribable) and
CHT08 lines 5723–5726.

## RT-EllipticCurveModularityImaginaryQuadraticPartII~2a/F02 (P2) — applied

§5.3: "For `v ∈ P` and `σ ∈ I_v`, local reciprocity sends `σ` … makes it a point of the local problem
at `v`" → goal first (`tr ρ(σ) = 2`, `det ρ(σ) = 1` over `T_{χ,Q}/J_{χ,Q}`, i.e. §3.4(i)), then the
reduction (identities persist along ring maps and descend along injective ones), then the computation
at neat level, which keeps `Iw_v`.

*Evidence.* The old text followed CaptainSude26 lines 335–341 in the same order. The new text also
states a step the old text left implicit. The original Hecke algebra embeds into the one enlarged by
torus operators after a nilpotent quotient (`K = H ∩ L`, `H/K ↪ H_ext/L`). The neat level differs from
`K^P(Q)` only above two auxiliary primes outside `(S ∪ Q) ∪ (S ∪ Q)^c` (CrystallineLocalGlobalCompatibilityCM
§8.6; CaptainSude26 lines 367–372), so it is still `Iw_v` at `v`.

## RT-EllipticCurveModularityImaginaryQuadraticPartII~2a/F03 (P3) — applied differently

§6.1: "choice of test places" → "choice of its finite set `V` of auxiliary places of `F`": places prime to
`10` at which `ρ`, `π` are unramified, containing every place above one decomposed-generic witness and,
for each `L' ≠ F` inside the field cut out by `ρ̄`, a place not split completely in `L'` (CN23 lines
4455–4463). "under a test place" → "under a place of `V`".

*Evidence.* "test place" occurred only in these two places and was defined nowhere. The suggested
wording omits CN23's condition `v ∤ 2p` (line 4461), which is restored here as "prime to `10`". The
witness prime is not given a letter, because `q` is in use in the §6.1 Checks. CN23 takes the field
cut out by `ρ̄|G_{F(ζ_p)}`; here `ζ₅ ∈ F`, so this is the field cut out by `ρ̄`, as the text says.

## RT-EllipticCurveModularityImaginaryQuadraticPartII~2a/F04 (P3) — applied

§7.5(a): "(S3) the image of `G_D` contains the geometric monodromy …; genericity descends from `F`" →
the image is taken on the reduction of `V_η`, transported to `A_t[5]` through the parent's §4.2
`cubic_character_elliptic` and dualization, and genericity is transported the same way. The `*Needs:*`
line gains "EllipticCurveModularityImaginaryQuadratic §4.2 (`cubic_character_elliptic`)".

*Evidence.* (S2) and (S3) speak of the residual systems `V_θ` (README §Conventions, the switch-parameter
bullet). Both uses of (S2)/(S3) in §7.5(a), image and genericity, need the identification. §2.1 and §8.1
already cite §4.2, and the Layer 7 Dependencies already list it.

## RT-EllipticCurveModularityImaginaryQuadraticPartII~2b/F01 (P3) — applied differently

§7.4(b): "places of residue characteristic other than `2, 3, 5` and so distinct from those carrying the
other conditions" → the places above `Σ` avoid the Tate, discriminant and partition conditions; the
mod-three seed's good-reduction condition above an auxiliary `l > 5` is avoided because `l` is chosen
after, and prime to, all prescribed places (AKT23 Lemma 9.7 proof; Proposition 9.13). A §7.4 Check
was added.

*Evidence.* The finding holds. AKT23 Proposition 9.13 (lines 3700–3706) prescribes good reduction
with a fixed reduction above `l`. Lemma 9.7's proof requires `v ∤ l` for every prescribed `v`
(line 3494) and accepts any large `l` split in `M` (line 3506). The suggested Check's witness does
not hold, though. `l` splits completely in `M ⊇ ℚ(ζ_{5⁷})` (lines 3493, 3507), so `l ≡ 1 mod 78125`
and `l = 11` is impossible. In §7.5, moreover, `ρ̄` is ramified above `v | q`, so `q` never splits
in `M`. The Check added instead uses an unramified `Σ` whose residue characteristic splits
completely in `M` (`r ≡ 1 mod 4·3·5⁷`, e.g. the prime 937501). It also records why §7.5 is safe.
References and `sources.toml` (AKT23 locator and `cited_for` gain 7.4) now cite Lemma 9.7 (p. 75)
and Proposition 9.13 (pp. 79–80).

## RT-EllipticCurveModularityImaginaryQuadraticPartII~2b/F02 (P3) — applied

§5.2 gains a bullet defining `K^P(Q)` as `K^P_1(Q) ⊆ K^P_0(Q) ⊆ K^P`: equal to `K^P` outside `Q`; at
`w ∈ Q`, `Iw_w` and the kernel of `Iw_w → Δ_w`, `[[a,b],[c,d]] ↦ a/d mod ϖ_w`, with `Δ_w` the
five-power quotient of `k_w×`. The §5.3 Check's "its diamond kernel" → "`K^P_1(Q)_w`, of index
`12 · 5 = 60`". The §5.2 `*Needs:*` line gains CrystallineLocalGlobalCompatibilityCM §§9.6, 9.9.

*Evidence.* ACC23 §6.5, p. 169, lines 6819–6824 define `K₀(Q)_v = Iw_v` and `K₁(Q)_v` with quotient
`Δ_Q`. CN23 lines 4362–4368 take their image in `PGL₂` with `Δ_v = k_v×(p)`. In `PGL₂` the quotient
`(k×(5))²/diagonal` is `k×(5)` via `a/d`, which is scalar-invariant. CrystallineLocalGlobalCompatibilityCM
§§9.6 and 9.9 use `K₀(Q)/K₁(Q)` without defining them. References gain ACC23 §6.5 p. 169 and CN23 lines
4362–4368, and `sources.toml` ACC23 gains that locator with `cited_for` 5.2.

## Checks run

- **Elaboration.** From the content checkout, `lake env lean` on
  `packages/EllipticCurveModularityImaginaryQuadraticPartII/Suggested.lean`: exit 0, no output. The file is
  unchanged. It has no declaration, so the `#check @name` comparison has no subject, and no binders
  changed.
- **Dependency check** (`gate --depcheck … --movable`):

      depcheck: 249 roadmaps, 2395 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line. No supplier was added. The only new cross-roadmap citations are
  sections of roadmaps the README already cites: the parent's §4.2 and CrystallineLocalGlobalCompatibilityCM
  §§9.6, 9.9.
- **Citation resolver** on the revised README: three leads (`LeHung26`, `OpenAI26`, `CaptainSude26`
  read as roadmap names). These are source keys in parenthetical locators, so the leads are false
  positives. No unresolved Lean name.
- **Gate failures listed in the brief:** none were listed.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §7.4(a) `N_u` family | `Σ = ∅`; `u ∣ 5` inert in `F`; `u` below `Σ`, split / inert in `F`; `u` below `Σ` and above `q₀` | `L_{w'} = N_u = L⁺_{u'}` (place splits in `L`); `L_{w'} = F⁺_u = F_w`; `L_{w'} = F_w`, quadratic over `L⁺_{u'} = F⁺_u`; both rules give `F⁺_u` | no clash; `Σ = ∅` gives `solvable_preparation` | new text |
| §7.4(a) `L ∩ F_avoid = F` | `F` imaginary quadratic, `F̃_avoid = F`, `Gal(L⁺/F⁺) = C₂` | `C₂ × C₂`; fixing `L`: trivial; fixing `F̃`: `C₂ × 1`; generated `C₂ × 1 = Gal(L⁺/ℚ) × Gal(F/F)` | fixed field `F` | proof added |
| §7.4(a) CM and Galois | `L⁺` totally real, `F` CM | `L⁺ ∩ F = F⁺` (index 2, `F` not real); `Gal(L/F) ≅ Gal(L⁺/F⁺)` | true | none |
| §7.4(b) seed condition at `l` | `l = 11`; §7.5 `q`; unramified `Σ` over `r = 937501` | `11 mod 5⁷ = 11 ≠ 1`; `ρ̄(I_v) ∋ [[1,3],[0,1]] ≠ 1`, so `q` ramified in `M`; `937501 ≡ 1 mod 937500 = 4·3·5⁷` | the suggested witness fails; the justification is needed for general `Σ` | Check rewritten |
| §5.2 `K^P(Q)` | `q_w = 11, 31, 251`; scalar `diag(2,2)`; `q_w = 7` | indices `12·5 = 60`, `32·5 = 160`, `252·125 = 31500`; `a/d = 1`; `#Δ_w = 1`, `K₁ = K₀` (no Taylor–Wiles place, since `7 ≢ 1 mod 5`) | defined on `PGL₂`; `Iw_{w,1} ⊆ K₁ ⊆ Iw_w` | new bullet |
| §5.3 verification | `(X−1)²` against `tr`, `det`; `[[ζ₅,1],[0,ζ₅⁻¹]]`; character `χ_v` at `v` | `X² − 2X + 1`; trace `ζ₅ + ζ₅⁻¹ ≠ 2`; `(X − χ(u))(X − χ(u)⁻¹)` | (i) ⇔ two identities; Checks agree | reworded |
| §5.3 embedding `H/K ↪ H_ext/L` | `I² = J² = 0` | `L = IH_ext + J`, `L³ ⊆ Σ_{i+j=3} I^iJ^j = 0`; `I ⊆ H ∩ L = K` | injective, nilpotent | stated |
| §6.1 set `V` | `F'/F` Galois with `V` split; `L' ≠ F` | a place of `V` not split in `L'` but split in `F' ⊇ L'` is impossible, so `F' ∩ L = F` | `ρ̄(G_{F'}) = ρ̄(G_F)` and the witness kept | defined |
| §7.5(a) via §4.2 | `g = [[1,3],[0,1]]`; generated group | `(gᵀ)⁻¹ = [[1,0],[2,1]] ∈ SL₂(𝔽₅)`; order of `⟨[[1,3],[0,1]], [[1,0],[3,1]]⟩` is `120` | image of `G_K` on `A_t[5]` is `SL₂(𝔽₅)` | supplier added |

Recomputed against the same objects: §7.4 Checks 1–5 (unchanged values: `8` and `6` points over
`𝔽₅`, traces `−2`, `0`); the §5.3 Check indices (`12`, `60`, `#k_w× = 10`); the §7.5 Checks (order
`120`).

## Repair the pattern

- Wording that tracks CaptainSude26: the two passages named are rewritten. The new sentences were
  checked against CaptainSude26 lines 315–372 and 538–603. The longest shared run is the noun phrase
  "two auxiliary rational primes".
- Undefined terms: `test place`, `diamond kernel` and the level `K^P(Q)` are now defined, and `Δ_Q` with
  them. No other occurrence remains.
- `*Needs:*` lines against the text: §7.5 now names the parent's §4.2. §5.2 now names
  CrystallineLocalGlobalCompatibilityCM §§9.6, 9.9 for its new bullet. §§2.1 and 8.1 already named §4.2.
- The "residue characteristic avoids 2, 3, 5" justification occurred twice. In §7.4(a) it is correct,
  since `solvable_preparation` prescribes nothing elsewhere, and it is kept in the new text as "prime
  to `30`". In §7.4(b) it was repaired.

## Ownership and notes for the maintainer

- No new target and no new construction owned. `K^P(Q)` is the supplier's `K₀(Q) ⊇ K₁(Q)`
  (CrystallineLocalGlobalCompatibilityCM §§9.6, 9.9) for this roadmap's level, and is cited as such.
  `V` is CrystallineLocalGlobalCompatibilityCM §9.11's set.
- Ownership against the open pull requests was checked only for the citations touched: the parent
  (EllipticCurveModularityImaginaryQuadratic, §0.3 and §4.2) and CrystallineLocalGlobalCompatibilityCM
  §§8.6, 9.4–9.11 were read at their heads through `roadmaps show`, and GL2ModularityLifting §1.7 at its
  head.
- No name, section number or target that another roadmap cites has changed.

# Repair report: red-team round 2 of LogicAndDefinabilityInNumberTheoryPartII

Files changed: `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md`, `packages/LogicAndDefinabilityInNumberTheoryPartII/sources.toml`. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged (no new supplier gap: both P1 prerequisites are stated here as targets).

## RT-LogicAndDefinabilityInNumberTheoryPartII~2a/F01 (P1) — applied

Old: 1.5(b), 1.3 and 1.1 took Kato's complex from MotivesAndAlgebraicCycles §0.5b (smooth over a perfect field only). New: target 1.1a, owned here — (a) regular excellent schemes, (b) schemes over a regular excellent base, (c) residues compose to zero (Jannsen–Saito–Sato Thms 2.1.1, 2.5.4, 2.5.10); spectral sequence imported from PurityForFlatCohomology §8.4. 1.1, 1.3, 1.5(b) re-pointed.

## RT-LogicAndDefinabilityInNumberTheoryPartII~2a/F02, RT-LogicAndDefinabilityInNumberTheoryPartII~2b/F04 (P3) — applied

Old: 0.12(a) asserted bad reduction of `E_u` with no supplier. New: `T_ℓ(E_u) ≅ T_ℓ(E) ⊗ χ_u` from the twist's point isomorphism (EllipticCurves Layer 5); inertia at the ramified `v` acts by `−1`; Néron–Ogg–Shafarevich (i), EllipticCurves Layer 4 (on main), gives bad reduction. Needs, contract and the `𝔽₅` Check (`T₃`) extended. Review a's alternative supplier (NeronModels §5.1) not needed.

## RT-LogicAndDefinabilityInNumberTheoryPartII~2a/F03 (P3) — applied differently

Confirmed: (0.6) is at kerz_saito line 188, page 4. Old 1.5(b) sentence citing "(0.6), p. 2" was rewritten to cite 1.1a (whose locators are Jannsen–Saito–Sato and Kerz–Saito (1.2), (1.6), (1.9)), so (0.6) is cited nowhere; the References entry now reads "(0.2) and (0.4) (p. 2), … (1.2) (pp. 6–7) …" instead of moving (0.6) to p. 4.

## RT-LogicAndDefinabilityInNumberTheoryPartII~2b/F01 (P1) — applied

New target 1.3a (placed before its consumer 1.4, hence not "1.4a"): `p`-primary étale homology over a finite field — (a) duality and top-degree Gysin sequence, (b) Kato complex, (c) level, (d) weights, (e) Gersten pullbacks (PB), (f) Lefschetz condition. 1.4 (both ranges of `d`) re-pointed; (e) added because Kerz–Saito's (PB) for `ℓ = p` needs their §5.

## RT-LogicAndDefinabilityInNumberTheoryPartII~2b/F02 (P2) — applied

New paragraph in 5.6: for Pop's Lemma 4.3(3) in characteristic `p`, pass to a finite purely inseparable `l′/l` making the model smooth (Stacks 0BXT, 038X), run Pop's argument over `L′ = L ⊗_l l′`, restrict the place. New Check recomputed with `α = 2` (a nonsquare; `α = 1` would make `H^f_{δα} = 0`). Stacks tags added to Needs/References.

## RT-LogicAndDefinabilityInNumberTheoryPartII~2b/F03 (P2) — applied

Old 7.1(f): "interpretation of `A` in ℤ and a definable injection into a power of ℤ". New: AKNS Cor. 2.24 — also an interpretation `f` of ℤ in `A` and an injection `A → f*(ℤ)` (or a finite power) definable in `A`. Added the `(ℤ, +)` non-example Check; 7.2 and the `ℤ[1/2]` Check now name the interpretation of ℤ used.

## Verification of each finding (evidence read this round)

- a/F01: MotivesAndAlgebraicCycles §0.5b (head of its pull request, line 163) is "for … smooth `X` over its perfect ground field", prime-to-characteristic étale. `Spec ℤ[i][t]_{(t,3)}` is mixed characteristic. Jannsen–Saito–Sato (fetched, arXiv v3, key `jss_duality`): §2 setting "noetherian excellent regular scheme, `n` invertible" (jss_duality line 858–859), Theorem 2.1.1 (line 873), Theorem 2.5.4 (line 1092), Remark 2.5.5 (line 1101–1108), Theorem 2.5.10 (line 1136). PurityForFlatCohomology §8.4 states the coniveau spectral sequence for any finite-dimensional Noetherian scheme. `roadmaps grep` finds no other owner of "Kato complex", "Kato homology" or Jannsen–Saito–Sato.
- b/F01: kerz_saito line 836–845 and 876–885 (Suwa, Gros–Suwa, Colliot-Thélène–Sansuc–Soulé in the case `ℓ = ch(k)`), line 986–997 and 1456–1463 (pullbacks (PB) for `p`-torsion only through §5 and Gersten), line 1867–1868 (Theorem 8.1 uses Theorem 3.5 and Theorem 4.1). CrystallineCohomology §CR.4.8 on main defines the sheaves and the `1 − F`, `R − F` and restriction sequences only. jannsen_hasse line 581–583 and 1041–1046 show Jannsen's route for `d > 3` uses the same weights and top-degree Gysin sequence. jss_duality Corollary 3.10.1 (line 1728–1732), Theorem 3.11.3 (line 1758–1768), (3.5.2) (line 1389–1393), Theorem 3.6.2 (line 1457). No roadmap owns these (`roadmaps grep` for Jannsen–Saito–Sato, Gros–Suwa, Suwa, Moser, logarithmic Hodge–Witt duality/purity; CrystallineCohomologyPartII uses Gros cycle classes only).
- b/F02: pop_eei2 line 334–337 (`U_X` defined from smoothness of the generic fibre), 344–349 (`U_f ⊆ U`), 564–568 and 576–593 (Lemma 4.3(3) applies Lemma 3.3 to the minimal regular model of `L|l`). Recomputed: for `p = 5`, `α = 2`, `u = x⁵ − a`, `w² = 2y⁴ + 2y² + 2`, maximal ideal `(y)` at `y = 0` (since `x⁵ − a = y²`, `w² − 2 = 2y²(y² + 1)`), gradient of `y² − x⁵ + a` zero there; over `l(a^{1/5})`, `w₁² = 2(z⁴ + z² + 1)` with `X² + X + 1` of discriminant `−3 ≢ 0 (mod 5)`. Stacks Lemma 33.27.4 (tag 0BXT) read at stacks line 2239–2241; Lemma 33.12.6 (tag 038X) at line 1082 and 1174.
- b/F03: akns line 783–797 (Proposition 2.23 and Corollary 2.24 require the interpretation `f` of ℤ in `A`), 834–835 (Lemma 2.26). `(ℤ, +)` witness checked: Presburger arithmetic is decidable, the ring ℤ's theory is not, so no interpretation of the ring in `(ℤ, +)` exists even with parameters.
- a/F02, b/F04: EllipticCurves on main, Layer 4, "Néron–Ogg–Shafarevich (discrete strand)" statement (i) (its README line 851): good reduction implies unramified `T_ℓ`, `ℓ ≠` residue characteristic, over complete `K` with perfect residue field — the completion of a global function field at a place qualifies.
- a/F03: kerz_saito page markers line 151 (p. 4) and 202 (p. 5); (0.6) at line 188.

## Checks

**Elaboration** (`lake env lean packages/LogicAndDefinabilityInNumberTheoryPartII/Suggested.lean`, run from the content checkout): exit 0, 15 s; output is exactly the eight `declaration uses 'sorry'` warnings at lines 55, 63, 74, 85, 97, 117, 132, 143. No `TauCeti.*` import is used, so nothing had to be built.

**Signatures.** All ten declarations were `#check @name`ed in one scratch file and elaborated once (exit 0). Each elaborated type equals its README statement (0.1 `kroneckerDimension`, 0.2 `IsGeometricPrimeDivisor`, 0.8, 0.10(e), 0.13a, 0.14, 5.7, 6.9, 8.4, 8.5); no binder is lost, every theorem binds its hypotheses in its own statement. Nothing changed in the Lean file this round.

**Dependency check:**

```text
depcheck: 244 roadmaps, 2290 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. New supplier edges: PurityForFlatCohomology §8.4 (open pull request adding a new roadmap folder, earlier in the merge order) and EtaleCohomologyFoundations §F.5 (on main).

**Citations:** `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. **Manifest:** `sources check sources.toml`: 0 problem(s).

**Gate failures listed by the brief:** none.

## Adversarial pass (new and changed statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1a(a) regular `X` | `Spec ℤ_(3)`, `n = 2`, `c = 1`; `X` a field | class of `3` ↦ `−v₃(3) = 1 ≠ 0`, of `−1` ↦ `0`; single column | residue, not zero map | Check |
| 1.1a(c) composite | `ℤ[i][t]_{(t,3)}`, `α = (t)∪(3)∪(1+i)` | `(1+i)² = −i`, `(1+i)⁴ = −1`: generator of `𝔽₉ˣ`; via `(t)`: `[1+i]`; via `(3)`: `[1+i]`; sum `2[1+i] = 0` | true; each term nonzero | Check |
| 1.1a, `n` invertible | `Spec ℤ_(2)`, `n = 2`, class of `−1` | `ℚ(i)/ℚ` ramified at 2 ⇒ image in `H²_x ≠ 0`; `v₂(−1) = 0` | hypothesis needed | Check |
| 1.1a(b) | `S = Spec 𝔽_q`, `X = Spec 𝔽_{q^m}` | complex `H¹(𝔽_{q^m}, ℤ/n) = ℤ/n`, `KH₀ = ℤ/n` | agrees with 1.3 | Check |
| 1.1a(b) indexing | finite field and henselian DVR | Kerz–Saito `H_a = H^{2−a}(Rf^!Λ(1))` is Jannsen–Saito–Sato `H_{a−2}(X/S, Λ(−1))`; both give `E¹_{a,b} = ⊕ H^{a−b}(κ(x), Λ(a))`; `cd = a + 1` gives zero for `b < −1` | consistent | none |
| 1.3a(a) | `X = Spec k`, `d = 0`; Gysin degrees | `Rf^!ℤ/pⁿ = ℤ/pⁿ`; `H_a(Y) = H^{2d−a−2}(Y, ℤ/pⁿ(d−1))` etc. | sequence as stated | none |
| 1.3a(c) level | `𝔾_m`, `d = 1` | `dlog t ∈ H₁`; `H_b = 0` for `b < 0`; `H₀(𝔾_m, ℤ/p) ⊇ H¹(k, 𝔽_p·dlog t) = ℤ/p` (Cartier-fixed forms on `k̄[t, t⁻¹]` are `𝔽_p·dlog t`) | level is `−1`, not `0` | Check |
| 1.3a(d) weights | `ℙ¹`, `i = 2`, `r = 1`; ordinary `y²+xy = x³+1/𝔽₂`; supersingular `y²+y = x³` | `q/q = 1`, weight 0 (2 without the division); `T²+T+2`, geometric Frobenius `1/α`, `|α|² = 2`, weight −1 (arithmetic: +1); `E(k̄)[2] = 0` gives 0 vs `ℓ`-adic dimension 2 | conventions pinned | Checks |
| 1.3a(b) | `Spec 𝔽_{2^m}` | `H₀ = H_{−1} = ℤ/2`, complex `ℤ/2` in degree 0 | matches 1.4's `d = 0` Check | Check |
| 0.12(a) | `𝔽₅`, `y² = x³+x+1`, `v = ∞`, `ℓ = 3` | pole order 3 odd ⇒ ramified; inertia acts by `−1` on `T₃(E_u) ≅ ℤ₃²`; `−1 ≠ 1` also for `ℓ = 2` in odd characteristic | bad reduction | Check extended |
| 5.6, `L ⊗_l l′` | `l′/l` purely inseparable, `L/l` separable | reduced and local Artinian ⇒ field; `[L′:L] = 5^m`, prime to `n = 2`; `G_{L′} = G_L`; `v_{Q′} = e·v_Q` | properties descend | none |
| 7.1(f) | `(ℤ, +)`; `ℤ[1/2]` | old wording satisfied, not bi-interpretable; new wording: ℤ interpreted via `ℚ` and 0.7(3) | old false, new true | Checks |

## For the maintainer

- New targets 1.1a and 1.3a are owned here; ownership was checked by object over main and the open heads (`roadmaps grep`); no other roadmap states Kato's complex or Kato homology, Jannsen–Saito–Sato's comparisons, or `p`-primary duality, level, weights or Gersten for logarithmic Hodge–Witt sheaves.
- MotivesAndAlgebraicCycles §0.5b is no longer a supplier: the Scope names it as the smooth case 1.1a agrees with. New suppliers: PurityForFlatCohomology §8.4 (open pull request), EtaleCohomologyFoundations §F.5 (main). No supplier gap was added.
- New manifest key `jss_duality` (Jannsen–Saito–Sato, arXiv:0910.3759v3, certified); its numbering is that of v3. Kerz–Saito cite an earlier numbering of it ("Theorem 2.10", "Remark 2.5(2)", "Corollary 2.17"), absent from v3; the README cites v3 numbers only.
- No Lean name changed; no section, layer or target id was removed or renumbered (1.1a and 1.3a are additions), so no citing roadmap is affected.
- No text in the reviews or fetched sources was treated as an instruction; nothing suspicious found.

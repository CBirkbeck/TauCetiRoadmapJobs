# GATE-NonordinaryCMSpecialValues~1: answers to the human review of `d606431`

Ten points in one comment (F01–F10 of the comment are H01–H10 here). Nine applied, one applied differently, none disputed. The repairs are in commit `26e27c66` on the pull-request branch. Line numbers below are those of `TauCetiRoadmap/NonordinaryCMSpecialValues/README.md` and `Suggested.lean` at that commit.

## H01 (CBirkbeck) — applied

Right: FINIS06 Lemma 3.5(4) (line 860) is stated on all of `V_{d,C}`, where Proposition 2.2 allows multiplicity above one (lines 481–483), and `(u + iv)† = u − iv` is not proportional to `u + iv`. Old §4.3 API "for a Shintani eigenfunction `ϑ† = γϑ` with `|γ| = 1`" → new §4.3 API (line 644): "for a nonzero `ϑ` in the eigenline of a character `λ` in `V^{prim}_{d,C}` … `ϑ† = γϑ` for a unique `γ` with `|γ| = 1`; no such assertion is made for an eigenspace of `V_{d,C}` of dimension greater than one". This head has no nonvanishing Check on `†` to restrict; two Checks are added (lines 649–650: the `u + iv` witness, and `iϑ` with constant `−γ` together with `ϑ = 0`, where no `γ` is selected). The same `0/0` pattern is repaired in Yang's formula and in (13), which now assume a nonzero eigenfunction (§4.4).

## H02 (CBirkbeck) — applied

Right: every lattice `p^kT₀` carries the same character, so "the rank-one realisation" fixed no lattice and "`γ` generates `T_φ^∨`" had no meaning. Conventions (line 41) now fix `T_φ` by `T_φ|_{G_H} = T_pE ⊗_{O_Φ} R` for the curve of the period datum (BKO21 lines 409–411); §2.4 has a new target, the integral dictionary (line 400): `γ` is an `R`-basis of `T_φ^∨`, proved through an `O_K`-linear isogeny `E_f → E_H` over `K(f)` of degree `N(tf)` prime to `p`, with three Checks (lines 416–418: `p⁻¹T_φ`, an isogeny through `[5]`, the `Z`-dual against the `O_K`-dual). §2.7 (line 466) cites it instead of stating it as an unproved need.

## H03 (CBirkbeck) — applied differently

Right: old §4.2 was exactly FINIS06 §2 (lines 166–623) and old §4.3 exactly FINIS06 §3 up to Proposition 3.7, under §3's own title. Layer 4 is regrouped by object, keeping every target and locator: §4.1 "Local root numbers and the invariant μ_ℓ" (renamed), §4.2 theta spaces with `T^{ar}`, `T^{int}`, normalisation and `†` (line 607), §4.3 the Shintani representation, its spectrum, `F*` on `T^{int}` and `†` on eigenlines (line 631), §4.4 the central-value formula: `l`, Yang's formula, `b`, `b′`, `b_ar`, `b_ℓ`, (13), (15) (line 652); old §§4.4, 4.5, 4.5a, 4.6 become §§4.5–4.8, and every internal reference (§§4.7–4.8, 5.1, 5.2, 5.4, the scope, the supplier contract, the Lean docstring) is renumbered. No roadmap on main, at an open head or among the board's packages cites this roadmap's §4.x, so no mapping table is needed. Differences from the suggestion: the line it quotes no longer says "following Finis" at this head (line 589), so it is left as is; Glauberman–Rogawski and Murase–Sugano are not added, because every statement of §§4.2–4.3 is cited where FINIS06 states it (Proposition 2.2, Lemma 3.1, Lemma 3.5, with lines), and a locator cannot be fixed in a text that has not been read.

## H04 (CBirkbeck) — applied

Right: `ψ = φ³/N` satisfies `ψ((n)) = κ_K(n)³n = κ_K(n)n` and the conjugation law, `3 + 2i ≡ 1 mod (1 + i)³` (since `2 + 2i = −i(1 + i)³`), and `ψ((3 + 2i)) = (−9 + 46i)/13 ≠ 3 + 2i`. `Suggested.lean` line 82, "Equivalently (Jia, Property 1), `φ((n)) = κ_K(n) n` …" → "Among characters already of ideal type `(1,0)` for `ι`, the conjugation law is equivalent to … (Jia, Property 1). The rational law alone does not imply the predicate: … `φ³/N` … has type `(2, −1)`." The Lean definition is unchanged; the witness is a new §0.1 Check (line 158), matching JIA24 line 122, where Property 1 assumes type `(1,0)`.

## H05 (CBirkbeck) — applied

Right: the product decomposition of old §3.3 needs exactly one place of `F_n` over each place of `H`, i.e. the total ramification of §3.5, while §3.5 needs §3.4 and §3.4 needs §3.3. §3.3 (line 538) now proves only that `pO_K` splits completely in `H`, in the ring class fields of conductor prime to `p` and in `HL[r]`, with two new Checks (`Q(√−23)`, `p = 5`: three places; ray class field of conductor `23` over `Q(√−7)` does not split `(5)`); the decompositions, evaluation and augmentation move to a new §3.6 (line 569), proved from §§3.2, 3.3, 3.5 by `[F_n : H] ≤ (p² − 1)p^{2n} = [Φ_n : Φ]`, with a degree-count Check (`72/24 = 3 = h_K`). The forward API bullet of §3.1 ("`Φ_n` is the Lubin–Tate division field after §3.5") is deleted, §5.6 *Needs* gains §3.6, and the former-numbering row is NCM.2 → §§3.1–3.6.

## H06 (CBirkbeck) — applied

Right: with `P = ∅` the condition over `P` is empty, so `M(2, 1/2) = 1`. §6.1 Check (line 852): "for `c < 0` … excluded by the nonvanishing condition, so `M(q, q^c) = 0`" → "For nonempty `P` it fails the nonvanishing condition, so `M(q, q^c) = 0`; for `P = ∅` … `M(q, t) = (2⌊t⌋ + 1)²` for `t ≥ 0`, so `M(2, 1/2) = 1`". The existing Check that both theorems are vacuous for `P = ∅` beyond `Q = 2` stays; the Lean statements are unchanged.

## H07 (CBirkbeck) — applied

Right on both: `(1 − 0)⁻¹ = 1`, and the anticyclotomic `Z_5`-family of `Q(√−7)` has exactly four characters of order `5`. §0.3 Check (line 199) now tests primitivity: for `μ` of conductor `(7)` over `Q(i)` (ray class group of order `48/4 = 12`), `(φμ)·μ⁻¹ = φ` has factor `7/8` at `(7)`, while the modulus of the factors gives `1`. §6.5 Check (line 894) now tests the infinite families `c = 2k` (sign `+1`, finitely many zeros) and `c = 2k + 1` (sign `−1`, value `0`), and the Layer 6 example (line 901) says the same instead of "almost all others".

## H08 (CBirkbeck) — applied

Right: for `ν` anticyclotomic of finite order, `φν` again satisfies `IsEquivariantTypeOneZero ι`, so `(φν)((p))/p = κ_K(p) = −1` without oddness, and Jia's family is every finite-order ring class twist (JIA24 lines 33–39). `hνodd` is deleted from `centralValue_parity_dichotomy` (`Suggested.lean` line 181) and "odd" from its docstring and from §§1.4, 6.4, 6.5 (lines 303, 880, 890); §1.4's route uses the rational law for `φν` and no longer lists §1.2; oddness stays in §§0.6 and 1.2. To keep §6.4's route valid for even `ν`, §0.2 (line 163) now proves that every finite-order anticyclotomic character is trivial on the ideles of `Q` (its restriction is `1` or `κ_K`, and `κ_K` is odd at infinity), and the §0.1 Twists bullet (line 149) states that `φρ` is again equivariant of type `(1,0)`. Checks added in §1.4 (line 313: `Q(√−15)`, `p = 7`, genus `ν`, `(φν)((7)) = −7`) and §0.2 (line 179: finite order, not odd order, is what the statement needs; `φ|·|^{1/2}` gives `−1` on `(7)`).

## H09 (CBirkbeck) — applied

Right: Completed/ArithmeticDirichletSeries/README.md on main has ideal counts in Layer 5 (line 239) and Abel summation in Layer 6, 6.1 (line 258). The supplier line (line 121) now reads "Layer 3 …, Layer 5 (polynomial bounds for ideal counts) and Layer 6, 6.1 Abel summation"; §6.2's route names Abel summation for the tail, and §6.2 *Needs* and the Layer 6 dependencies cite Layer 6, 6.1.

## H10 (CBirkbeck) — applied

Right: with `f_0 = O_K` the four units are separated only modulo `7`; a local unit `≡ i mod 7` has trivial Artin symbol on `K(7)`, and the Hecke character of the canonical curve over `K(7)` is `≡ i ≠ 1` there, so the reduction is bad above `7`. The §2.5 bullet (line 441) now opens: "This pair fails the good-reduction hypothesis …, and the reciprocity statement is not applied to it; the bullet tests only the torsion points, the order of the zero of `_aθ_E` and the ray degrees"; its numbers are unchanged. The translation Check (`f_0 = (8)`) meets the hypothesis, since `−1, ±i ≢ 1 mod 8`.

## Build and gate

- `lake build TauCetiRoadmap.NonordinaryCMSpecialValues.Suggested`: `Build completed successfully (18474 jobs).` Three warnings `declaration uses 'sorry'`, at lines 141, 151 and 177 (the three headline theorems); no errors.
- Gate: `gate NonordinaryCMSpecialValues: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (complete output): `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- Citation resolver on the README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."

## Signatures

I appended `#check @name` for the ten named declarations (`conductorModulus`, `IsAnticyclotomic`, `IsEquivariantTypeOneZero`, `IsPAnticyclotomic`, `eulerFactor`, `HasCentralValue`, `rohrlichCount`, `rohrlichCount_eq_zero`, `rohrlichCount_lt`, `centralValue_parity_dichotomy`) to the module, elaborated it once with the build command above, and removed them again (the committed file has no `#check`; the local instance `factPrime` was read in place). Every elaborated type matches its README statement and keeps its binders (`[IsCMField K]`, `[Algebra.IsQuadraticExtension ℚ K]`, `[Fact (Nat.Prime p)]`, `hp`, `hv`, `hφ`, `hφv`, `hν`, `hνac`, `hνv`, `hϖ`). The only change from the previous signatures is that `centralValue_parity_dichotomy` no longer has `Odd (orderOf ν)`, so it is strictly more general; the other Lean edits are docstrings.

## Adversarial pass on changed and added statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: `T_φ` fixed by `T_pE ⊗ R` | `T₀` and `p⁻¹T₀` | same character; duals `T₀^∨` and `pT₀^∨`; `γ ∈ T₀^∨ ∖ pT₀^∨` | lattice must be fixed | fixed; Check |
| §2.4 integral dictionary | `Q(√−7)`, `p = 5`, `f = (√−7)`; `t = 1/√−7` and `t = 5/√−7`; split `p` | `tf = O_K`, degree `1`; `tf = (5)`, degree `25`, vector `5γ`; split: `y` with `v_𝔭 = 1`, `v_𝔭̄ = −1` has `N(y)` a `p`-unit but is no unit | true for inert `p` with prime-to-`p` `h` | target scoped to the inert `p`; 3 Checks |
| §2.4 `Z`-dual vs `O_K`-dual | `Q(√−7)` at `5` and at `7` | inverse different a unit at `5`; index `7` at `7` | agree at inert `p` | Check |
| §3.3 splitting | `Q(√−23)`, `p = 5`; `Q(i)`, `p = 3`, ring class conductor `5`; ray class conductor `23` of `Q(√−7)` | `(5)` principal: 3 places; `h(Z[5i]) = (5/2)(4/5) = 2`, `(3)` principal: splits; `±5 − 1 ∈ {4, −6}`, not divisible by `23`: not split | ring class true, ray class false | 2 Checks |
| §3.6 decomposition | `Q(√−23)`, `p = 5`, `n = r = 0`; `Q(√−7)`, `p = 5` | `[F_0 : K] = 72`, local `24`, `3` factors; `h_K = 1`: one factor of degree `24` | true | moved after §3.5; Check |
| §4.3 `†` on eigenlines | 2-dimensional eigenspace; `iϑ`; `ϑ = 0` | `(u + iv)† = u − iv`; `γ_{iϑ} = −γ_ϑ`; `0 = γ·0` for all `γ`; for `ϑ ≠ 0`, `(ϑ†)† = ϑ` gives `|γ|² = 1` | true only for nonzero `ϑ` in a line | restricted; 2 Checks |
| Yang's formula, (13) with `ϑ = 0` | `ϑ = 0` | `|l(0)|²/⟨0,0⟩ = 0/0`; `b_ar(0,0)⁻¹` undefined | nonzero needed | "nonzero" added |
| §0.1 converse (Lean docstring) | `ψ = φ³/N` over `Q(i)`, `x = 3 + 2i` | `ψ((n)) = κ_K(n)n`; `ψ((x)) = (−9 + 46i)/13` | rational law alone insufficient | docstring; Check |
| §0.1 Twists: `φρ` equivariant of type `(1,0)` | `Q(√−15)`, canonical `φ`, genus `ρ` | `(φρ)_∞ = φ_∞`; `φρ(ā) = conj φ(a)·ρ(a)⁻¹ = conj(φρ(a))` since `ρ(a) = ±1` | true | bullet strengthened |
| §0.2 finite order ⇒ trivial on `A_Q×` | genus character of `Q(√−15)`; class character of `Q(√−31)`; `φ|·|^{1/2}` over `Q(i)` | `χ_5(n²) = 1`; rational ideals principal, `1`; at `(7)`: `−7/7 = −1` | finite order needed, oddness not | statement generalised; Check |
| §1.4 for even `ν` | `Q(√−15)`, `p = 7` (`−15 ≡ 6`, nonresidue), genus `ν` | `(φν)((7)) = −7`; `ν(𝔮_3) = (3/5) = −1` | §1.4 true; §1.2 keeps oddness | hypothesis dropped; Check |
| `centralValue_parity_dichotomy` without `hνodd` | `Q(√−7)`, `p = 5`, `ν = 1`; `Q(√−15)`, `p = 7`, genus `ν` | signs for `c = 0, 2, 3, 4`: `+, +, −, +` times `W(φν)`; both parities infinite (§0.2) | no counterexample | Lean hypothesis deleted |
| §6.1 Check, `c < 0` | `P = ∅`, `q = 2`, `c = −1`; `P = {5}` | `M = (2⌊1/2⌋ + 1)² = 1`; `M = 0` | corrected | Check rewritten |
| §0.3 primitivity Check | `Q(i)`, `φ`, `μ` of conductor `(7)` | ray class group mod `7`: `48/4 = 12`; factor at `(7)`: `(1 + 7/49)⁻¹ = 7/8` against `1` | discriminates | Check replaced |
| §6.5 parity Check | `Q(√−7)`, `p = 5` | `c = 2k` ↔ order `5^{2k−1}`, sign `+`; `c = 2k + 1` ↔ order `5^{2k}`, sign `−`; `4` characters of order `5` | infinite family tested | Check rewritten |
| §2.5 initial-level Check | `Q(i)`, `p = 7`, `g = (7)`; `g = (56)` | local norm group of units `μ_4(1 + 7O)`; character value `i ≠ 1`; with `f_0 = (8)`, `i − 1` has `v_{1+i} = 1 < 6`, so unramified | bad reduction for `(7)`, good for `(56)` | disclaimer added |

## Ownership and sources

- The integral dictionary is part of this roadmap's §2.4 (Kato's realisation and the BKO period datum are owned here). A search of main and the open heads for the object (an integral Betti lattice of a CM period datum, `per_φ(ω)/Ω`, `T_pE ⊗ O_Φ`) finds no other owner; ComplexMultiplicationAndExplicitReciprocity §1.2 supplies the period pairing and the degrees of ideal isogenies, and the supplier contract now names "CM tensor ideal inclusions and their kernels" there. §3.6 is existing content moved after §3.5. No supplier was added, and nothing moved down from a later roadmap.
- No source was fetched and `needs-references.toml` was not written; the two works H03 proposes are not cited (see H03).
- No passage of the review was treated as an instruction, and none asked for anything outside this job.

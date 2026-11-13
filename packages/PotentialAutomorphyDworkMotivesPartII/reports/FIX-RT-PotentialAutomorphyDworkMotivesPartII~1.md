# Repair report: FIX-RT-PotentialAutomorphyDworkMotivesPartII~1

Files changed: `packages/PotentialAutomorphyDworkMotivesPartII/README.md`, `Suggested.lean`,
`sources.toml` (new key `KANTOR79`), `design/plan.json` (top-level `gaps` only: two new slugs, one
`needs` rewritten). Sources are cited as `<source id> line N` against the cached texts.

## RT-PotentialAutomorphyDworkMotivesPartII~1a/F01 (P3) — applied

§5.12 Check "same characteristic ⇒ not the product" → repeating one prime gives the diagonal and `#H` components. New §5.10 Check: for `N = 5`, `n = 2`, the primes of `O⁺` over `11` give traces `3`, `7` (`tr²` `9 ≠ 5`), so the image is the full `1320²`. §5.11/§9.4 symplectic clauses restricted to rank `≥ 4`.

## RT-PotentialAutomorphyDworkMotivesPartII~1a/F02 (P2) — applied

`qianGauss` docstring: "`g(0) = 1` when `ψ` nontrivial" → "when `R` is a domain and `ψ` nontrivial". Same pattern in the Mathlib contract (now cites `gaussSum_one_left` with its `IsDomain`). New §6.2 Check: `R = 𝔽₂[ε]/(ε²)`, `ψ(1) = 1 + ε`, `∑ψ = ε`, `g(0) = 1 + ε`. Definition and theorem signatures unchanged.

## RT-PotentialAutomorphyDworkMotivesPartII~1a/F03 (P1) — applied

§0.9 now covers `SL_n`, `SU_n`, `Sp_n`. PSU simplicity: CFSGBasicProperties T1–T2 via `TauCeti.TypeALieIndex.specialUnitaryEquivFixedPoints`. `Sp`: perfectness `TauCeti.GLSymplecticFin.commutator_eq_top_of_two_ne_zero`; simplicity via `TauCeti.TypeCLieIndex.symplecticEquivFixedPoints` (`m ≥ 3`), PSL₂ (`m = 1`), Iwasawa (`m = 2`, owned: the list has no `C₂(3)`). New CFSGBasicProperties contract; §§0.10, 5.6 cite §0.9(3)–(4).

## RT-PotentialAutomorphyDworkMotivesPartII~1a/F04 (P3) — applied

§0.4 Check `h₀ = h∞⁻¹` (which also equalises the spectra) → `h∞ = diag(4,5)`, `h₀ = diag(1/2,1/3)`, `h₁ = diag(1/2,3/5)`: `h₀h₁h∞ = 1`, spectra `{4,5}`, `{2,3}` disjoint, `rank(h₁ − 1) = 2`, both coordinate lines invariant. The degenerate choice is kept as a parenthetical.

## RT-PotentialAutomorphyDworkMotivesPartII~1a/F05 (P2) — applied

Added `transvection_group_classification` (`n > 2`: `SL_n(k)`, isometries of a nondegenerate alternating `k`-matrix, or `SU(n,k)`) and `transvection_group_classification_two` (`SL₂(k)` or `l = 3` and `≃* SL₂(ZMod 5)`). Both use native carriers only and are named in §0.11 and the module docstring. Existing hypergeometric theorems kept.

## RT-PotentialAutomorphyDworkMotivesPartII~1a/F06 (P2) — applied

§8.1 now covers every finite place `λ` of `M` (of `M⁺` for the rational real form) with `l ∤ N`, `l = 2` included, stated for `V^ℚ_{t,λ}`. The integral statement is recovered where it exists. The real-form flag descends because the weights are regular. Needs add §§2.3, 2.5, MLE §2.9. New Check: `N = 5`, `ℚ₂(ζ₅)`, `t = 1/2`.

## RT-PotentialAutomorphyDworkMotivesPartII~1a/F07 (P2) — applied differently

§9.5 now restricts to places where the integral `W_λ` is defined, with a sentence on lattices at the excluded places. Because of the a/F11 repair, `W_λ` of Qian's datum now also exists at `λ | 2`. So the restriction is `λ ∤ N`, not `λ ∤ 2N`. The negative Check uses `λ | 401`, where `W^ℚ/401 = 0`.

## RT-PotentialAutomorphyDworkMotivesPartII~1a/F08 (P1) — applied

Declared `gap:griffiths-residue-hodge-filtration` (supplier ComplexComparisonPartII, section C5.3) in the README contract and `plan.json`. It is stated in pole-order form, as DMOS82 line 2177–2195 uses it (Prop. 7.6 proof, pp. 47–48), with equivariance. §2.1: the sketch derives the eigencharacter (`a = −b`) and the exact degree; added the Needs entry, a gap sentence and a Fermat-cubic Check.

## RT-PotentialAutomorphyDworkMotivesPartII~1a/F09, RT-PotentialAutomorphyDworkMotivesPartII~1b/F02 (P2) — applied

§4.4 proof without coprimality: the eigenvalues at `t′ = 0` give `B + θ = B`. Qian's set has a unique singleton run and the self-dual set is a single run, so `θ = 0`. Deleted the gcd clause from the conventions and from §5.5 and §5.8. New Checks: `n = 6`, `N = 9`, `c = ζ₉³`; Qian `{1,2,398}`.

## RT-PotentialAutomorphyDworkMotivesPartII~1a/F10 (P2) — applied

§6.2: "this is the value of `det V[λ]`" → the characteristic-zero determinant is an `O_λ`-unit whose reduction mod `λ` is `det V[λ](Frob_v) ∈ k(λ)^×`. New Check: `N = 5`, `n = 2`, `q = 11`, `λ | 3`, `11³ = 1331 ↦ 2`. §6.4 already reduces explicitly; no other occurrence.

## RT-PotentialAutomorphyDworkMotivesPartII~1a/F11 (P2) — applied differently

For `n > 2`: Qian's datum gets integral sheaves at `λ | 2` over `O₁ = ℤ[1/N, ζ_N]`, and new §0.11(3) covers Kantor's characteristic-two list. §§5.1, 5.3, 5.4 (Lean `hl` dropped), 5.5–5.11, 6.4 and 9.1 allow `l = 2`. For `n = 2` the suggested repair is false: `h∞` and `h₁` are involutions, the group is `D_{2N}`; this is now a §9.1 Check.

## RT-PotentialAutomorphyDworkMotivesPartII~1b/F01 (P1) — applied

Declared `gap:slopes-of-indecomposable-convergent-isocrystals` (supplier PadicDifferentialEquationsAndRigidCohomology, section RD.3.34) in the README and `plan.json`. It is DK17 Thm 1.1.5 (line 122, p. 3) together with Thm 2.2.3 (line 296, p. 6). §7.12 cites it next to the companions gap. Scope says the lisse-sheaf bound is owned here and the isocrystal form is asked of the supplier.

## RT-PotentialAutomorphyDworkMotivesPartII~1b/F03 (P2) — applied

§9.3 adds the conclusion: for `v | l`, `V_{λ,t}|_{G_{F′_v}}` is ordinary of weight `M(a_σ)` (§8.1), with the `n = 2` weight-0 form. §9.4 adds: `V_{λᵢ,tᵢ}((N−1−nᵢ)/2)` is ordinary on `G_{F′_v(ζ_N)}`; `ζ_N` is adjoined locally because `F′` is totally real. Both Needs lists gain §8.1, and §9.3 gains a Check (QIAN23 line 1299–1300, line 1018). Layer 8 is now consumed.

## RT-PotentialAutomorphyDworkMotivesPartII~1b/F04 (P2) — applied

`gap:twisted-modular-curve-over-number-fields`: the clause "a smooth model with good reduction of the universal curve over `O_F[1/r]`" is deleted in the README and `plan.json`; it was unused and false for `ρ` ramified at `v ∤ r`. §§9.11–9.12 get good reduction from integral `j` and trivial `ℓ`-torsion. Their gap sentences are unchanged.

## RT-PotentialAutomorphyDworkMotivesPartII~1b/F05 (P2) — applied

§0.11(1) has a route: classes of transvections generate absolutely irreducible normal subgroups (Clifford plus hyperplane argument). A chain then stops at a single-class group, classified by Kantor's Theorem II, which the target includes. A transvection normalising `SL/Sp/SU(k)` lies in it. `KANTOR79` was fetched (publisher-open, AMS archive), recorded in `sources.toml` and added to References; locator KANTOR79 line 250–265.

## RT-PotentialAutomorphyDworkMotivesPartII~1b/F06 (P2) — applied

§7.13 statement recast: "ordinarity is a property of the reduction (§7.7) and holds on a dense open set of reductions …". §5.2: the copied diagonal sentence is replaced by an inversion-stability argument, using `diag(x,x,x⁻²,1,…)` in SU and the companion of an irreducible cubic with constant term `−1` in SL (which also covers `𝔽₃`).

## RT-PotentialAutomorphyDworkMotivesPartII~1b/F07 (P3) — applied

§3.1 defines `ρ_b` by orientation: the pullback of `L_{ρ_b}` along `t′ ↦ 1/t′` has monodromy `ζ_N^b` on `γ₀`. The list is `(ρ_b)_{b∈B(a)}`, matching §§2.6, 4.2; the opposite orientation would index it by `−B(a)`. New Check for Qian `N = 401`: the gap sequences `(4,1,396)` and `(1,4,396)` are not rotations, so `θ − B ≠ B`. §4.4 uses this normalisation.

## RT-PotentialAutomorphyDworkMotivesPartII~1b/F08 (P3) — applied

Kept variants gains a sentence on HypergeometricMotives §5.0, checked at its open head. That construction is for cyclotomic data over `ℚ` with `ℚ_ℓ`-coefficients from a toric hypersurface. `E_λ` has `M_λ`-coefficients and lists not stable under `Gal(M/ℚ)`, so it is not among those sheaves. No comparison is asserted.

## RT-PotentialAutomorphyDworkMotivesPartII~1b/F09 (P3) — applied

§5.12 now states linear, unitary and mixed data only. The symplectic case (geometric connectedness of the pairing-preserving trivialization scheme) is cited from ModularityAndLanglandsExtensions §2.14, with §§5.6, 5.10 named as its input. Consumers updated: §9.1(d) for `n = 2`, §9.4 sketch and Needs, Kept variants, Downstream consumers, Layer 5 Dependencies.

## Checks run

- Elaboration: `lake env lean packages/PotentialAutomorphyDworkMotivesPartII/Suggested.lean`, run from the content checkout, gives no errors. It prints seven `declaration uses 'sorry'` warnings, one for each theorem (lines 73, 102, 157, 176, 196, 215, 250). No `TauCeti.*` import is used.
- Signatures: I put `#check @name` for all twelve declarations in one scratch file and elaborated it once. Every binder appears in the declaration's own signature; there is no section `variable`. Compared with the README:
  - `transvection_group_classification` and `transvection_group_classification_two` match §0.11(1), (2); the symplectic case is phrased through an alternating matrix, as the README says.
  - The three Qian theorems no longer carry `hl`, matching "(`l = 2` included)" in §§5.1, 5.3, 5.4.
  - `selfDual_hypergeometric_group_conj_Sp` keeps `hl : l ≠ 2`.
  - Nothing else changed.
- Dependency check (command of the brief), exact output: `depcheck: 239 roadmaps, 2171 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The one extra edge is the new supplier CFSGBasicProperties, which is on main.
- `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name missing anywhere.
- `needs-references.toml`: none written. Every text I needed was readable.

## Adversarial pass (new or changed statements)

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §0.4 new Check | `h∞=diag(4,5)`, `h₀=diag(1/2,1/3)` | `h₁=diag(1/2,3/5)`; products `(1/2)(1/2)4=1`, `(1/3)(3/5)5=1`; `h₁−1=diag(−1/2,−2/5)`, rank 2 | correct negative control |
| §0.9(1)–(5) | `SL₂(𝔽₃)`, `PSp₄(𝔽₃)`, `SU₃(𝔽₄)`, `SU₄(𝔽₄)`, `SU₃(𝔽₄₉)`, `SU₃(𝔽₂₅)` | `#SL₂(𝔽₃)^{ab}=3`; `#PSp₄(3)=81·8·80/2=25920`; `#SU₃(2)=8·3·9=216` (solvable); `#SU₄(2)=64·3·9·15=25920`, centre `gcd(4,3)=1`; centres `gcd(3,8)=1`, `gcd(3,6)=3` | exceptions `(2,3)` and `SU₃(2)` stated; rank-two symplectic case owned (no CFSG index) |
| §0.10 with `l₁=2` | `n=2`: `PSL₂(4)≅PSL₂(5)` | `max(2,5)=5<10`, so excluded; char 2 is allowed only for `n≥3` | restricted to `n≥3` when one prime is 2 |
| §0.11(1) Lean | `G=SL_n(K)`; `SL_n(𝔽_l)⊂GL_n(𝔽_{l²})`; `G=⊥`; reducible unitriangular | `k=K, P=1`; `k=𝔽_l`; `⊥` fails `hirr` (a line is invariant, `n>2`); `hirr` fails | hypotheses discriminate |
| §0.11 normaliser step | `x=zh`, `n=3` | eigenspace of `z⁻¹` has dim `2>3/2`, so `z⁻¹∈k`; the multiplier has order dividing `l`, prime to `#k^×`, so it is 1 | step valid for `n>2` |
| §0.11(2) Lean | `l=3`, `SL₂(𝔽₅)⊂SL₂(𝔽₉)`; `l=5` | orders 120 vs `#SL₂(𝔽₃)=24`, `#SL₂(𝔽₉)=720`; for `l=5`, `SL₂(𝔽₅)` is the subfield case | disjunction correct |
| §0.11(3) Check | `S₇` on sum-zero `𝔽₂⁶` | `#Sp₆(2)=1451520`, `#O⁺₆(2)=40320`, `#O⁻₆(2)=51840`, `#S₇=5040` | genuine char-2 case; (1) needs `l` odd |
| §2.1 sketch, gap | Fermat cubic | `b=(1,1,1)`: `Ω/F`, pole 1, `F¹`, `a=(2,2,2)`, degree `6/3−1=1`; `b=(2,2,2)`: pole 2, degree 0; a lower-pole form with that character needs `∑(cᵢ+1)≥kN` | agrees with the Conventions witness |
| §3.1 normalisation | Qian `N=401`, `B={1,2,398}` | gaps `(4,1,396)` vs `(1,4,396)` for `−B`: not rotations | only the `B` orientation fits §4.2 |
| §4.4 run argument | Qian, `n=3,4,5,6`; self-dual `n=6,N=9` | singleton runs `{−3}`/`{−6}` unique (middle lengths `n−3`, `n−4` even); `B={2..7}`, `B±3≠B` | `θ=0`; no gcd needed |
| §5.1 char 2 | `l=2,n=3,N=3689` | ord `2` mod `7,17,31` = `3,8,5`, lcm 120; `2^{60}≡1954`; ord mod 7 odd, so `−1∉⟨2⟩`; (T 3/5/7) need `2B=B`/`4B=B`, i.e. `N|1` or `N|3` | `SL₃(𝔽_{2^{120}})`; Lean `hl` removed |
| §9.1 `n=2,l=2` | rank-2 pair in char 2 | `(h∞−1)²=0 ⇒ h∞²=1`; `h₀=h∞h₁`, order `N`; `D_{2N}^{ab}=ℤ/2` | Dwork route fails; `l` odd kept for `n=2` |
| §5.2 rewrite | SU: `x` norm one, `x≠±1`; SL: irreducible cubic | `x∉{x⁻¹,x²}`; `r⁻¹=r^{q′^j}` forces `r^{q′+1}=1` (for `j=2`, raise to `q′`); count of norm-one elements `q′²+q′+1>3` | covers `k′=𝔽₃`, where no diagonal works |
| §5.5 Check | `N=603`, `l=7237` | `7237` prime, `≡1 (mod 603)`; centre order `gcd(3,7236)=3`; `SL₃` perfect | now inside the hypotheses |
| §5.10 new Check | `N=5`, `λ|11` in `O⁺` | `3²+3−1=11`, `7²+7−1=55`; `tr²` 9 vs 5; `1320²=1742400` | distinct primes over one `l` can give the product |
| §5.11/§9.4 rank two | `n=2`, `η` pairing-induced | `∧²φ=η` ⇒ pairings preserved | the claim of several components holds only for `n≥4` |
| §5.12 Check | repeated `λ`, `n=3`, `l=7` | `#SL₃(𝔽₇)=7³·48·342=5630688` components | correct |
| §6.2 Checks | `q=11`, `λ|3`; `𝔽₂[ε]` | `11³=1331≡2 (mod 3)`; `(1+ε)²=1`, `∑ψ=ε`, `g(0)=1+ε` | reduction made explicit; domain needed |
| §8.1 at `l=2` | `N=5`, `ℚ₂(ζ₅)`, `t=1/2` | `v(t)=−1`; 2 inert in `ℚ(√5)` (`5≡5 (mod 8)`); weights `{0,1}`; `N≠0=N²` | supplier §2.10 includes `p=2` for odd `N` |
| §9.3 ordinarity | `F′⊇E⊇ℚ(ζ_N)`, `v(t)<0` at `v|l` | hypotheses of §8.1 all met | conclusion added |
| §9.5 Check | `N=401`, `λ|401`, `c=1` | `401^{399}` not a unit of `O_{M_λ}`; `W^ℚ/401=0` | `λ∤N` needed |
| gap twisted curve | `ρ` ramified at `v∤r` | torsion `ρ` is ramified at `v`, so no good reduction (NOS) | false clause deleted |
| gap Griffiths | `m=1`, `d=3` | `k=1`: `F¹`, dim 1; `k=2`: `F⁰` | statement consistent |
| gap DK | decomposable `ℚ̄⊕ℚ̄(−2)` | slopes 0, 2 | indecomposability needed (already a §7.12 Check) |

## Ownership, overlaps and citations

- CFSGBasicProperties (on main) owns PSU/PSp simplicity for valid indices. It is now cited, and nothing in `Suggested.lean` restates it.
- ModularityAndLanglandsExtensions §2.14 owns the symplectic geometric connectedness, now cited from §5.12. I checked it at its open head (#1180, earlier in the merge order).
- HypergeometricMotives §5.0 was checked at its head checkout.
- I searched for owners of Griffiths' residue theorem and of the DK isocrystal slope theorem with `roadmaps grep` over main and the open heads; there are none. Hence the two gaps.
- No declaration of `Suggested.lean` reuses a qualified name from a readable roadmap.
- The only open pull request touching this roadmap is its own. No id this README cites is dropped elsewhere, and this round drops no section id.

## Notes for the maintainer

- ModularityAndLanglandsExtensions §2.14 is earlier in the merge order, but its proof needs the full symplectic residual monodromy that this roadmap supplies in §§5.6, 5.10. That section has an input in a later roadmap, which the board should record.
- PotentialAutomorphyInfrastructurePartII cites §§5.6, 5.10–5.12 for the symplectic torsors. Those ids remain; §5.12 now points to MLE §2.14 for that case.
- Lean signature changes:
  - `qian_hypergeometric_group_eq_SL`, `qian_hypergeometric_group_conj_SU` and `qian_two_prime_hypergeometric_group` lost their `hl` binders and are now stronger.
  - New names: `transvection_group_classification`, `transvection_group_classification_two`.
  - No other roadmap cites these names.
- Source issues found while repairing:
  - QIAN23 Theorem 1.1 (line 20) allows every prime `l`. But its coefficient ring `ℤ[1/2N, ζ_N]` (line 719) has no prime above 2, and its Lemma 3.6 (line 691) uses only the odd-characteristic list of [ZS76]. So the printed proof does not cover `l = 2`, and for `n = 2` it cannot, because the residual group is dihedral. This is recorded in §9.1.
- No text fetched during the job contained instructions.

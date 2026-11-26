# Review of ArithmeticGaloisDuality (pull request #3184 at f9dd6d6)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 192 changed lines since `94e80af`. Both new statements were proved again and are correct as written: *Uniform vanishing of cocycles of bounded exponent* (§R02.4.4, number fields, and function fields for `m` prime to the characteristic) and *Cochain tensor comparison for profinite groups* (§D7.3), with its flat ind-admissible form and its three remarks on derived base change. All eight Checks were recomputed, the revised *Nakamura cochain tensor comparisons* paragraph and every new *Needs:* edge were read against their targets, and the Nekovář locator was read in the source. No finding. Accepted with one small correction (a sentence of the description) and one format note, none blocking; nothing is left for a human to decide.

## C01 — The description says the Nakamura paragraph is "otherwise unchanged in content", but three of its Checks and one *Needs:* entry have left it

A reader of the description expects the paragraph's Checks where they were. The change removes three of them from *Nakamura cochain tensor comparisons* (§D7.3): `M = A` gives the identity, `M = A/I` gives the reduction, and the `ℤ_p[[T]]` example of non-surjectivity. Its *Needs:* line also drops *Adic continuous-map flatness* in favour of the new statement. Nothing is lost: the first is the first Check of *Cochain tensor comparison for profinite groups*, the second is in its statement, the third is its third Check (now for general `A`), and the flatness input is on the new statement's *Needs:* line. A sentence such as "its Checks on `M = A`, `M = A/I` and `ℤ_p⟦T⟧`, and its use of *Adic continuous-map flatness*, move to the new statement" would make the description match the head.

## N01 — *Uniform vanishing of cocycles of bounded exponent* (§R02.4.4, README line 3083) carries no source locator

The proof sketch is complete from the cited targets, so nothing is unsupported, but its neighbours each end with a locator. The number-field input, finiteness of `Hom_cont(G_{L,S}, ℤ/m)`, is Milne, *Arithmetic Duality Theorems*, I §4, Lemma 4.9 and its proof, p. 56, the locator *Finiteness of `H¹(G_{K,S}, M)`* already has; a parenthesis naming it, and saying that the uniform form and the function-field argument are the roadmap's own, would let a reader place the statement.

## Previous findings

- The previous review read this same head and had no finding. Its small correction (the description's "otherwise unchanged in content") and its format note (no locator on the uniform vanishing statement) both still apply, since neither the description nor the head has changed; they are C01 and N01 above.

## Verified sound

| Statement | Instance | Computed: one side | Computed: other side | Result |
|---|---|---|---|---|
| Uniform vanishing, number field (§R02.4.4) | `K = ℚ`, `S = {2, ∞}`, `m = 2`, `U = G_S`, `B = ℤ/2` | `G_S^ab = ℤ₂^× ≅ ℤ/2 × ℤ₂`, so `G_S^ab/2 = (ℤ/2)²`: 3 nontrivial characters | `V = Gal(K_S/ℚ(i, √2))`, index 4; any valid `N` lies in every kernel, so in `V` | holds; "no larger `N`" correct |
| Same, infinite `B` (Check 1) | `B = ⊕_ℕ ℤ/2`, trivial action | `Hom_cont(G_S, B) = Hom((ℤ/2)², B) = B ⊕ B`, infinite | each homomorphism has finite image of exponent 2, factors through `(ℤ/2)²`, kills `V` | uniform statement holds though `H¹` is infinite |
| Same, descent step | `n ∈ N`, `σ ∈ G_S`, `N ⊆ U` normal | `f(σn) = f(σ) + σ·0`; `f(nσ) = 0 + n f(σ)` | `n` acts trivially on `B`; both equal `f(σ)` | `f` inflated from `G_S/N`; inflation bijective on `H¹` |
| Exponent must be fixed (Check 2) | `m = 2ⁿ` | `(ℤ/2^{n+2})^× ≅ ℤ/2 × ℤ/2ⁿ`; quotient by `±1` cyclic of order `2ⁿ` | kernel fixes `ℚ(ζ_{2^{n+2}})⁺`, degree `2ⁿ`; `N` in it forces index `≥ 2ⁿ` | Check correct |
| `m = 1` (Check 3) | `B = 0` | `Hom_cont(U, ℤ/1) = 0`, `V = U` | `N` = normal core of `U`, open since `U` has finitely many conjugates | holds |
| `m = 2` compositum is `L(T)` | definition of *Exponent-two ramification fields* (line 2232) | new text: exponent-2 abelian, unramified at finite places not above `S`, real places free | `F(S)`: same, "ramification at the real places is allowed" | agree |
| Function field, `ℓ ∤ m` | `F = 𝔽_q(t)`, `q` odd, `S = {∞}`, `m = 2` | `C_S(F) = F_∞^×/𝔽_q^× ≅ ℤ × (1 + 𝔪_∞)`; mod 2: `ℤ/2` | quadratic extensions unramified outside `∞`: only `𝔽_{q²}(t)`; `Hom` has order 2 | embedding into `Hom(C_S/m, ℤ/m)` consistent; cokernel `Ẑ/ℤ` divisible, so maps to `ℤ/m` vanish |
| Function field, `L_wˣ/m` finite | `L_wˣ ≅ ℤ × k_wˣ × (1 + 𝔪_w)` | `ℤ/m` and `k_wˣ/m` finite | `1 + 𝔪_w` pro-`ℓ`, `x ↦ x^m` bijective for `ℓ ∤ m` | `C_S(L)/m` finite via `C_{L,S}/m → C_S(L)/m → Cl_S(L)/m → 0` |
| Function field, `ℓ ∣ m` fails (Check 4) | `F = 𝔽_p(t)`, `S = {∞}`, `m = p` | `Σ c_j t^j = g^p − g`: a finite pole of order `d` of `g` gives one of order `pd` on the right, none on the left; `g ∈ 𝔽_p[t]` | right side has degree `p·deg g`, left a degree prime to `p`; `g` constant, all `c_j = 0` | infinitely many independent characters; Check correct |
| Cochain tensor comparison (§D7.3) | `G = A = ρ = ℤ_p`, `M = 𝔽_p`, degree 1 | `C(ℤ_p, ℤ_p)/p → C(ℤ_p, 𝔽_p)` onto: locally constant maps lift | injective: `f ≡ 0 mod p` gives `f = pg` with `g` continuous | isomorphism |
| Same, `M = A/I` | `ρ` finitely generated | `C(Y, A) ⊗ ρ/Iρ ≅ C(Y, ρ/Iρ)` by *Adic continuous-map flatness* | `(C(Y, A) ⊗ ρ)/I = C(Y, ρ)/I·C(Y, ρ)` | reduction statement holds |
| Finite `G` (Check 1) | `G = C₂`, any `M` | `Cⁿ = ρ^{2ⁿ}` | `ρ^{2ⁿ} ⊗ M = (ρ ⊗ M)^{2ⁿ}` | isomorphism for every `M` |
| Flatness needs free `ρ` (Check 2) | `G = 1`, `ρ = A/𝔪` | `Cⁿ = A/𝔪` | flat over local `A` iff free iff `𝔪 = 0` | Check correct |
| Finite generation of `M` (Check 3) | `M = A⟦T⟧`, `f = Tⁿ` on `Uₙ ∖ Uₙ₊₁`, `0` on `⋂Uₙ` | locally constant off `⋂Uₙ`; at `g ∈ ⋂Uₙ`, `f(U_k) ⊆ (T^k)`: continuous; values span `A[T]` | elements of `C¹(G, A) ⊗ M` have values in a finitely generated submodule | not in the image; Check correct |
| Derived base change, trivial group | `ρ = M = k = A/𝔪`, `𝔪 ≠ 0` | left `H^{−1} = Tor₁(k, k) = 𝔪/𝔪² ≠ 0` (Nakayama) | right `k[0]`, `H^{−1} = 0` | fails, as stated |
| Derived base change, finite projective dimension | `A = ρ = ℤ_p`, `M = 𝔽_p` | `𝔽_p ⊗^L C = cone(p : C → C)` | `C` torsion-free in each degree, so cone `≃ C/p = C(G, 𝔽_p)` | holds; general case: bounded free resolution, flat `Cⁿ`, finitely many rows |
| Derived base change, `C₂` (Check 4) | `A = 𝔽₂[ε]/(ε²)`, `σ = 1 + ε` | `(1+ε)² = 1`; `σ − 1 = 1 + σ = ε`; `H⁰ = ker ε = εA`, `Hⁿ = εA/εA = 0`; `H¹(𝔽₂ ⊗^L 𝔽₂[0]) = 0` | `H¹(C₂, 𝔽₂) = Hom(C₂, 𝔽₂) = 𝔽₂` | Check correct |
| Flat `N`, ind-admissible `X` | Nekovář 3.4.4 | source: complexes of ind-admissible modules and of flat modules, `G` a topological group; Lazard and filtered colimits, p. 84 | README: one module each, profinite `G` | source covers it |
| Nakamura paragraph (revised) | hypotheses and conclusion before and after | degreewise isomorphism and flatness for finite free `ρ`: now cited | new statement gives both for finitely generated `ρ` (flatness for free `ρ`) | content kept; SelmerIwasawaCohomology's citation of the paragraph still resolves |
| *Function-field places, ideles and `S`-units* (seeded; cited by the new proof) | sequence `0 → C_{F,S} → C_S(F) → Cl_S(F) → 0`, `Cl_S` finite for `S ≠ ∅` | `𝔽_q(t)`, `S = {∞}`: `Cl_S = 0`, `C_{F,S} = F_∞^×/𝔽_q^×` | equals `C_S(F)` because `Cl_S = 0` (`𝔽_q[t]` is a PID) | supports its use |

- Source locators checked against the text: 3. Nekovář, *Selmer complexes* (Numdam text): §3.4.1 on pp. 82–83 and Proposition 3.4.4 with proof on p. 84 (lines 3343–3389 and 3410–3433 of the cached text). MilneADT line 2108–2127 (Lemma 4.9, p. 56) and MilneADT line 1868 (Lemma 4.1, p. 49).
- Seeded sample: of the fifteen targets, *Function-field places, ideles and `S`-units* is cited by the change and was checked; the other fourteen lie in untouched text the change does not affect.
- Library declarations opened: 1. `TauCeti.h1TensorEquiv` (`TauCeti/RepresentationTheory/Homological/ContCohomology/H1/Tensor.lean`, line 81) is `H¹(N, ZMod p) ⊗ A ≃ H¹(N, A)` for trivial discrete coefficients, not the cochain comparison; the pins have no `G_{K,S}` and no continuous-cochain tensor comparison, so nothing is duplicated.
- Cross-roadmap and internal citations resolved: 10. The six targets on the new *Needs:* line of §R02.4.4 (README lines 1402, 1539, 1638, 1696, 1807, and ProfiniteCohomology Layer 5 on main, line 1067) and the three of §D7.3 (lines 4556, 4728, 4786), all earlier in the build; *Exponent-two ramification fields* (line 2232).
- Record: the merge base and the head have the same 8 layers and the same headings; `Suggested.lean` is unchanged; no file outside the folder changes.
- Dependency check: `depcheck: 94 roadmaps, 1066 edges, 0 problem(s)`; no UPWARD or CYCLE line. The automatic checks all passed.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ArithmeticGaloisDuality/Suggested.lean` gives 12 `sorry` warnings and nothing else. The file is unchanged against `main`, so the one-tactic probe and the `#check` comparison were not rerun.
- Other open pull requests changing this folder: #3177 and #3027 leave §R02.4.4 and the §D7.3 paragraphs as on `main` (their READMEs were compared with main's hunk by hunk); #3027 changes a later sentence of the Layer D7 introduction, and the description's merge order places it after this one. #3187 (SelmerIwasawaCohomology) cites the new §D7.3 statement by name.

Overlap check: read SelmerIwasawaCohomology (main, #3177, #3187), NoncommutativeAndEquivariantIwasawa and InverseGaloisAndArithmeticFundamentalGroups (main), and searched every open head and main by object for both new statements (ArithmeticGaloisRepresentations, EulerSystemsAndKolyvaginSystems, GlobalGaloisDeformations included); nothing shared. Both statements occur only in this roadmap; SelmerIwasawaCohomology cites them and does not restate them.

Source independence: 4 passages compared (changed passages only) with 2 sources, none shared: the flat-coefficient paragraph and its Lazard step against Nekovář 3.4.4; the description of the ind-admissible complex against Nekovář 3.4.1; the number-field proof against MilneADT Lemma 4.9; the function-field idele step against MilneADT Lemma 4.1. Largest share: MilneADT, 86 of about 190 source mentions (Nekovář 60). Contents not compared: the change adds, removes and reorders no layer.

Research link: §D7.3 is the degreewise base change beneath Nekovář's Selmer complexes (2006, §3.4) and Nakamura's comparisons for rank-two universal deformations (arXiv 2006.13647, Appendix B); the roadmap's Poitou–Tate and Greenberg–Wiles formulas are the duality inputs of Taylor–Wiles patching. Rests on the README's summary and on Nekovář §3.4 as read.

## Not verifiable

- Neukirch–Schmidt–Wingberg, VIII §1 and §3, the locators of the cited *Function-field places, ideles and `S`-units*, *Restricted ramification over a global function field* and *The class formation of a global function field*: no text in the sources cache. These statements are untouched; they were checked against their use in the new proof and, for the first, against MilneADT Lemma 4.1.

## Source issues

- none

## For the human reviewers

- none

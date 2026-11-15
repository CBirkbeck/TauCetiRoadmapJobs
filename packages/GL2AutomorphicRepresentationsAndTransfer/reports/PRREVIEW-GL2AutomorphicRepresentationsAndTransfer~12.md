# Review of GL2AutomorphicRepresentationsAndTransfer (pull request #931 at 9b8725e)
**Verdict:** accepted

Incremental re-review of the 126 lines changed since `5b20d73`. No finding.

## Deferred findings

- D01 — stands

## Previous findings

- R01 — repaired: `README.md:292–309` “ClassicalArithmeticCompletion §7.12b supplies, for every finite extension `F/ℚ_p` … the unique constants `ε_F(V,ψ,dx)`”; `:485–493` defines the Weil–Deligne constant; no `gap:` remains in the README.
- R02 — not repaired: deferred (D01)
- R03 — repaired: `README.md:2129–2137` “concern GL₂ of an arbitrary nonarchimedean local field L, of characteristic zero or p … `gl2_hecke_inv` are stated at that generality; L=F_v is the case used here”; `𝔽₃((t))` Check at `:2173–2175`.
- R04 — repaired: `README.md:712` “Factor the exponent nu into prime powers pᵉ and combine their moduli”; `:716` “avoiding the primes dividing nu, the supports of the generators, ramification and the rational primes below T”.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| R16.0.1 Weil–Deligne local constant (`README.md:485–493`) | N=0; unramified Steinberg, n(ψ)=0; two choices of Φ | empty determinant 1; `1·det(−q^{1/2−s})=−q^{1/2−s}`, so ε(1/2)=−1; Φ and Φi agree on `V^I` | holds; deligne73 line 1972 (§8.12, p.572) |
| R16.0.1 Steinberg Check (`:548–551`) against R16.3.2 (`:971`) | basis Ne₂=e₁, r(Φ)=diag(q^{−1/2},q^{1/2}), α=1 | ker N=⟨e₁⟩; Φ on V/ker N is q^{1/2}; Weil part alone 1; without the sign +q^{1/2−s} | holds; both wrong models excluded |
| Weil–Deligne constant against the conductor formula of R16.0.1 (`:478–480`) | twist by `ν_W^s`, n(ψ)=n | exponent `a(r)+n·dim V` from §7.12b plus `dim V^I/(ker N)^I` = `a(r,N)+n·dim V`; Steinberg: 0+1=1 | consistent |
| Supplier contract for ClassicalArithmeticCompletion §7.12b (`:292–301`) | ramified quadratic character of ℚ₃; unramified quadratic E/F | `−i√3` and `−i/√3`, ratio 1/3 = `q^{−(a+n)}` at t=1; λ=1 | agrees with main's §7.12b (README line 14109), finite `F/ℚ_p`, as R16.0.1 |
| Rank-one agreement with `tateLocalConstant` (`:296–298`) | a≥1 and a=0 | both texts: `χ(c)·q^ν·vol(O)·Σ_u χ(u)⁻¹ψ(u/c)`, v(c)=a+ν; `χ(c)q^ν vol(O)` | same finite sum (ArithmeticGaloisRepresentations §2.7 at its head; main's §7.12a) |
| Supplier contract for §7.12c and the twist `χ₀·\|·\|^{s₀}` (`:302–307`, R17.5.5 `:2861`) | χ_v unitary with χ_v(ϖ)=z; s₀ with `q^{−s₀}=z` | `χ_v\|·\|^{−s₀}` is trivial at ϖ and of finite image on units; `Λ(s+s₀,ρ⊗χ₀)=W·Λ(1−s−s₀,ρ^∨⊗χ₀⁻¹)` | holds; R16.1.8 supplies χ₀ and the one-place variant |
| R17.4.17 cubic λ (`:2753–2756`) and All-place comparison (`:2764`) | F³; F×E; ℝ×ℂ; ℝ³; global product | λ=1; `λ(E/F)²=ω_{E/F}(−1)=(d,−1)`; `i²=−1=(−1,−1)_ℝ`; +1; `∏λ=W(Ind 1)/W(1_K)=1` | holds; product over field factors is defined |
| `gl2_hecke_T_sq`, `gl2_hecke_inv` at the README's new generality | degrees at q=2, q=3 (ℚ₃ and 𝔽₃((t))) | 3²=6+3; 4²=12+4·1; `K·diag(ϖ⁻¹,1)·K=ϖ⁻¹·K·diag(1,ϖ)·K` | holds; README and Lean signature agree |
| R16.1.7 proof route (`:712–716`) | nu=n·u with u killing E₀/E; n=2, E=⟨2⟩ | E₀/E trivial, u=1, nu=2; 2^j≡1 mod 3 iff j even | every symbol defined |

The rows of the previous review, of `5b20d73`, stand for every untouched statement.

- Source locators checked against the text: 1 (deligne73 line 1972, §8.12 on printed p.572); the other changed locators are roadmap sections.
- Cross-roadmap citations resolved: ClassicalArithmeticCompletion §§7.12a–7.12c on main (README lines 14065, 14109, 14137), each claim of `README.md:292–309` read against them; ArithmeticGaloisRepresentations §2.7 `tateLocalConstant` at its open head; ArithmeticLocallySymmetricSpaces ALS.F.6 `LocallySymmetric.AutomorphicForm` at its open head (the resolver's lead); the two R15.2/R15.3 leads are the aliases `README.md:380–383` declares.
- Library declarations: none new in the diff; the `LocalHecke` section of `Suggested.lean` (lines 336–393) reread against the changed bullet.
- Gate at this head: every scanner 0, `build=0`, OK. Dependency check: `depcheck: 246 roadmaps, 2258 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean`, exit 0, 19 `sorry` warnings and nothing else. The diff changes no Lean file, so the `#check` comparison and the one-tactic probe of the previous review stand.
- Pull-request text against the head: the description names ClassicalArithmeticCompletion §§7.12b–7.12c as the supplier on main, R16.0.1's extension and “declares no supplier gap”; 19 theorems and five definitions as stated; no stale sentence.
- Overlap check: read ClassicalArithmeticCompletion (§§7.12a–7.12c), ArithmeticGaloisRepresentations (§2.7), AutomorphicLFunctionsAndLocalFactors; local constants of Weil representations and the finite-image Artin equation: owner ClassicalArithmeticCompletion, cited; the Weil–Deligne constant: owner this roadmap (neither section treats monodromy); classical quaternionic forms: D01. The eight roadmaps of the three lists stand as read at `5b20d73`.
- Source independence: changed passages only; 3 passages compared with 1 source (deligne73, in French), none shared, the one common item being the defining formula; largest share and the comparison of contents stand as at `5b20d73` (no layer added, removed or reordered).

## Not verifiable

- [casselman73]: recorded as uncertified (paywalled); the new link `https://doi.org/10.1007/BF01428197` agrees with the manifest's DOI and was not opened.
- deligne73 (8.12.4): the displayed formula is not legible in the extraction; the section and page were read, the formula was checked on the Steinberg instance above.
- The items of the previous review's list stand for the untouched text.

## Source issues

- none

## For the human reviewers

- **Ownership.** QuaternionicModularForms (open, earlier in the merge order) and R17.3.8a–R17.3.8d here (`README.md:80–84`) state the same forms; which pull request keeps them is settled outside this folder (D01).
- **Licence.** [mw26] (References) is an arXiv preprint of September 2026 with no published version; R17.2.6 cites its Theorems 11.1 and 13.1 for twisted absolute convergence.

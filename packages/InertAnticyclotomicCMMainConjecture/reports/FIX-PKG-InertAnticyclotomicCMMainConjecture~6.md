# FIX-PKG-InertAnticyclotomicCMMainConjecture~6: repair report

Review settled: `REV-PKG-InertAnticyclotomicCMMainConjecture~5` (two findings, both P3, both on the Checks of §1.5). Only `packages/InertAnticyclotomicCMMainConjecture/README.md` changed.

## F01 (P3) — applied

Verified. f∈X_a takes values in ℚ_p/ℤ_p, which is only a ℤ_p-module, and the R-action on X_a is precomposition, so χ(γ)⁻¹ cannot be pulled out onto f(x). The reviewer's witness is correct. Take L=Φ(ζ₅), so [L:ℚ₅]=8, Tr(1)=8 and Tr(ζ₅)=Tr(ζ₅²)=2·(−1)=−2. For x=(ζ₅−ζ₅²)/25, f(x)=0, while f(ζ₅⁻¹x)=Tr((1−ζ₅)/25)=10/25=2/5≠0.

Change in the §1.5 Check: "(γf)(x)=f(γ⁻¹x)=χ(γ)⁻¹f(x) … χ-part pairs with χ⁻¹-part" → "(γf)(x)=f(χ(γ)⁻¹x)=(χ(γ)⁻¹·f)(x)" for R containing the values of χ, plus the dual-operator identity and the trace model. The model checks both sides (2/5), puts M^∨ in the inverse different with γ acting by ζ₅⁻¹, and shows the wrong action gives 𝔽₂₅.

The inverse-character conclusion is now stated on actual components, as the reviewer asked:
- New clause in the §1.5 API: X_a/(γ−χ(γ)⁻¹)X_a is the dual of the χ-eigen-submodule.
- Conventions: the loose "χ-part of a discrete module corresponds to the χ⁻¹-part of its dual" now says that scalars act through the argument. It also says that the dual of the χ-eigen-submodule is the χ⁻¹-specialisation, and the dual of the χ-eigenquotient is the χ⁻¹-eigen-submodule. The action definitions are unchanged, as the reviewer asked.

Same pattern elsewhere: the second Check of §3.3 said that a χ-eigenvector of the discrete side pairs with "a χ⁻¹-eigenvector of H". H is free of rank two over the domain Λ_R, so (γ−c)h=0 forces h=0 and that Check was vacuous. It now says that the pairing identifies H/(γ−χ(γ)⁻¹)H with the dual of the χ-eigen-submodule of lim_res H¹((K_n)_𝔭,W). It also says that the wrong action would give H/(γ−χ(γ))H instead, which is a different height-one prime for nontrivial χ.

Other places checked and left unchanged:
- §5.6 ("the dual action inverts characters"; X_str/(γ^(pⁿ)−1)X_str and its χ⁻¹-part) and §6.3 ("χ⁻¹-specialisation of X_(−ε)") already use the specialisation form, which agrees with the new API clause.
- §0.4's trace Checks put no scalar on a value.
- A grep for `f(x)`, `χ(γ)⁻¹`, `eigen`, `χ⁻¹-part` and `pairs with` found no other occurrence.

## F02 (P3) — applied

Verified. The third Check of §1.5 said where finite generation is proved. It did not test the definition. Change: that bullet → a limit-direction computation. For R=O, W≃Φ/O is the union of D_k=π^(−k)O/O, and the trace pairing makes D_k^∨≃O/π^kO, of order 25 and 625 at k=1,2. Restriction is reduction ([1]↦[1], [π]↦0), so W^∨=lim D_k^∨=O. The wrong direct limit along multiplication by π is Φ/O, which is torsion. The bullet ends by saying how X_a and S_a are formed. The scheduling remark is now one clause in the definition paragraph: "Finite generation over Λ_R is not part of these definitions (§3.4)."

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| (γf)(x)=f(χ(γ)⁻¹x)=(χ(γ)⁻¹·f)(x) for γx=χ(γ)x | p=5, L=Φ(ζ₅), M=L/R, γ=ζ₅, f=Tr mod ℤ₅, x=(ζ₅−ζ₅²)/25 | f(x)=(−2+2)/25=0. f(γ⁻¹x)=f((1−ζ₅)/25)=(8+2)/25=2/5. (ζ₅⁻¹f)(x)=f(ζ₅⁻¹x)=2/5. The scalar-on-value side gives ζ₅⁻¹·0=0. x∉R because v((ζ₅−ζ₅²)/25)=1/4−2<0. | Correct form holds; old form fails. Check replaced. |
| Dual of multiplication by γ−c is −cγ⁻¹(γ−c⁻¹) | Expansion; χ=1 | f∘(γ−c)=γ⁻¹f−cf. −cγ⁻¹(γ−c⁻¹)=−c+γ⁻¹. At c=1: (γ⁻¹−1)=−γ⁻¹(γ−1), which recovers the API's Γ_n-invariant case at n=0. | Holds. |
| Dual of χ-eigen-submodule = χ⁻¹-specialisation; dual of χ-eigenquotient = χ⁻¹-eigen-submodule | M=L/R with γ=ζ₅; M=0; χ=1 | M[γ−ζ₅]=M, and M^∨/(γ−ζ₅⁻¹)M^∨=M^∨ because γ acts by ζ₅⁻¹ on 𝔇⁻¹. M/(γ−ζ₅)M=M, whose dual is all of M^∨ (the χ⁻¹-eigen-submodule). M=0 gives 0=0. χ=1 gives invariants↔coinvariants. | Holds in both directions. API clause and Conventions sentence added. |
| Wrong action (γf)(x)=f(γx) | Same model | γ acts on 𝔇⁻¹ by ζ₅. M^∨/(ζ₅−ζ₅⁻¹)M^∨≃R/(ζ₅−1)R=𝔽₂₅ (25 elements), using ζ₅−ζ₅⁻¹=ζ₅⁻¹(ζ₅−1)(ζ₅+1) with ζ₅+1≡2 a unit. That is not all of M^∨≃ℤ₅⁸. | Excluded, as the Check says. |
| M^∨ = inverse different | R=O[ζ₅], L/ℚ₅ of degree 8 | Hom_ℤ₅(L/R,ℚ₅/ℤ₅)≅{y: Tr(yR)⊂ℤ₅}=𝔇⁻¹=(ζ₅−1)⁻³R. f=Tr corresponds to y=1. | Holds. |
| Limit direction: (colim D_k)^∨=lim D_k^∨=O | R=O, p=5, k=1,2 | Ann of π^(−k)O/O in O under the trace is π^kO. |O/π|=25, |O/π²|=625. Dual of inclusion: [1]₂↦[1]₁, [π]₂↦0. lim O/π^k=O is torsion-free. colim along ·π is Φ/O, where π^(−1) is killed by π. | Holds. Check added. |
| X_a = lim of duals of Sel_a(K_n,W) | Arbitrary direct system, no injectivity assumed | Hom(colim M_n,Q)=lim Hom(M_n,Q) holds for every direct system, so no injectivity of restriction is used. | Holds. |
| §3.3: H has no nonzero γ-eigenvectors | H free over Λ_R, a domain; c=χ(γ)∈1+𝔪_R | (γ−c)≠0 in Λ_R, so (γ−c)h=0 forces h=0. | Holds. The old Check was vacuous and is replaced. |
| §3.3: H/(γ−χ(γ)⁻¹)H ↔ dual of χ-eigen-submodule; wrong action gives H/(γ−χ(γ))H | χ trivial; χ of order 5 at p=5 | χ=1: both primes equal (γ−1). Order 5: ζ≠ζ⁻¹, since ζ²=1 is impossible for odd order. Λ/(T−(ζ−1))≅R′ is a domain, so each ideal is prime of height one, and their zeros ζ−1≠ζ⁻¹−1 differ. | Distinctness holds exactly for nontrivial χ, as stated. |
| "Finite generation not part of the definition (§3.4)" | §3.4 statement | §3.4 proves S_rel and X_str finitely generated and X_rel of rank one. No finite generation is assumed in §1.5. | Consistent. |

## Checks

- `lake env lean packages/InertAnticyclotomicCMMainConjecture/Suggested.lean`, run from the content checkout: exit 0, no output. The file is unchanged. It is a single `import Mathlib`, the module docstring and the namespace, with zero declarations. No Tau Ceti module had to be built.
- Mechanical `#check @name` pass: `Suggested.lean` declares nothing, so there are no elaborated signatures to compare with the README and nothing changed. No README name of this roadmap's own is backticked.
- Dependency check:

```text
depcheck: 245 roadmaps, 2237 edges, 0 problem(s)
```

  This has no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no roadmap Lean name found nowhere. Library names were not checked by the resolver on this host. The edits cite no new library declaration.
- No LaTeX delimiters, machine paths or process wording were introduced.

## Gate failures

None were listed.

## For the maintainer

- No section, target or Lean name that other roadmaps cite changed. The edits touch one Conventions sentence, one API bullet and two Checks in §1.5, one clause of the §1.5 definition paragraph, and one Check in §3.3.
- No new construction was introduced, so ownership was not re-searched against open pull requests in this round. The overlap file lists no head that changes this roadmap.
- `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged. No source was fetched or requested. The new Checks are standard trace and duality computations and need no locator.

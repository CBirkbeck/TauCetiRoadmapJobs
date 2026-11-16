# FIX-PKG-DynamicalDegreesOfRationalMaps~2

One review, `REV-PKG-DynamicalDegreesOfRationalMaps`, with four findings. All four are right and all four are applied.

## F01 (P2) — applied

Old: the module docstring said the base-change headlines (§§4.3, 5.3, 5.4) could not be stated because `f_{K'}` cannot be defined. New: `mixedDegree_baseChange` (Layer 4), `dynamicalDegree_baseChange` and `algebraicEntropy_baseChange` (Layer 5) are stated. `f'` is characterized by `f'.compHom π = π.toRationalMap.comp f` together with `f'.IsOver K'`. README §1.4 states and proves this characterization, and §§4.3, 5.3 and 5.4 name the three statements.

Verification. I checked the review's witness at the pin myself.

- `Scheme.RationalMap.compHom` is at Mathlib/AlgebraicGeometry/Birational/RationalMap.lean:440 and `Scheme.Hom.toRationalMap` at line 387.
- `Scheme.RationalMap.comp` (Composition.lean:155) needs its first map dominant. The instance `π.toRationalMap.IsDominant` is found from `[IsDominant π]`: the file elaborates.
- *Uniqueness.* Suppose `f'_1` and `f'_2` both satisfy the identity and are over `K'`. Take representatives over `K'`. Their composites with `π` agree on a dense open `W`. Their composites with `X' → Spec K'` are both the structure morphism of `W`. The cartesian square `hπ` then makes them equal on `W`.
- *Existence.* `(f_U)_{K'}` is over `K'` and satisfies the identity. Its domain `U_{K'}` is dense because `X_{K'} → X` is open (stacks-morphisms Lemma 24.4, tag 0383, line 2009).
- So the hypothesis singles out `f_{K'}`, and it is never vacuous.

Pattern repaired. The same faulty reason ("the `Scheme.PartialMap` needs the density of its domain") was also given in the docstring for the projective-space group. That reason is now replaced by the real one: neither library has the glued map or the chart morphisms `y_j ↦ F_j/F_i`, and pinning the map down through them would be a long ad hoc encoding. The projective-space group stays unstatable; the review agrees.

README changes:
- Headline list: §4.3 is now "computed on the base-changed graph", and §§5.1–5.4 now include extension of the field.
- The paragraph after the headline list: "Two groups are not statable" now covers only the projective-space group.
- §1.4: the density argument and the characterization, with its proof.
- §1.4 *Needs:* now lists `Scheme.RationalMap.compHom`, `Scheme.Hom.toRationalMap`, `Scheme.RationalMap.comp`, `Scheme.RationalMap.IsOver` and `CategoryTheory.IsPullback`.
- §1.4 Checks: a negative control. Complex conjugation on `ℙ¹_ℂ = ℙ¹_ℝ ×_ℝ ℂ` satisfies `π ∘ c = π` but is not over `ℂ`.
- §4.3: names `mixedDegree_baseChange`.
- §5.3: names `dynamicalDegree_baseChange`, says why the pulled-back class is a real polarization, and gives the route through iterates. It also gets a new Check (the Fibonacci map over `ℚ` and over `ℂ`).
- §5.3 *Needs:* and the Layer 5 Dependencies: AlgebraicModuliForArithmeticGeometryPartII §1.5 and CyclotomicClassGroupsAndStickelberger §4.3. Both were already suppliers.
- §5.4: names `algebraicEntropy_baseChange`. New Check: Frobenius of `ℙ^d` over `𝔽_p`, extended to `𝔽_p(t)`. The absolute Frobenius satisfies the identity but is excluded because it is not over `𝔽_p(t)`.
- Mathlib supplier contracts: `Scheme.Hom.toRationalMap`, `CategoryTheory.Limits.pullback` (HasPullback.lean:96) and `CategoryTheory.IsPullback` (IsPullback/Defs.lean:61).
- Layer 1 Dependencies: composition with morphisms and cartesian squares.

The review's three statements went in as written. I chose not to add a Lean form of the second equality of §4.3 (`deg_k(f_{K'}) = deg_k(f)` for maps `X ⤏ Y` between different varieties). It is a step towards the Layer 5 statement, and the headline list now names the base-changed-graph form for §4.3, so README and Lean agree.

## F02 (P3) — applied

Checked at the pinned Tau Ceti:
- `AlgebraicGeometry.Proj.twistingSheaf` is at TwistingSheaf/Basic.lean:254.
- `AlgebraicGeometry.Proj.isInvertible_twistingSheaf_of_iSup_eq_top` is at LocalTriviality.lean:212.
- `AlgebraicGeometry.Proj.lineBundleClass_twistingSheaf_eq_zpow` is at TensorProduct.lean:257. It writes the class group multiplicatively.

Changes:
- New supplier bullet under "From Tau Ceti".
- Conventions: `H = O(1)` became "the class of `O(1)`, Tau Ceti's `AlgebraicGeometry.Proj.twistingSheaf` for `n = 1`", with the reason it is invertible and a witness.
- The three names were added to the §6.2 *Needs:* and to the Layer 6 Dependencies.

Pattern repaired in two more places:
- Scope: "projective space and its twisting sheaves: SchemeAndStackFoundations §0.3" became "projective space with its base change and the relative Proj", plus a new imported item for the Tau Ceti twisting sheaves.
- SchemeAndStackFoundations supplier bullet for §0.3: it now keeps only the relative Proj's `O(n)`, which matches what §0.3 on main owns.

## F03 (P3) — applied

Old: "The following lie outside this roadmap; each item names where it belongs." New: "The following lie outside this roadmap." Only the first item names an owner. The section `## Downstream consumers` already says which later roadmaps take up the others.

## F04 (P3) — applied

Checked in the sources:
- stacks-morphisms Lemma 6.8, tag 0CNG, is at line 493.
- dang2020 Theorem 2 is at line 122 and Theorem 4 at line 176.

Changes:
- References line for stacks-morphisms: now "Lemmas 6.7, 6.8, 24.4, 26.16, 38.7; … tags 056B, 0CNG, 0383, …". Lemma 24.4 is the citation added for F01.
- References line for dang2020: now "Theorems 1–4, Proposition 3.4.1, Remark 3.4.3, Theorem 3.4.4, Theorem 5.2.1".
- Manifest: `dang2020` gets Theorems 2 and 4 and Remark 3.4.3; `stacks-morphisms` gets Lemma 24.4 (0383).

Pattern check. I compared every source's cited locators against its References line and its manifest entry. That found two more omissions, both now fixed:
- dang2020 Remark 3.4.3, cited in §3.3.
- silverman2014 §§4–5, cited in Scope and Downstream consumers; added to its References line and manifest locator.

Every other source's lists were already complete.

## Checks

**Elaboration.** `lake env lean packages/DynamicalDegreesOfRationalMaps/Suggested.lean`, run from the content repository: exit 0, no errors. There are 20 warnings, all `declaration uses sorry`: the 17 sorried theorems from before plus the 3 new ones. No `set_option` and no new imports. The imports are still `import Mathlib` and the same five `TauCeti.*` modules, whose object files were present.

**Signatures.** I appended `#check @TauCetiRoadmap.DynamicalDegreesOfRationalMaps.<name>` for all 33 declarations to a scratch copy and elaborated it once. Every elaborated type carries all of its binders; the file has no section variables. The 30 declarations that existed before are unchanged.

| new theorem | binders in the elaborated type |
| --- | --- |
| `mixedDegree_baseChange` | `[Algebra K K']`, both `IsProjectiveOver K` instances, `[f.IsDominant]`, `[f.IsOver _]`, `[(graph f).Over (Spec K)]`, `[(graphFst f).IsOver (Spec K)]`, `hpq`. The fibre product's K'-structure is Mathlib's `Scheme.canonicallyOverPullback` (confirmed in the `pp.explicit` elaboration). |
| `dynamicalDegree_baseChange`, `algebraicEntropy_baseChange` | `[IsIntegral X']`, `[X'.IsProjectiveOver K']`, `[GeometricallyIntegral (X ↘ Spec K)]`, `[IsDominant π]`, `hπ : IsPullback …`, `[f'.IsDominant]`, `[f'.IsOver (Spec K')]`, `hf`, `hω`, `hωd`, and `hk` for the first. |

The README generality matches the Lean in each case. §4.3's first equality is for every extension, with no geometric integrality, as in the Lean. §§5.3–5.4 assume `X` geometrically integral, as in the Lean. The instances `[IsIntegral X']`, `[X'.IsProjectiveOver K']` and `[IsDominant π]` follow from geometric integrality and `hπ`, so they restrict nothing; the docstring says so.

**Dependency check.** Run with the command from the brief:

```text
depcheck: 237 roadmaps, 2247 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Citation resolver** (`roadmaps resolve` on the README): no cross-roadmap citation found nowhere, and no Lean name found nowhere. Lean names outside TauCetiRoadmap were not checked by the tool on this host. I checked every Mathlib and Tau Ceti name I added directly at the pins, with the file and line given above.

**Gate failures.** One was listed: statement-hygiene=2, two P3 `letI`s in the signature of `mixedDegree_baseChange`. Repair:
- The K-structure of `graph f` is now the instance binder `[(graph f).Over (Spec (.of K))]` together with `[(graphFst f).IsOver (Spec (.of K))]`. By `Scheme.Hom.isOver_iff` (Mathlib `AlgebraicGeometry/Over.lean`), the second binder says `graph f ↘ Spec K = graphFst f ≫ X ↘ Spec K`. Since `OverClass` has the single field `hom`, this fixes the instance uniquely as the old `letI` value. The binders are satisfiable (that value satisfies `IsOver` by `rfl`), so the statement is unchanged.
- The K'-structure `letI` is deleted. Mathlib's named instance `AlgebraicGeometry.Scheme.canonicallyOverPullback` (`AlgebraicGeometry/Pullbacks.lean` line 816, `hom := pullback.snd`) supplies it. A scratch `example … := rfl` confirmed that its structure morphism is `pullback.snd`, and the `pp.explicit` type shows `realIntersection K'` uses that instance.
- The docstring now names both structures. The README is unchanged: §4.1 already regards the graph as a `K`-scheme through `π_1`, and §4.3 uses the fibre product over `K'`, so the generality is the same. No other declaration changed. The remaining `haveI` (`topologicalDegree`) and `letI` (`mixedDegree`) are in definition bodies, not signatures.

After the repair:
- Elaboration: exit 0, 20 warnings, all `declaration uses sorry`.
- Depcheck: `depcheck: 236 roadmaps, 2246 edges, 0 problem(s)`.

**Ownership.** `roadmaps grep` on main and the open heads finds no other owner of the base change of scheme-theoretic rational maps or of dynamical degrees. ArithmeticDynamics §0.22 (open, and on the board) has base change of its own form-theoretic rational self-maps of `ℙ¹`, which is a different carrier. This roadmap already owns the field-extension behaviour of graphs (Scope, §§1.2–1.4). No new supplier is named and no gap is declared: `design/plan.json` is unchanged.

## Adversarial pass (new and changed statements)

| statement | instances tried | values on each side | result | change |
| --- | --- | --- | --- | --- |
| `mixedDegree_baseChange` | `d = 0`, `X = Y = Spec ℂ` over `ℝ`, `f = id`, `K' = ℂ` | `h⁰` over `ℝ` is `2`; `Spec(ℂ ⊗_ℝ ℂ) = Spec(ℂ × ℂ)` gives `2` over `ℂ` | true | none |
| `mixedDegree_baseChange` binders | two instances `i`, `i'` on `graph f`, each with `[(graphFst f).IsOver _]`; existence | `i.hom = graphFst f ≫ X ↘ Spec K = i'.hom`, so `i = i'` by structure eta; `⟨graphFst f ≫ X ↘ Spec K⟩` satisfies `IsOver` by `rfl` | binders determine exactly the old structure and are never vacuous | `letI`s replaced by instance binders |
| same | `ℙ¹_ℂ` over `ℝ`, `f = id`, `L = M = O(1)`, `(p, q) = (0, 1)` and `(1, 0)` | `χ_ℝ(O(n)) = 2n + 2`, coefficient `2`; two diagonals over `ℂ`, `1 + 1 = 2` | true; geometric integrality not needed, as stated | none |
| same | Cremona over `ℚ` to `ℂ` | `(1, 2, 1)` = `(1, 2, 1)` | true | none |
| same | `K' = K`; real class `√2·O(1)` on `ℙ¹`, `f = id`, `q = 1` | fibre product along the identity is `≅ Γ_f`; `√2 = √2`, since `mapDomain` moves the coefficient to the pulled-back class | true | none |
| §1.4 characterization | `K' = K`, `π = id` | `f'.compHom id = f'` and `id.comp f = f`, so `f' = f` | true | none |
| same | `ℙ¹_ℝ`, `K' = ℂ`, `f = id`, conjugation `c` | `π ∘ c = π`, but `c` followed by the structure morphism is the structure morphism followed by `Spec(conj)` (sends `i` to `−i`), so `c` is not over `ℂ` | the over-`K'` hypothesis is needed | added as a §1.4 Check |
| same | Frobenius of `ℙ^d_{𝔽_p}`, `K' = 𝔽_p(t)`; absolute Frobenius `Φ` | `π ∘ Φ = F ∘ π`; `Φ` sends `t` to `t^p` | excluded by over-`K'` | added as a §5.4 Check |
| density of `U_{K'}` | open `π`, nonempty open `W ⊆ X'` | `π(W)` is open and nonempty, so it meets `U`, so `W` meets `π^{−1}(U)` | true (stacks-morphisms line 2009) | locator added |
| `dynamicalDegree_baseChange` | `d = 0`: geometric integrality forces `X = Spec K`, `f = id` | `lim 1^{1/n} = 1` on both sides | true | none |
| same | Fibonacci over `ℚ` to `ℂ`, `k = 0, 1, 2` | `(1, Real.goldenRatio, 1)` on both sides | true | added as a §5.3 Check |
| same | Frobenius `𝔽_p` to `𝔽_p(t)`, `k = d` | `p^d = e(F) = e(F_{K'}) = p^d` | true | none |
| same | `ℙ¹_ℂ` over `ℝ`, `K' = ℂ` | `X' = ℙ¹ ⊔ ℙ¹`, so `[IsIntegral X']` cannot hold | statement does not apply, as the README says | none |
| `algebraicEntropy_baseChange` | Cremona `ℚ` to `ℂ`; Frobenius `𝔽_p` to `𝔽_p(t)`; `z ↦ z²` from `ℚ` to `ℂ` | `0 = 0`; `d·log p = d·log p`; `log 2 = log 2` | true | none |
| Conventions, `H` | `ℙ¹_K`, `n = 1, n, 0` | `(H) = 2 − 1 = 1`; `(O(n)) = (n + 1) − 1 = n`; `O(0) = O`, class `0` | true | witness added |
| invertibility of `O(n)` on `ℙ^d_K` | `D_+(x_0) ∪ ⋯ ∪ D_+(x_d)` | the irrelevant ideal is `(x_0, …, x_d)`, so the opens cover | the hypothesis of the Tau Ceti lemma holds | none |
| docstring reason for `[F_0 : ⋯ : F_d]` | compared with the `f_{K'}` trick | a characterization would need the chart morphisms `y_j ↦ F_j/F_i` into the degree-zero localizations; neither library has them | reason restated | changed |

## Notes for the maintainer

- New names in `Suggested.lean`: `mixedDegree_baseChange`, `dynamicalDegree_baseChange`, `algebraicEntropy_baseChange`, all under `TauCetiRoadmap.DynamicalDegreesOfRationalMaps`. No name was renamed or removed, and no section, layer or target id changed.
- Ownership against open pull requests was checked with the `roadmaps grep` tool over main and the open heads, and against the board's packages by reading them.

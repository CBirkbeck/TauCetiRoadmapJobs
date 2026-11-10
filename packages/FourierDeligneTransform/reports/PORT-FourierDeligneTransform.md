# PORT-FourierDeligneTransform

Branch: `roadmap/fourier-deligne-transform`.
Head commit: `ac178184d311337803d84e57ad815461722e8f6f` (`FourierDeligneTransform: roadmap (README, Suggested.lean, metadata)`).
Base: `9897cdb`; the initial worktree status was empty. The commit adds exactly `TauCetiRoadmap/FourierDeligneTransform/{README.md,Suggested.lean,metadata.toml}` and touches nothing outside the folder.

## Validation

- Build: `lake build TauCetiRoadmap.FourierDeligneTransform.Suggested` → `✔ [18238/18239] Built TauCetiRoadmap.FourierDeligneTransform.Suggested (4.1s)` then `Build completed successfully (18239 jobs).` Warnings: **0** (no `sorry` warning either: the file declares nothing, because no headline theorem is statable at the pins). An earlier build without the `module` header produced lake's "designed for use with the module system" warning; the file now opens with `module` followed by the single `import Mathlib`, as the recent roadmap pull requests do, and the warning is gone.
- Gate: `gate FourierDeligneTransform: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- `git diff --cached --check`: clean.
- Dependency check, exact output:

```text
depcheck: 223 roadmaps, 2033 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line. In the merge order FourierDeligneTransform is line 69; its suppliers outside main are ArithmeticGaloisRepresentations (58), InverseGaloisAndArithmeticFundamentalGroups (54) and LefschetzPencilsAndVanishingCycles (68), with EtaleCohomologyFoundations (42) and RamificationOfCompleteDiscretelyValuedFields (2) on main; every roadmap named under Downstream consumers is later (DeligneWeightsAndPurity 72, AutomorphicLFunctionsAndLocalFactors 94, EtaleDualityAndPerverseSheaves 107, CongruenceSpectralGap 156, CharacterSumsOverFiniteFields 158, SheafConvolutionOnAbelianVarieties 319).
- `roadmaps resolve` on the ported README: no cross-roadmap citation and no Lean name found nowhere.

## Draft pull request body

Builds the ℓ-adic Fourier transform of Deligne, Katz and Laumon on the étale cohomology of schemes of characteristic `p` as a general library. It starts from the finite Fourier transform of functions with values in any coefficient ring carrying a nondegenerate additive character, and develops kernel transforms between compactifiable schemes with their composition coherence and function–sheaf dictionary, then the character sheaves of smooth connected commutative groups over finite fields obtained from Lang torsors: Artin–Schreier and Kummer sheaves with their traces, vanishing cohomology and local behaviour on the line, the comparison of the ramification of a henselian trait with that of its completion, and the Euler–Poincaré formula on affine curves for every coefficient ring the roadmap uses. On a vector bundle over any `𝔽_p`-scheme it defines the transform `FT_ψ` and proves `FT_! = FT_*` by local acyclicity at infinity, inversion, duality, functoriality with external products, convolution and Plancherel, the trace-function identity and the Frobenius exchange, and perverse `t`-exactness with the equivalence of hearts. On the affine line it classifies the simple perverse sheaves on a curve and proves the exchange of their three types, Katz's theory of Fourier sheaves, the Gauss-sum transform of Kummer sheaves, Laumon's local monodromy formulas and the tame values of the three local Fourier transforms. These are the inputs of the Fourier-transform proof of the Weil bounds on curves and of the sheaf-theoretic study of exponential sums that DeligneWeightsAndPurity, EtaleDualityAndPerverseSheaves, CharacterSumsOverFiniteFields and CongruenceSpectralGap can build on. None of the headline theorems is statable against the pinned Mathlib and Tau Ceti, so `Suggested.lean` states nothing and records, theorem by theorem, which carrier is missing.

AI assistance: Claude Opus 5.5 performed the port, the supplier, ownership and duplication checks, the mathematical self-review and the Lean validation.

## Dependencies still in pull requests

- ArithmeticGaloisRepresentations (§§3.1, 3.7)
- InverseGaloisAndArithmeticFundamentalGroups (§§IG.0.T2, IG.0.T3, IG.5.8)
- LefschetzPencilsAndVanishingCycles (§§0.3, 0.5–0.8, 1.1)

No citation uses an id that only an open revision defines.

## What moved from the Lean to the README

Nothing: the package's `Suggested.lean` declared nothing, and every target, API list and Check already lived in the README. The module docstring is kept with its theorem-by-theorem list of missing carriers; its description of the pinned Mathlib now also names the cohomology of abelian sheaves on a site (`Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean`) and says explicitly that there is no derived category of étale `Λ`-module sheaves with its direct and inverse images, so that the statability verdict is not read as overlooking Mathlib's general sheaf cohomology. Its claim that Tau Ceti has torsors under a sheaf of groups on a site was checked at the pin (`TauCeti/CategoryTheory/Sites/NonabelianCohomology/Torsor.lean`, `CategoryTheory.Sheaf.Torsor`).

Headline statability, rechecked at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`): Mathlib's étale material is the small étale site, its points and `Scheme.EllAdicCohomology` (pro-étale, constant `ℤ_ℓ` coefficients, `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean`); Tau Ceti has no compact-support direct image, perverse `t`-structure, vanishing cycles or Swan conductor of local monodromy (its `Swan` files are about `p`-adic group algebras). Every headline needs `Rf_!` on étale derived categories, so none is statable. The Layer 0 identities are statable but are elementary algebra on functions, not headlines, and stay README targets, as the accepted package decided.

Mechanical signature check: the file has no declaration, so there was no `#check @name` of our own to compare. Instead every library declaration the README cites (59 names: the Mathlib names `AddChar`, `AddChar.IsPrimitive`, `AddChar.IsPrimitive.of_ne_one`, `AddChar.sum_eq_zero_of_ne_one`, `Algebra.trace`, `Algebra.norm`, `FiniteField.trace_to_zmod_nondegenerate`, `FiniteField.algebraMap_trace_eq_sum_pow`, `FiniteField.norm_surjective`, `ZMod.dft`, `ZMod.dft_dft`, `ZMod.stdAddChar`, `IsKrasner.of_completeSpace`, `gaussSum`, `mul_gaussSum_inv_eq_gaussSum`, `gaussSum_mul_gaussSum_eq_card`, `continuousCohomology`, `ContinuousCohomology.zeroIso`, `Module.Dual`, `DerivedCategory`, `CategoryTheory.Triangulated.TStructure`, `AlgebraicGeometry.Scheme`, `CategoryTheory.GrpObj`, and all Tau Ceti names of the supplier contract) was put as `#check @name` in one scratch version of the module with the corresponding `TauCeti.*` imports, built once with the brief's build command, and every name elaborated; the scratch file was then replaced by the final one. The statement shapes the README relies on were read at the pin: `AddChar.sum_eq_zero_of_ne_one` assumes `[IsDomain R']`; `AddChar.IsPrimitive ψ` is `∀ a ≠ 0, mulShift ψ a ≠ 1`; `gaussSum_mul_gaussSum_eq_card` assumes a field source, `IsDomain` target, `χ ≠ 1` and primitive `ψ`; `ZMod.dft Φ k = Σ_j stdAddChar(−(j k)) • Φ j` and `ZMod.dft_dft` is `𝓕 (𝓕 Φ) = fun j ↦ N • Φ (−j)`; `TauCeti.additiveHilbert90` is `IsZero (continuousCohomology 1 (ofDiscreteModule ℤ (AbsoluteGaloisGroup K) (ForcedDiscrete (SeparableClosure K))))`; `MonoidHom.commutatorMap_prod_range` is `commutatorMap F (∏_{i<m} F^[i] t) = t / F^[m] t` with Mathlib's `commutatorMap g = g / φ g`; `Submodule.sum_addChar_dotProduct` assumes `[IsDomain S]` and `ψ.IsPrimitive`. Each agrees with what the README says of it.

## Supplier replacements and duplication removals

- §5.1 listed "the slope decomposition `V = ⊕_λ V_λ` and `s(V) = Σ_λ λ r(V_λ)`" among the statements to prove. ArithmeticGaloisRepresentations §3.1 (*Break decomposition and Swan conductor*, at its head) defines the unique break decomposition `V = ⊕_λ V(λ)` and `Sw(V) = Σ_λ λ · dim V(λ)` for the whole conductor setting, and §2.7 already transports breaks, break decompositions and Swan conductors to henselian traits. The restatement is now a citation ("are the break decomposition and the Swan conductor of ArithmeticGaloisRepresentations §3.1, carried to the trait by the completion comparison of §2.7"), and Scope and ownership names the break (slope) decomposition among what ArithmeticGaloisRepresentations §§3.1 and 3.7 supply. The twisting formula of LAU87 Proposition (2.1.2.7) stays a target here: ArithmeticGaloisRepresentations §3.7 covers only the tensor product with a character of larger break.
- Scope and ownership, first bullet: the Tau Ceti code orthogonality is now also attributed to the roadmap that planned it, AlgebraicCodingTheory Layer 3 (completed); the kept variant differs in one clause (any coefficient ring with a nondegenerate character, an abstract vector space and its dual).
- Nothing else in the README restates a pinned declaration or a section of an earlier roadmap.

Duplication sweep by object, against main and every open roadmap pull request (through `roadmaps grep` over all heads and by reading the closest roadmaps' scope sections at their heads):

- ℓ-adic Fourier transform, `FT_! = FT_*`, Fourier sheaves, local Fourier transforms, local invariants `a_x` of perverse sheaves: no other owner. PadicDifferentialEquationsAndRigidCohomology owns only the `p`-adic analogue; CohomologicalPointCounting lists Fourier–Deligne transforms among its exclusions; CharacterSumsOverFiniteFields marks the Gauss-sum line and `ℒ_ψ`, `ℒ_χ` as not owned there.
- Kernel transforms: the kernel calculi of VStackSheavesAndLisseCategories, HeckeStacksAndLocalShtukas and AnalyticStacks are for solid sheaves on v-stacks or an abstract six-functor formalism, all later in the merge order; SheafConvolutionOnAbelianVarieties (later) owns convolution on abelian varieties and can import §§1.1–1.2.
- Character sheaves: the open EtaleCohomologyFoundations revision (its §F.0.3 at its head, *Rank-one lisse sheaves from torsors and characters*) states the generic torsor–character construction `P ×^G Λ(χ)` and assigns the Artin–Schreier and Kummer sheaves to this roadmap; since a revision is never a dependency, the README keeps citing EtaleCohomologyFoundations as it is on main, with gap:torsor-character-sheaf. AutomorphicLFunctionsAndLocalFactors AL.3.10.4 (later) constructs the Lang isogeny of `Pic⁰_D` and reads rank-one local systems off it, which is §§2.1–2.3 here for one group; Downstream consumers already says it can import them. SheafConvolutionOnAbelianVarieties §0.2's origin-normalized character sheaf is the rank-one sheaf of a character of `π₁(A_k̄)`, a different construction.
- Henselian-trait/completion comparison (§2.7): no other owner; EtaleCohomologyFoundations §F.3a compares trait inertia with local-field inertia only when the trait is already the integer ring of a local field, and RamificationOfCompleteDiscretelyValuedFields §4a.3 treats the completed maximal unramified extension.
- Euler–Poincaré on curves: InverseGaloisAndArithmeticFundamentalGroups §IG.5.8 (supplier, `𝔽_ℓ`, ordinary cohomology) is consumed. EtaleDualityAndPerverseSheaves §5.2 (`curveEulerPoincareSwan`, all smooth curves, `ℚ̄_ℓ`) and CongruenceSpectralGap §4.2b (descent to a perfect base) are later and overlap §2.7 on the affine `E`/`ℚ̄_ℓ` case; by the merge order this roadmap is the owner of that case, and Scope now says so without calling those roadmaps consumers (neither cites this roadmap at its head).
- Simple perverse sheaves on curves (§5.2): EtaleDualityAndPerverseSheaves §2.10 (later) owns every dimension; the curve case is proved here, and Scope says that roadmap can import it.

## Mathematical fixes

- **§5.5, route of the stalk-rank formula (sign).** The package said "proper base change gives `rk_{s'}(K') = −χ_c(A_{k̄}, K ⊗ ℒ_ψ(x s'))`". With the conventions of §5.1 (Euler characteristics of complexes, `rk_x = dim H^{−1} − dim H⁰`), `K'_{s̄'} = RΓ_c(A_{k̄}, K ⊗ ℒ_ψ(x s'))[1]` and `H^i_c` of a perverse object twisted by a lisse rank-one sheaf on the affine line vanishes outside degrees `0` and `1`, so `rk_{s'}(K') = h⁰_c − h¹_c = +χ_c`. Witness: `K = Λ[1]`, `s' = 0'`: `K' = i_{0'*}Λ(−1)`, so `rk_{0'}(K') = 0 − 1 = −1`, and `χ_c(A_{k̄}, Λ[1]) = −h²_c(A_{k̄}, Λ) = −1`; the package's sign gives `+1`. The sign is LAU87's, whose invariants are the negatives of these. The corrected route reproduces the stated formulas: for `s' ≠ 0'` it gives `Σ_s deg(s) a_s(K) − rk(K) + Sw(F_∞ ⊗ ℒ_ψ(x s')) = rk(K') − r(F_{∞,1}) + s(F_{∞,1} ⊗ ℒ_ψ(x s'))` by the twisting formula, and at `0'` the extra `s(F_{∞,1}) − r(F_{∞,1})` is `0`. The README now states the `+` sign with the witness. The target statements of §5.5 were already right.
- No other statement failed the pass below.

## Wording fixes (house style)

- "Pinned at …; each name was read at the pin" → "Pinned at …" (how the list was made is process narrative).
- "They build on Layers 3–5 … and form the Part II of this roadmap" and "The Part II of this roadmap: …" → the out-of-scope material "belong[s] to a Part II roadmap built on this one …; nothing here depends on them", and the Downstream-consumers bullet says it is outside this roadmap and not to be implemented under it, as CONTRIBUTING asks of a closing extension.
- Scope: "(its §0.3) … (its §0.8) … belong to SheafConvolutionOnAbelianVarieties" → "belong to SheafConvolutionOnAbelianVarieties §§0.3 and 0.8 respectively", so the pronoun no longer precedes its roadmap.

## Adversarial mathematics pass

One row per statement family; every row records instances and the values computed on both sides.

| Statement | Instances | Values computed (both sides) | Result | Change |
|---|---|---|---|---|
| Conventions/§0.1: nondegenerate `ψ` (`ψ(1)−1` a unit) | `ℤ/7`, `p=3`, `ψ(1)=2`; `ℤ/7×ℤ/7`, `(2,1)`; `ℤ/9`, `4`; `ℤ/49`, `18`; `ℤ/5`; `Λ=0` | `2³=8≡1`, `2−1=1` unit, `Σψ=1+2+4=7≡0`; `(1,0)` non-unit, `Σψ=(0,3)`; `4³=64≡1 (9)`, `3` non-unit, `Σψ=21≡3`; `18³=5832=119·49+1`, `17` unit; `3∤4`: empty class; `Λ=0`: `0` is a unit, `ψ` trivial, not `IsPrimitive` | holds | none |
| §0.1: `p` a unit, `ψ(a)−1` units | `ℤ/7`, `p=3` | `Π_{a=1}^{2}(1−ψ(1)^a)=(1−2)(1−4)=3=p` (identity `Π(1−X^a)≡p mod Φ_p`); `ψ(2)−1=3` unit | holds | none |
| §0.1: orthogonality `Σ_x ψ(Tr(xy))` | `k=𝔽_3`, `ℤ/7`, `y=1`; `y=0` | `1+2+4=7≡0`; `3=|k|` | holds | none |
| §0.1: characters of `k` are `ψ_k(c·)`, `Spec Λ` connected | `Λ=ℤ/7×ℤ/7` | `X^p−1=Π_a(X−ψ(1)^a)` with comaximal factors; CRT forces one factor nonzero only for connected `Λ`; `(ψ(c₁x),ψ(c₂x))`, `c₁≠c₂`, is not of the form | holds | none |
| §0.2: inversion `𝔉𝔉t(w)=|W|t(−w)` | `W=𝔽_3`, `ℤ/7`, `t=δ₁` | `𝔉t=(1,2,4)`; `𝔉𝔉t(2)=1+8+8=17≡3=3·t(1)`; `𝔉𝔉t(1)=1+4+16=21≡0` | holds | none |
| §0.2: Plancherel, convolution, `f_!`, translation, `ψ⁻¹` | general | `Σ_{w'}𝔉t₁𝔉t₂=Σ_{u,v}t₁(u)t₂(v)Σ_{w'}ψ_k(w'(u+v))=|W|Σt₁(u)t₂(−u)`; `𝔉(f_!t)(w₂')=Σt(w₁)ψ_k((f^∨w₂')(w₁))`; shift `u=w−e` gives `ψ_k(w'(e))𝔉t` | holds | none |
| §0.2: comparison with `ZMod.dft` | `N=3`, `Φ=δ₁` | pinned `auxDFT Φ k=Σ stdAddChar(−(jk))Φ j`: `dft Φ k=stdAddChar(−k)`, `𝔉Φ(k)=stdAddChar(k)`; `𝔉𝔉=dft∘dft=N·Φ(−j)` | holds | none |
| §0.2: subspace indicator | `W=𝔽_3²`, `U=⟨(1,1)⟩` | `3` on `U^⊥={(0,0),(1,2),(2,1)}`; at `(1,1)`: `ψ0+ψ2+ψ1=1+4+2=7≡0` | holds | none |
| Layer 0 Example: Gauss sum mod 11 | `k=𝔽_5`, `ψ(1)=3` | `3⁵=243≡1`; `Σψ(w²)=1+6+162=169≡4`; `4²=16≡5=(−1/5)·5` | holds | none |
| §1.1: Tor hypothesis | `Λ=ℤ/4`, `𝒦=ℤ/2` | `Tor_i^{ℤ/4}(ℤ/2,ℤ/2)=ℤ/2` for all `i≥0`: cohomology in every degree `≤0` | holds | none |
| §1.1: `Rp_!` not `Rp_*` | `X=𝔸¹_{k̄}`, `Y=S` | `Λ(−1)[−2]` vs `Λ` | holds | none |
| §1.1/§1.2: graph kernels | `(id,f)_!Λ`; `𝒦∘Γ_g` | `Rp_{Y!}Γ_!Γ^*p_X^*K=Rf_!K`; composite kernel `(g×id)^*𝒦` | holds | none |
| §1.4: dictionary and sign | `a=1`; `f:𝔸¹→Spec 𝔽_q` | `t_{K[1]}=−t_K`; `Σ_{𝔽_q}1=q=t_{Λ(−1)[−2]}` (geometric Frobenius `q`, even degree); arithmetic gives `q⁻¹` | holds | none |
| §1.4: perfect complexes | `[ℤ/4 —2→ ℤ/4]` | Lefschetz number `1−1=0`; `H⁰=H¹=ℤ/2` not free | holds | none |
| Conventions/§2.1: Lang convention | `𝔾_a/𝔽_3`, `x=1`, `ψ(1)=2` in `ℤ/7` | `F(t)=t+1` on the fibre; `Frob=F⁻¹`; `(Frob·s)(t)=s(t+1)=χ(1)s(t)`, trace `2`; opposite conventions give `ψ(−1)=4` | holds | none |
| §2.1: `Fⁿ(t)=t+N(x)` | `n=2` | `F²(t)=F(t+x)=t+x+F(x)` | holds | none |
| §2.2: quadratic Kummer trace | `𝔾_m/𝔽_5`, `ℤ/3` | `+1` at `1,4`; `−1` at `2,3` (non-squares mod 5) | holds | none |
| §2.2: translation law | `a∈G(𝔽_q)`, level `n` | `χ(N(x+a))=χ(N x)χ(na)`; line with `Frob=χ(a)` gives `χ(a)ⁿ=χ(na)` | holds | none |
| §2.3: norm traces | `𝔽_9`: `i+i³=0`, `1+1=2`; `𝔽_25` | `ψ(0)=1`, `ψ(2)`; `g⁶` has order `4`, generates `𝔽_5^×` | holds | none |
| §2.4: vanishing under the unit-ideal hypothesis | `𝔾_m/𝔽_5` quadratic into `ℤ/3`; `ℤ/7×ℤ/7`; `𝔾_m/𝔽_4`, `Λ=𝔽_4` | `χ(2)−1=−2≡1` unit, `Σχ=1−1−1+1=0`; `RΓ_c=(0,Λ(−1)[−2])`; `ω−1=ω²` unit | holds | none |
| §2.5: Artin–Schreier laws | `ℒ_ψ(x²−x)` vs `ℒ_ψ(x²−x³)` on `𝔸¹_{𝔽_3}`; `ℒ_ψ(cf)` | difference `x³−x=L∘x`, `L^*ℒ_ψ≅ℒ_1=Λ`; `[c]^*ℒ_ψ=ℒ_{ψ(c·)}` | holds | none |
| §2.6: `j_!≅Rj_*` and its hypotheses | trivial `χ`; `k=ℂ`, `N=2`, `ℤ/3`; `k=𝔽̄_2`, `N=3`, `𝔽_4` | stalk `H⁰=Λ`, `H¹=Λ(−1)`; `χ(−1)−1=−2≡1`; if both `χ`, `χ⁻¹` held, `RΓ=RΓ_c=0`, contradicting infinite `H¹` | holds | none |
| §2.6: compatibility in `N` | `𝔽_5`, `N=2`, `N'=4` | `t⁴=x` pushed along `ζ↦ζ²` is `s=t²`, `s²=x` | holds | none |
| §2.7: Euler–Poincaré | `𝔸¹`, `Λ`; `𝔾_m`, Kummer; `𝔸¹`, `ℒ_ψ(x)`; `ℤ/49`, `ℒ_ψ(x²)` | `1·(2−0−1)−0=1`; `2−0−2=0`; `1−1=0`; `1−2=−1` (rank 1, length 2) | holds | none |
| §2.7: henselian hypothesis | `R=k[π]_{(π)}`, `p` odd | `1+π` a square in `k[[π]]`, not in `k(π)` | holds | none |
| §2.8: rank `d−1`, trace | `d=2`, `p=3`, `k=𝔽_3`; `k=𝔽_5`, `ℤ/11` | `Tr H¹_c=−Σψ(x²)=−(1+2ψ(1))`; `−169≡−4≡7` | holds | none |
| §3.2: `FT(σ_*M)=π'^*M[r]` | `𝔸¹`, `i_{0*}Λ` | `Λ[1]`, trace `−1=−Σδ₀ψ(xx')` | holds | none |
| §3.3: `FT_!=FT_*` | `K=Λ`, `r=1`; trivial `ψ` | `FT_!Λ=σ'_*Λ(−1)[−1]`; constant kernel `Rpr'_!Λ=Λ(−1)[−2]` vs `Rpr'_*Λ=Λ` | holds | none |
| §3.4: inversion | `i_{a*}Λ`, `r=1` | `FT=ℒ_ψ(ax')[1]`; `FT²=Rpr_!ℒ_ψ(x'(a+y))[2]=i_{(−a)*}Λ(−1)` | holds | none |
| §3.4: `Rπ'_!FT K=σ^*K(−r)[−r]`, `σ'^*FT K=Rπ_!K[r]` | `i_{0*}Λ`; `Λ[1]` | `Rπ'_!Λ[1]=Λ(−1)[−1]`; `σ'^*σ'_*Λ(−1)=Λ(−1)=Rπ_!(Λ[1])[1]` | holds | none |
| §3.5: duality | `i_{a*}Λ`; `Λ[1]` | `D(ℒ_ψ(ax')[1])=ℒ_{ψ⁻¹}(ax')(1)[1]=FT_{ψ⁻¹}(i_{a*}Λ)(1)`; `D(σ'_*Λ(−1))=σ'_*Λ(1)=FT_{ψ⁻¹}(Λ(1)[1])(1)` | holds | none |
| §3.6: linear maps, shift `r₂−r₁` | `E₁=O`, `E₂=0`, `K₁=i_{0*}Λ` | `Rf_!K₁=Λ_S`; `σ'^*(Λ[1])[−1]=Λ`; shift `r₁−r₂` gives `Λ[2]` | holds | none |
| §3.6: convolution, Plancherel, sub-bundles | skyscrapers; `K₁=K₂=i_{0*}Λ`; `s=r=1`, `s=0` | `ℒ⟨a+b⟩[r]=ℒ⟨a⟩[r]⊗ℒ⟨b⟩[r][−r]`; `Rπ'_!Λ[2]=Λ(−1)=Rπ_!(i_{0*}Λ)(−1)`; `FT(Λ[1])=σ'_*Λ(−1)`, `FT(σ_*Λ)=Λ_{V'}[r]` | holds | none |
| §3.6: quadratic forms | symmetric `a`; `p=2`, `r=2` antidiagonal | `q(e+a⁻¹e')=q(e)+2⟨e,e'⟩+q'(e')` using `⟨a⁻¹e',ae⟩=⟨e,e'⟩`; `q=2x₁x₂=0`, both sides `π'^*Λ(−2)[−2]` | holds | none |
| §3.6: Tor checks | `ℤ/9`, `p=2`, `ψ(1)=−1`, `K=(ℤ/3)` | `−2=7` unit; external product `σ'_*(ℤ/3)(−2)[−2]` both sides; convolution `σ'_*(ℤ/3)(−2)[−3]` both; Plancherel `(ℤ/3)(−2)[−2]` both | holds | none |
| §3.7: reduction of coefficients | `ℤ/49→ℤ/7`, `18↦4` | `4³=64≡1 (7)`, `4−1=3` unit | holds | none |
| §3.8: trace identity | `r=1`, `K=Λ` | `−Σ_xψ(xx')=−q` at `0'`, `0` elsewhere `=` trace of `σ'_*Λ(−1)[−1]` | holds | none |
| §4.1: `t`-exactness | `i_{0*}Λ`, `Λ_{𝔸¹}`; trivial `ψ` | `Λ[1]` perverse; `σ'_*Λ(−1)[−1]∈ᵖD^{≥1}`; trivial `ψ`: `FT(Λ[1])=Λ(−1)`, not perverse | holds | none |
| §4.2: exact sequence | `0→i_{0*}Λ→j_!Λ[1]→Λ[1]→0` | rotated localization triangle; image `0→Λ[1]→FT(j_!Λ[1])→i_{0'*}Λ(−1)→0` | holds | none |
| §5.1: `a_x` and the Euler–Poincaré formula | `i_{x*}Λ` on `ℙ¹`; `j_!ℒ_ψ(x)[1]`; `ℙ¹⊔ℙ¹`; `ℙ¹_{𝔽_{q²}}/𝔽_q` | `a_x=0+0+1=1`, `χ=1=1−0`; `a_∞=1+1−0=2`, `χ=0=2−2`; `−2` vs `−4` or `0`; `C=2`: `−4=0−4` | holds | none |
| §5.1: `a_x=0` criterion | perverse `K` | `rk_x=rk` forces `H⁰_x̄=0` and full invariants, hence lisse, hence `sw_x=0` | holds | none |
| §5.1: reduced representative | `𝔽̄_3`, `u=t⁻⁶+t⁻⁴+t⁻²` | `w=t⁻²`: `t⁻⁴+2t⁻²`; `z=t⁻²+t⁻¹`: `t⁻⁴−t⁻³+2t⁻²+t⁻¹`, `−t⁻³≡−t⁻¹`, back to `t⁻⁴+2t⁻²` | holds | none |
| §5.1: slope decomposition | — | is ArithmeticGaloisRepresentations §3.1's break decomposition and `Sw=Σλ dim V(λ)` | restatement | cited, no longer a target |
| §5.2: types and transforms | `ℒ_ψ(x)[1]`; `s'=0'`; `ψ(c·)`, `[−1]^*`, `D` | `FT=Rpr'_!ℒ_ψ(x(1+x'))[2]=i_{(−1)*}Λ(−1)`; `π^*F'[1]↦i'_{0'*}F'(−1)`; parameters `c⁻¹`, `−1`, `(−1,Λ(1))` | holds | none |
| §5.3: `NFT` trace sign and hypotheses | Kummer `j_!ℒ_χ`; `Λ`; `ℒ_ψ(x²)` | `−𝔉(χ)(x')=−χ⁻¹(x')g=χ⁻¹(x')·(−g)`; `NFT(Λ)=0` vs `−𝔉(1)(0')=−q` (needs elementary); quadratic formula gives `ℒ_ψ(−x'²/4)⊗H¹_c` | holds | none |
| §5.3: duality of `NFT` | Fourier `ℱ` | `D(NFT ℱ)[1]=[−1]^*FT(Dℱ[1])(1)` and `FT∘[−1]^*=[−1]^*∘FT` | holds | none |
| §5.4: Gauss-sum line | `q=5`, `𝔽_11`, `ψ(1)=3`, `χ` quadratic | `g=3−9−27+81≡3+2+6+4=15≡4`, `g²=16≡5=χ(−1)·5`; Frobenius on `G` is `−4=7`; dual: `−g(χ⁻¹,ψ⁻¹)q⁻¹=(−g)⁻¹` | holds | none |
| §5.5: stalk-rank route `rk_{s'}(K')=±χ_c` | `K=Λ[1]`, `s'=0'` | `rk_{0'}(K')=−1`; `χ_c(A,Λ[1])=−1`; package's `−χ_c` gives `+1` | false sign | fixed to `+χ_c`, witness added |
| §5.5: rank formulas and sequence at `0'` | `Λ[1]`; `i_{0*}Λ`; `ℒ_ψ(x²)[1]`; `j_!ℒ_χ[1]` | `rk'=0`, `rk_{0'}=0−1+0=−1`, `0→0→0→Λ(−1)→Λ(−1)→0`; `rk'=1`; `2−1=1`; `rk'=1`, `rk_{0'}=1−1+0=0` | holds | none |
| §5.5: rank of vanishing cycles | perverse `K'` | `χ(RΦ)=χ(RΨ)−χ(K'_{s̄'})=−rk'+rk_{s'}`, so `dim R^{−1}Φ=r(F_{∞,1})−s(F_{∞,1}⊗ℒ_ψ(xs'))`, using `s(F_{∞,1})=r(F_{∞,1})` | holds | none |
| §5.6: tame values | `Λ` at `(∞,0')`; Kummer at `(0,∞')` and `(∞,0')` | `Λ(−1)` from `FT(Λ[1])=i_{0'*}Λ(−1)`; `ℒ_{χ⁻¹}(1/π')=ℒ_χ(π')`; renaming `χ↔χ⁻¹` in the §5.5 Check gives `V'_χ⊗G(χ⁻¹,ψ)` | holds | none |
| §5.6: change of `ψ` | `ℒ_{ψ(c·)}(π/π')=ℒ_ψ(π/(c⁻¹π'))` | substitutions `π'↦c⁻¹π'`, `π'↦cπ'`, `π'↦c⁻¹π'` | holds | none |
| §5.6: quasi-unipotent step | unipotent `u`, `Q` invertible | `u^Q−1=(u−1)(Q+(u−1)(…))`, second factor a unit | holds | none |

Context (item 2 of the pass): `Suggested.lean` has no `variable` block and no declaration, so no standing hypothesis can be dropped. Generality (item 3): unchanged from the accepted package; the README's generality is not narrowed anywhere.

## Suppliers, re-resolved

On main (`9897cdb`): EtaleCohomologyFoundations §§G.1–G.3, 0.7, 0.8, 0.9, 0.11, F.0.1–F.0.4, F.1, F.2.1–F.2.7, F.3, F.3a, F.4.0–F.4.6, F.5, F.6, F.8, F.10.1, F.10.2, F.10.2b, F.10.3 (all headings present; its `VanishingCycles.*`, `ClassicalAlgebraic.*` and `PerfectComplex.lefschetzNumber` names occur in its `Suggested.lean`); EnhancedDerivedSheaves §§0.1–0.4; SchemeAndStackFoundations §§2.9, 2.11; ReductiveGroupsPartII §RG2.3.7 (*lang-theorem* (a), `Lang.lang_surjective`, Check *lang_not_connected*); AdicEtaleGeometry §A1.0.5 (*henselian-finite-etale-approximation* (a)); RamificationOfCompleteDiscretelyValuedFields §§3a.1, 4a.1, 4a.2, 4a.3. At the open heads: ArithmeticGaloisRepresentations §3.1 and §3.7 (*Artin–Schreier characters*); InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2 (`VanishingCycles.etaleTraceFormulaFinite`), IG.0.T3 (`VanishingCycles.etaleTraceFormula`), IG.5.8 (*Euler characteristic of `ℓ`-torsion local systems on affine curves*); LefschetzPencilsAndVanishingCycles §§0.3, 0.5–0.8 and §1.1 (Grothendieck's arithmetic monodromy theorem, with exactly the residue-field hypothesis the README quotes). Consumer ids at the heads: EtaleDualityAndPerverseSheaves §§2.7, 2.10, 5.2 (`curveEulerPoincareSwan` inside §5.2); DeligneWeightsAndPurity §§5.2, 6.2–6.5; AutomorphicLFunctionsAndLocalFactors AL.3.10.2, AL.3.10.4; CharacterSumsOverFiniteFields §3.6; CongruenceSpectralGap §4.2b; SheafConvolutionOnAbelianVarieties §§0.3, 0.8.

The four supplier gaps were re-read against EtaleCohomologyFoundations on main and are still gaps: §F.0.3 constructs Tate twists only (torsor–character sheaf); §F.2.7 gives the projection formula for Noetherian bases, `Dᵇ_ctf` and invertible annihilator only (qcqs projection formula); §F.6 has `f^!Λ ≅ Λ(d)[2d]` for constant coefficients only (smooth exceptional pullback); §F.8 states only the absolute affine vanishing (relative `t`-exactness of smooth and affine morphisms). The `What EtaleCohomologyFoundations must provide (gap:…)` form is the one FlagVarieties uses on main.

## Unresolved

- The acceptance stays conditional on the four EtaleCohomologyFoundations gaps (`torsor-character-sheaf`, `projection-formula-qcqs`, `smooth-exceptional-pullback`, `perverse-exactness-affine-smooth`). The open EtaleCohomologyFoundations revision states the torsor–character construction; once it merges, gap:torsor-character-sheaf can become a plain citation.
- Later roadmaps that restate what this roadmap owns (theirs to fix, not this pull request's): CongruenceSpectralGap places the Artin–Schreier sheaf `ℒ_ψ` in a gap on DeligneWeightsAndPurity (`gap:additive-character-sheaf-weight`), where no such target exists; its weight-free part is §§2.2–2.5 here. EtaleDualityAndPerverseSheaves §5.2 and CongruenceSpectralGap §4.2b restate the affine Euler–Poincaré formula of §2.7 for rational coefficients, and EtaleDualityAndPerverseSheaves §2.10 contains the curve case of §5.2; AutomorphicLFunctionsAndLocalFactors AL.3.10.4 builds the Lang isogeny of `Pic⁰_D` that §§2.1–2.3 cover. None of them cites this roadmap at its head.
- SGA45-ST and KW01 remain cited by locator only (paywalled, uncertified in the sources manifest); every claim attached to them is also attached to a certified LAU87 locator.
- Ownership against open pull requests was checked through `roadmaps grep` over all open heads (index of 2026-11-10) and by reading the closest roadmaps (EtaleDualityAndPerverseSheaves, the EtaleCohomologyFoundations revision, LefschetzPencilsAndVanishingCycles, DeligneWeightsAndPurity, CongruenceSpectralGap, CharacterSumsOverFiniteFields, SheafConvolutionOnAbelianVarieties, AutomorphicLFunctionsAndLocalFactors) at their heads; a locating helper was used to find candidate passages, and every passage relied on above was read directly.
- No suspicious instruction was found in any package file, review, roadmap or pull-request text read for this job.


Pull request: #2132 (roadmap/fourier-deligne-transform at ac17818)

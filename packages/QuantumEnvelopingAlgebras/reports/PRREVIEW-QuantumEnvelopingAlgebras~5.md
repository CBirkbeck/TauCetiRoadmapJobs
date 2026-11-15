# Review of QuantumEnvelopingAlgebras (pull request #2363 at 4f34e39)

**Verdict:** needs changes

## R01 (P1) — The Serre presentation over every `(k, q)` rests on a step that is the theorem itself

**Location:** `TauCetiRoadmap/QuantumEnvelopingAlgebras/README.md:542–543` ("The generator map `T_R→f_R` has kernel exactly `I_(S,R)`. This presentation over `R` is a separate theorem"), `:524`, `:530–531`; `Suggested.lean:276–280`, `:517–522`.

**Claim:** `R` is a principal ideal domain, so "kernel `= I_(S,R)`" holds iff `T_R/I_(S,R)` is torsion-free, iff `J = I_S` over every residue field `𝔽_p(v)` and `ℚ[v]/(g)`: the input is the conclusion. No route and no source is given for it. Lusztig1993 Theorem 33.1.3 is over `ℚ(v)`; Tanisaki's algebra is the specialization of Lusztig's form, as `README.md:555–556` itself says.

**Witness:** Tanisaki2016 lines 19–21, 814–816 (Theorem 5.4 is nondegeneracy on the specialized form). HeckenbergerDoubles2010 lines 2259–2266: Serre relations suffice over `ℚ(q)`, and for `q` not a root of 1 by Heckenberger–Kolb, whose setting is `ℂ`.

**Repair:** Either (a) state `halfRadical_eq_serreKernel` and `drinfeldJimbo_equiv` with the extra binder `[CharZero K]` (elaborates on a scratch copy), restrict the first sentence of 1.3a to characteristic zero, cite HeckenbergerDoubles2010 Example 7.4 (line 2259) and Heckenberger–Kolb, arXiv math/0605460, §3.4 at it, and replace lines 542–546 by a route whose inputs are targets (the ranks of `f` from the character formula at `λ = 0`, already in 1.3a, and the Gabber–Kac argument for the reverse inclusion with the Casimir of this section); `U` stays defined by the radical for every `(k, q)`, so 1.1–1.3, 1.4 and 2.1 are unaffected. Or (b) keep every `(k, q)` and write that route for positive characteristic, each input a target with a locator. The computation in the table found no counterexample in characteristic 2, 3, 5.

## R02 (P2) — The pinned Tau Ceti already has the quantum integers, the quantum binomials and `U_q(sl₂)`

**Location:** `README.md:129–130` ("No q-binomial, quantum integer, Drinfeld–Jimbo algebra, Nichols algebra or Yetter–Drinfeld category exists at the pinned Mathlib or Tau Ceti."); `:259–268`; `Suggested.lean:118–123`.

**Claim:** The sentence is false at the pin, `qInt` restates a library definition, and three 0.2 API bullets restate library theorems.

**Witness:** Pinned `TauCeti/QuantumGroups/QuantumInteger/Basic.lean:150` (`quantumInteger`), `:33` (`IsGenericQuantumParameter`), `:204`, `:262`; `Binomial.lean:70` (`quantumBinomial`, the same Pascal rule); `Laurent.lean:65` (`laurentQuantumInteger`); `UqSl2/Basic.lean:86`, `UqSl2/Hopf.lean:167`.

**Repair:** Delete the sentence. Add these declarations under "From Tau Ceti" and cite `TauCeti.UqSl2` as the Q8 carrier. Delete `qInt`, define `qFactorial q r = ∏ j ∈ Finset.range r, TauCeti.quantumInteger q ((j : ℤ) + 1)` with `import TauCeti.QuantumGroups.QuantumInteger.Basic` (elaborates on a scratch copy; the two agree on `ℕ`, junk value included). Drop the 0.2 bullets that are `quantumInteger_natCast_eq_sum` and `quantumInteger_ne_zero`. In 0.3 say in one clause that `gaussian` is the `ℤ[v, v⁻¹]`-valued form of `quantumBinomial` and `[j]_v` is `laurentQuantumInteger j`.

## R03 (P2) — The rank-one comparison is statable at the pins and absent

**Location:** `Suggested.lean:29–30` ("the comparison with the rank-one algebra of QuantumGroups Q8 (Layer 1), whose carrier is a roadmap target, not a library declaration"); `README.md:421–426`.

**Claim:** The carrier is a library declaration, so the docstring's reason fails and the headline is statable.

**Witness:** `TauCeti.UqSl2` at pinned `TauCeti/QuantumGroups/UqSl2/Basic.lean:86`, generators `e`, `f`, `k`, `kInv` at `:112–121`, relation `K E = q² E K` at `:72`; `README.md` of QuantumGroups on main, lines 68–76.

**Repair:** Remove the docstring item, add `import TauCeti.QuantumGroups.UqSl2.Hopf`, and state, after `end Presentation` with the datum's binders written out (elaborates on a scratch copy, `sorry` the only warning):

```lean
theorem exists_rankOne_algHom (D : CartanDatum ι X Y) (q : ℂ)
    (hq : TauCeti.IsGenericQuantumParameter q) (i : ι) :
    ∃ φ : TauCeti.UqSl2 (q ^ D.symmetrizer i) →ₐ[ℂ] U D q,
      Function.Injective φ ∧
      φ (TauCeti.UqSl2.e _) = E D q i ∧ φ (TauCeti.UqSl2.f _) = F D q i ∧
      φ (TauCeti.UqSl2.k _) = Ki D q i ∧ φ (TauCeti.UqSl2.kInv _) = KiInv D q i
```

## R04 (P2) — The bicharacter-braided ambient has an owner on main that is not cited

**Location:** `README.md:343–348` ("give `T ⊗ T` the multiplication … Construct the algebra map `r : T → T ⊗_χ T`"), `:364–366`, `:593–599`, `:1118`; `Suggested.lean:31–33`.

**Claim:** The `χ`-braided category of graded vector spaces, braided tensor multiplication, Hopf algebras in it and Yetter–Drinfeld modules are owned by HopfologicalAlgebra; 1.0, 1.4 and 5.4 build instances without citing it, and the Scope section does not name it.

**Witness:** Main `TauCetiRoadmap/HopfologicalAlgebra/README.md:26–27` (owns "the bicharacter-braided graded ambient"), `:730–734` (`G`-graded spaces, braiding `v ⊗ w ↦ χ(|v|,|w|) w ⊗ v`, braided tensor multiplication, Yetter–Drinfeld modules).

**Repair:** Add to "It leaves to named roadmaps": "the `χ`-braided category of `G`-graded vector spaces, braided tensor products of algebras and Yetter–Drinfeld modules: HopfologicalAlgebra Layer 7 §7.3; Layer 1 instantiates it at `G = Q` and constructs `f` in it". Add a supplier-contract entry and "HopfologicalAlgebra Layer 7 §7.3" to the *Needs* of 1.0, 1.4 and 5.4. The dependency check on a scratch README with that line: `depcheck: 245 roadmaps, 2236 edges, 0 problem(s)`.

## R05 (P2) — Freeness of `f_A` over `ℤ[v, v⁻¹]` is asserted with no owner, and the route does not need it

**Location:** `README.md:539–540` ("each `f_(A,ν)` is finite free of rank `dim_ℚ U(n⁻)_(−ν)`"), `:535`.

**Claim:** `A` is not a principal ideal domain, so a finitely generated torsion-free `A`-module need not be free. In every symmetrizable type freeness of the divided-power form comes from the canonical or global basis, which `README.md:61–63` leaves to KacMoody, Part II, a consumer of this layer. 1.3a only uses `f_R`.

**Witness:** `R` is a principal ideal domain: factorial, and every height-two prime `(p, g)` of `ℤ[v]` contains `v` or some `vⁿ − 1` (finite residue field). Tanisaki2016 lines 296–297 cites Lusztig §14.2 only.

**Repair:** Replace by: "Let `f_R` be the `R`-subalgebra of `f_ℚ(v)` generated by the `θᵢ` (the quantum factorials are units of `R`). Each `f_(R,ν)` is finitely generated and torsion-free over the principal ideal domain `R`, hence free of rank `dim_ℚ(v) f_ν`." Remove `f_A` from 1.3a; finite-type freeness over `A` stays with the PBW basis of 3.2.

## R06 (P3) — Gate: two backticked names are not declared

**Location:** `README.md:379` ("(`halfRadical_inverse_parameter`)"), `:382` ("(`halfSerre_mem_radical`)").

**Claim:** `readme-ids-missing=2`: a backticked name of the roadmap's own claims a declaration of `Suggested.lean`.

**Witness:** Gate at 4f34e39: `readme-ids-missing: halfRadical_inverse_parameter`, `readme-ids-missing: halfSerre_mem_radical`; neither occurs in `Suggested.lean`.

**Repair:** Delete the two parenthesised names; the sentences already state the facts in prose.

## R07 (P3) — Gate: `letI` in the signature of `exists_antipode`

**Location:** `Suggested.lean:459` (`letI := bialgebra D q hq hfac`).

**Claim:** `statement-hygiene=1`.

**Witness:** Gate at 4f34e39: "line 459: P3 `letI` in the signature of theorem `exists_antipode`".

**Repair:** Drop the `letI` line and write the two convolution identities with the maps themselves (elaborates on a scratch copy): `LinearMap.mul' K (U D q) ∘ₗ S.rTensor (U D q) ∘ₗ (comulAlgHom D q hq hfac).toLinearMap = Algebra.linearMap K (U D q) ∘ₗ (counitAlgHom D q).toLinearMap`, and the same with `S.lTensor`.

## R08 (P3) — The section `QuantumPlaneLattice` is padding and contradicts the module docstring

**Location:** `Suggested.lean:577–682`, and the docstring sentence at `:20–25` ("native integral matrices illustrating the quantum-plane comparisons of Layer 8").

**Claim:** The section states matrix stand-ins for Layer 8, which the same docstring (`:49–50`) lists as not statable. None of its 18 names occurs in the README, 11 declarations have no docstring, `:586` and `:627` carry process wording, `gaussian_at_one` mirrors `README.md:305`, and `gaussian_first_root` is `quantumLucas` at `m = l`.

**Witness:** `grep` of each name in `README.md`: 0 hits for `comparison_intertwines`, `hopfDualComparison`, `specializedComparison_ker_range` and the other fifteen.

**Repair:** Delete it from `Suggested.lean` (lines 577–682 and the docstring sentence); the README keeps 8.1–8.2 as targets and Checks. The file elaborates without it.

## R09 (P3) — Lean form of the new declarations

**Location:** `Suggested.lean:517` (`drinfeldJimbo_equiv`), `:165` (`local instance halfDecidableEq : DecidableEq ι := Classical.decEq ι`), `:168–231`, `:253`, `:271`; `README.md:529` ("its generator map to `U` is a Hopf algebra isomorphism").

**Claim:** A theorem concluding `∃ e : _ ≃ₐ[K] _` is named `exists_*`. The classical instance is baked into `freePairing_characterisation`'s `if i = j` and into `halfRadical`. The README says Hopf isomorphism, the Lean states an algebra isomorphism. Twelve declared names are absent from the README.

**Witness:** Absent from `README.md`: `HalfWordAlgebra`, `halfWord`, `freeHalfScale`, `removeWord`, `freeRemove`, `pairingRow`, `halfDeltaWord`, `freeHalfDelta`, `halfMk`, `halfGenerator`, `cartanBraiding`, `HalfSerreRelation`.

**Repair:** Rename to `exists_drinfeldJimbo_equiv`. Replace line 165 by `[DecidableEq ι]` in the `variable` line of the section (elaborates on a scratch copy). In `README.md:529` write "is an algebra isomorphism matching the generators, hence a Hopf algebra isomorphism for the transported coproduct". Name the twelve definitions in 1.0, 1.1 and 1.3a where their objects are introduced.

## R10 (P3) — The nonvanishing criterion of 0.2 fails at `q = 0`

**Location:** `README.md:266` ("`qFactorial q n ≠ 0` for all `n` if and only if `q` is not a root of unity.").

**Claim:** The converse fails without `q ≠ 0`.

**Witness:** `q = 0`: `qInt 0 1 = (0 − 0⁻¹)/(0 − 0⁻¹) = 0/0 = 0`, so `qFactorial 0 1 = 0`, and `0` is not a root of unity.

**Repair:** "For `q ≠ 0`, `qFactorial q n ≠ 0` for all `n` if and only if `q` is not a root of unity", or state it with `TauCeti.IsGenericQuantumParameter` (R02).

## R11 (P3) — `Ψ` and `Fr` commute only up to a sign automorphism and a target comparison

**Location:** `README.md:1091–1092` ("it is compatible with `Fr` on both sides"), `:1053–1054`, `:1166–1167`.

**Claim:** Unrepaired from the previous review. Where `Fr` exists at `ζ` and `−ζ` the two maps differ by a sign automorphism of the target; at odd order the target parameters at `−ζ` and `ζ` differ, so a target comparison `Ψ*` is needed.

**Witness:** `A₁`, `d = 1`, `L = 2`, `ζ = i`: `Fr_ζ(Ψ(E^(2)1_λ)) = −e1_λ`, `Ψ*(Fr_(−ζ)(E^(2)1_λ)) = +e1_λ`. Odd `L`: `(−ζ)^(dᵢL²) = (−1)^(dᵢ)`, `ζ^(dᵢL²) = 1`.

**Repair:** State the bullet as `Fr_ζ ∘ Ψ = θ ∘ Ψ* ∘ Fr_(−ζ)` with `θ(eᵢ^(k)1_λ) = (−1)^(dᵢ k L(L−1)/2) eᵢ^(k)1_λ` and likewise on `fᵢ^(k)1_λ`; define the odd-order map as `Ψ* ∘ Fr_(−ζ^c) ∘ Ψ⁻¹`; say at `:1167` that the two maps agree on the positive half up to this sign.

## R12 (P3) — Locator loose ends

**Location:** `README.md:1199` (6.1: "*Needs:* Layers 4–5; 0.3.", no source); `:1420–1421` ("Theorem 5.8 (pairing of the positive and negative parts); Example 7.4 (the Serre relations in finite type)").

**Claim:** 6.1 still has no locator for `Fr^*L(λ) ≅ L_ζ(Lλ)`. Theorem 5.8 and Example 7.4 are cited nowhere in the body, and Example 7.4 is not about finite type.

**Witness:** HeckenbergerDoubles2010 lines 2259–2262: quantized symmetrizable Kac–Moody algebras over `ℚ(q)`; line 1578–1580: the pairing is nondegenerate on `U⁺ × U⁻`. AndersenWen1992 lines 206–208: the tensor-product theorem, whose case `λ⁰ = 0` is 6.1.

**Repair:** Cite AndersenWen1992 §1.9 (line 206) at 6.1; attach "HeckenbergerDoubles2010 Theorem 5.8, line 1578" to the nondegeneracy sentence at `:604`; relabel Example 7.4 as "Serre relations for symmetrizable Kac–Moody data over `ℚ(q)`" and cite it at 1.3a (R01).

## R13 (P3) — The description's account of the sources and of the suppliers

**Location:** Pull-request description: "(Lusztig1993 Theorem 33.1.3; Tanisaki2016 over arbitrary fields)"; "Section 1.3a's *Needs* adds KacMoody §2.1 for the Weyl group."

**Claim:** The head contradicts the first sentence and the second leaves out new supplier sections.

**Witness:** `README.md:555–556`: Tanisaki's nondegeneracy "does not replace the presentation theorem over `R`". `README.md:530`: "*Needs:* 1.0–1.3; KacMoody §§1.4, 2.1, 4.1 and 4.3–4.4".

**Repair:** "(Lusztig1993 Theorem 33.1.3 over `ℚ(v)`; Tanisaki2016 for the nondegenerate pairing on the specialized integral form over arbitrary fields)" and "Section 1.3a consumes KacMoody §1.4 (PBW dimensions), §2.1 (the Weyl group), §4.1 and §§4.3–4.4 (character ring, Verma character, denominator identity); Layers 1 and 4 of KacMoody are new supplier layers."

## R14 (P3) — The Summary's supplier list omits KacMoody Layer 2

**Location:** `README.md:18–19` ("It is built from KacMoody Layers 0, 1 and 4, RootSystems, LieHighestWeight, ReductiveGroups Layer 9 §9A and QuantumGroups Q8.").

**Claim:** Layer 2 §2.1 is consumed.

**Witness:** `README.md:125–126`, `:157–158`, `:239`, `:530`, `:701` cite KacMoody Layer 2 §2.1.

**Repair:** "KacMoody Layers 0, 1, 2 and 4".

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 0.1 datum, `reflect` | `B₂`, `d = (1,2)` and `(1,1)`; `A₁` | `d₁a₁₂ = −2 = d₂a₂₁`; `−2 ≠ −1`; `s(h) = −h`, wrong model `h + 2h = 3h` | holds |
| 0.3 `quantumLucas` (headline) | orders `N ∈ {1..10, 12, 14, 18}`, `m ∈ [−14, 14]`, `r ≤ 15`, exact in `𝔽_2521` | 6032 instances, both sides equal, 0 failures | holds |
| 0.2 criterion | `q = 0`, `±1`, `i` | `qFactorial 0 1 = 0`; `qInt (±1) 1 = 0`; `qInt i 2 = 0` | R10 |
| 1.0 form `B` | rank one `n = 2`; `θᵢθⱼ, θⱼθᵢ`; `B₂`, `q = 2` | `B(θ²,θ²) = 1 + qᵢ² = qᵢ[2]ᵢ`; Gram `[[1,χ],[χ,1]]`; `χ = 1/4`, determinant `15/16` | Checks hold |
| 1.0 Lean `freePairing`, `halfDeltaWord` | words `i :: w` | `B(θᵢw, z) = B(w, Lᵢz)`, `Lᵢ(θⱼz) = δᵢⱼz + χᵢⱼθⱼLᵢ(z)`; `r(θᵢw) = Σ θᵢw₁⊗w₂ + χ(i,|w₁|)w₁⊗θᵢw₂` | matches README |
| 1.0 Serre element in `J` | `aᵢⱼ = −1`, `d = 1` | `Lⱼ(S) = θᵢ²(1 + q⁻² − q⁻¹[2])/[2] = 0`; `Lᵢ(S) = θⱼθᵢ(1 − 1) + θᵢθⱼ(q − q) = 0` | holds |
| 1.0 `χ` and `χ⁻¹` radicals | degree `αᵢ + αⱼ`; general degree | both radicals nonzero iff `χ² = 1`; Gram for `χ⁻¹` is `c_ν⁻¹` times Gram for `χ` with one word reversed | equal |
| 1.1 presentation, commutator formula | `x = θⱼθₖ`; adjoint `A₁`, `q = 2` | both sides `Kᵢ(δᵢⱼFₖ + δᵢₖχᵢⱼFⱼ) − (δᵢⱼχᵢₖFₖ + δᵢₖFⱼ)Kᵢ⁻¹` over `qᵢ − qᵢ⁻¹`; `K_ϖE = 2EK_ϖ`, `K₁E = 4EK₁` | holds |
| 1.2 antipode (headline) | `Eᵢ` | `S(Eᵢ) + S(Kᵢ)Eᵢ = −Kᵢ⁻¹Eᵢ + Kᵢ⁻¹Eᵢ = 0 = ε(Eᵢ)` | holds |
| 1.3 triangular (headline) | empty `ι`, `Y = ℤ` | `f = K`, `U = K[Y]`, the map `K ⊗ K[Y] ⊗ K → U` is the identity | holds |
| 1.3a `J = I_S` (headline) | 7 rank-two Cartan matrices, 15 bidegrees (total `≤ 6`), random `v` in `GF(2¹²)`, `GF(3⁸)`, `GF(5⁵)`, `𝔽_(2⁶¹−1)` | `dim (T/I_S)_ν` = Gram rank = large-prime value in all 420 cases; `A₁^(1)`: `(1,1) ↦ 2`, `(2,1) ↦ 3`, `(3,3) ↦ 14` | no counterexample; R01 is the route |
| 1.3a Casimir | `A₁`; general | `f_C(n) − f_C(n−2) = 2n`, `f_C(n) = f_C(−n−2)`; two paths to `λ − αᵢ − αⱼ` differ by `2dᵢaᵢⱼ − 2dⱼaⱼᵢ = 0` | holds |
| 1.3a ring `R` | primes of `ℤ[v]`; `v ↦ 2` | height-two primes meet the inverted set; `2ⁿ − 1 ≠ 0` | principal ideal domain; R05 |
| 1.4 pairing | rank one; second axiom in degree 2 | `p(Eᵢ², Fᵢ²) = (1 + qᵢ⁻²)cᵢ²`; `r` for `χ⁻¹` is the `χ⁻¹`-twisted flip, middle term `(1 + q⁻²)` | holds |
| 1.5 cross rule | rank one, `a = E`, `b = F`; `B₂` | `cK⁻¹ + EF = FE + cK`; `⟨α₁, d₂h₂⟩ = −2 = ⟨α₂, d₁h₁⟩` | holds |
| 2.1 braid operators (headline) | rank one; `A₂` | `[T(E), T(F)] = FE − EF = T((K − K⁻¹)/(q − q⁻¹))`; `T₁(E₂) = E₁E₂ − q⁻¹E₂E₁` | holds |
| 2.2 root vectors | `B₂`, word `1212` | `α₁`, `s₁α₂ = 2α₁ + α₂`, `s₁s₂α₁ = α₁ + α₂`, `s₁s₂s₁α₂ = α₂` | each root once |
| 3.1 toral basis | one-dimensional torus | `C_n(±1) = 0` for `n > 0`, so `f(−1) = −f(1)` on the `ε = ±1` family | Check holds |
| 3.2, 3.3 | `v = i`; weight `−1`, `m = 2` | `[2]_i = 0`, `E² = 0 ≠ E^(2)`; `binom(−1, 2) = 1` | hold |
| 4.1 | `A₁`, `λ = 2ω` | `E b₁ = [K; 0 choose 1] b₀ = [2]_v b₀` | holds |
| 5.1, 5.2 | `G₂`, `L = 3`; weight `Lk` | `ℓ = (3,1)`, `a*₁₂ = −1`, `a*₂₁ = −3`, `d₁*a*₁₂ = −9 = d₂*a*₂₁`; `[Lk choose L]_ζ = k` (Lucas rows above) | hold |
| 5.3 `Ψ` against `Fr` | `A₁`, `L = 2`, `ζ = i` | `−e1_λ` against `+e1_λ` | R11 |
| 5.4 sequences | `B₂`, `𝓁 = 4`; `G₂`, `𝓁 = 9` | `𝓁ᵢ = (2, 1)`, Lentner line 1130; `𝓁ᵢ = (9, 3)`, line 1135 | hold |
| 6.1 | `A₁`, `L = 3`, `λ = 3ω` | `dim Δ = 4`, head `Fr^*L(ω)` of dimension 2; `[K; 0 choose 3]` acts by `binom(1,1) = 1`, `K` by `1` | holds; locator R12 |
| 8.1 quantum plane | `xy − vyx`, `y²` | `E`: `vx² − vx² = 0`; `F`: `vy² − vy² = 0`; `E(y²) = (v + v⁻¹)yx` | holds |
| `qInt` against the library (R02) | `r ∈ ℕ` | `(q^r − (q^r)⁻¹)/(q − q⁻¹)` on both sides, also at `q = ±1, 0` | same function |
| Rank-one map (R03) | relation `KE = qᵢ²EK` | `KᵢEᵢ = q^⟨αᵢ,dᵢhᵢ⟩EᵢKᵢ = q^(2dᵢ)EᵢKᵢ` | statable, elaborates |

- Previous review (of the roadmap's first pull request at d8e092b): R01 partly repaired (the companion file is gone; its matrices are now `Suggested.lean:577–682`, R08); R02 not repaired (`README.md:1091–1092`, R11); R03 not repaired (`README.md:1199`, R12).
- Gate at 4f34e39, rerun here: `statement-hygiene=1`, `readme-ids-missing=2`, every other check 0, `FAIL` (R06, R07). Changes outside the folder: none.
- Elaboration of `Suggested.lean` at the pins: 22 `declaration uses sorry` warnings and nothing else. One-tactic probe (`rfl`, `simp`, `infer_instance`, `norm_num`, `exact?`) on all 22: none closes. `#check @` on the three changed signatures of the repair copy: binders as written; of the seven flagged declarations only the `[CharZero k]` on `specializedComparison` is a dropped binder, inside the section R08 deletes.
- Dependency check: `depcheck: 245 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. All six supplier roadmaps are on main.
- Cross-roadmap citations resolved on main (2248bbb): KacMoody §0.1, §§0.2–0.3, §1.4, §2.1, §4.1, §4.3, §4.4 (`README.md:214, 236, 272, 408, 484, 710, 761, 777`); QuantumGroups Q8 (lines 68–76, 207–209); HopfologicalAlgebra §7.3 (line 728). Pinned declarations opened: Mathlib `Algebra/FreeAlgebra.lean:451`, `RingTheory/Bialgebra/Basic.lean:180`, `RingTheory/Binomial.lean:386, 441`, `Algebra/Polynomial/Laurent.lean:532`, `LinearAlgebra/BilinearForm/TensorProduct.lean:122`; Tau Ceti `Kostant/Form.lean:125`, `Kostant/HopfAlgebra.lean:299`, `Kostant/Comultiplication.lean:232, 252`, `Kostant/Weight/Basis.lean:224, 255`, and the `QuantumGroups` locations of R02–R03.
- Overlap check: read KacMoody, ReductiveGroups, HopfologicalAlgebra, SpringerResolutionAndCharacteristicCycles; the bicharacter-braided ambient: owner HopfologicalAlgebra (R04); the quantum Casimir: owned here, named for KacMoody, Part II on main (see the last section); nothing else shared.
- Source locators checked against the text: 47 in 8 sources (McGerty2006 lines 76–108, 176, 208–218, 278, 332–343; Lentner2014 104–114, 192, 425–436, 462–480, 515, 549, 1100–1137, 1162; LusztigJAMS1990 1098, 1204, 1495–1520; AndersenPoloWen1991 457, 500; AndersenWen1992 129, 206; GrosKaneda2013 28–34, 57–84, 1724, 1845; HeckenbergerDoubles2010 821, 866, 898, 1039, 1054, 1104, 1167, 1178, 1184, 1556, 1578, 2259; Tanisaki2016 19, 296, 308, 372, 420, 525, 666–696, 712, 749, 814, 828). The sources service recorded a `Tanisaki2016` entry in the board manifest when it fetched the text.
- Source independence: 9 passages compared with 6 sources, none shared beyond formulas and the two-condition list of McGerty2006 lines 338–339; largest share McGerty2006, 21 of 85 locators; contents compared with McGerty2006: independent.

## Not verifiable

- Lusztig1993 (uncertified): §1.2, §3.1, §6.1, §14.2, §33.1 with Theorem 33.1.3, Chapters 5, 34, 35, 37–39, 41, Lemma 38.1.2, Proposition 38.2.1 are cited by locator only; that §14.2's freeness rests on the canonical basis (R05) is from the reviewer's knowledge, not from a text.
- Lusztig1990 (uncertified): Theorem 8.10 read only through GrosKaneda2013 line 33 and Lentner2014 line 1102.
- Kassel1995 (uncertified): Chapter VII §3 for 8.1, by locator only.
- Heckenberger–Kolb (arXiv math/0605460) was read for R01 (lines 379–389); the book of Joseph it relies on (§4.1.17) was not read.
- AndersenPoloWen1991 and AndersenWen1992 are OCR of scans: statements legible at the cited lines, formulas inside proofs not relied on.
- Ownership against open pull requests was checked through `roadmaps grep` and the three closest-roadmap lists only.

## Source issues

- **Misprint** in McGerty2006 at §2, the definition of the form on the free algebra, printed p. 2 (line 90): the source says the norm of a generator is the inverse of one minus the square of `vᵢ`; it should be the inverse of one minus the inverse square, as in Lusztig1993 §1.2.3; affects nothing.

## For the human reviewers

- **Ownership.** After this merge, main's `TauCetiRoadmap/KacMoody/README.md:52–54` still names KacMoody, Part II as the home of "the quantum Casimir", while `README.md:29–30` here owns it; the description leaves that line to a separate change.

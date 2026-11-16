# Review of MotivicStructuresInModuliOfCurves (pull request #2437 at 94458b3)

**Verdict:** needs changes

## R01 (P2) — Statable headline absent: the genus-four point counts

**Location:** `TauCetiRoadmap/MotivicStructuresInModuliOfCurves/Suggested.lean:36–44`: "None of these is statable at the pins … the point counts need the groupoid of rational points of a stack over a finite field".

**Claim:** The groupoid of `𝔽_q`-points of `M̄_{g,n}` is the groupoid of stable `n`-pointed genus-`g` curves over `Spec 𝔽_q`, and the pinned Tau Ceti expresses it. So the count half of the headline "`M̄_{4,n}` has polynomial point count" (README §9.5; BFP, Theorem 1.4) can be stated at the pins and is missing.

**Witness:** `TauCeti.AlgebraicGeometry.PointedPrestableFamily` (`Curves/PointedPrestable/Basic.lean:68`, category at `Category.lean:107`), `PrestableMap.infinitesimalAut` (`Curves/StableMaps/Automorphism.lean:321`) and `Scheme.genus` (`Cohomology/Genus.lean:64`). The block below elaborates under `module`, with `sorry` as its only warning.

**Repair:** Add the following to `Suggested.lean` (tested as written):

```lean
import TauCeti.AlgebraicGeometry.Curves.StableMaps.Automorphism
import TauCeti.AlgebraicGeometry.Cohomology.Genus

open CategoryTheory AlgebraicGeometry TauCeti.AlgebraicGeometry

universe u

/-- A pointed prestable curve over a field is stable of genus `g` when its constant prestable map
to the point has no infinitesimal automorphisms and `dim_k H¹(C, 𝒪_C) = g`. -/
def IsStableOfGenus (k : Type u) [Field k] (g : ℕ) {n : ℕ}
    (P : PointedPrestableFamily (Spec (.of k)) n) : Prop :=
  (PrestableMap.const (q := 𝟙 (Spec (.of k))) P (𝟙 _) (by simp)).infinitesimalAut = ⊥ ∧
    ∃ _ : FiniteDimensional k
        (Scheme.Modules.Cohomology (InvertibleSheaf.trivial P.total).obj 1),
      P.total.genus k = g

/-- Isomorphism of stable pointed curves over `k`. -/
def isoSetoid (k : Type u) [Field k] (g n : ℕ) :
    Setoid {P : PointedPrestableFamily (Spec (.of k)) n // IsStableOfGenus k g P} where
  r P Q := Nonempty (P.1 ≅ Q.1)
  iseqv := ⟨fun _ ↦ ⟨Iso.refl _⟩, fun ⟨e⟩ ↦ ⟨e.symm⟩, fun ⟨e⟩ ⟨f⟩ ↦ ⟨e ≪≫ f⟩⟩

/-- The groupoid mass `Σ 1/#Aut(C)` of stable `n`-pointed genus-`g` curves over `k`. -/
noncomputable def stableMass (k : Type u) [Field k] (g n : ℕ) : ℚ :=
  ∑ᶠ x : Quotient (isoSetoid k g n), ((Nat.card (Aut (Quotient.out x).1) : ℚ))⁻¹

/-- BFP, Theorem 1.4 at `n = 0` (README §9.5). -/
theorem stableMass_genus_four_zero (k : Type) [Field k] [Fintype k] :
    stableMass k 4 0 =
      (fun q : ℚ ↦ 1 + 4 * q + 13 * q ^ 2 + 32 * q ^ 3 + 50 * q ^ 4 + 50 * q ^ 5 + 32 * q ^ 6
        + 13 * q ^ 7 + 4 * q ^ 8 + q ^ 9) (Fintype.card k) := by
  sorry
```

Do the same for `n = 1, 2, 3` with the §9.5 polynomials. Name `stableMass` in README §9.5. In the docstring, replace "None of these is statable" and the clause about point counts with: "The point counts of `M̄_{4,n}` are stated below through `stableMass`; the cohomological, Chow and Chow–Künneth headlines are not statable, for the reasons that follow."

## R02 (P2) — Wording of Canning–Larson taken over in §5.4

**Location:** `TauCetiRoadmap/MotivicStructuresInModuliOfCurves/README.md:842`: "through Belorousski's divisors, each isomorphic to an open substack of `M_{1,n−1}`, whose complement is the image under a proper map of an open subset of a product of projective spaces".

**Claim:** This clause reproduces the source's wording and follows its two numbered conditions clause by clause.

**Witness:** canning-larson lines 1049–1052 share 17 consecutive words with it ("…is the image under a proper map of an open subset of a product of projective spaces"), after "isomorphic to an open subset of `M_{1,n−1}`".

**Repair:** Replace the clause with: "through Belorousski's divisors: each one is identified with an open substack of `M_{1,n−1}`, and outside their union `M_{1,n}` is covered by a proper morphism whose source is open in a product of projective spaces (Canning–Larson, §5.2, pp. 16–17)".

## R03 (P3) — Layers 5 and 6 depend on each other

**Location:** `TauCetiRoadmap/MotivicStructuresInModuliOfCurves/README.md:844`, §5.4 *Needs:* "§§6.3 and 6.5 (the tetragonal Hurwitz stack and its tautological pushforwards, for genera five and six)"; also `README.md:860`.

**Claim:** §5.4 needs targets of the later Layer 6, and Layer 6 (§§6.2, 6.6–6.8) needs §§5.2 and 5.4. That is a coarse cycle between the layers.

**Witness:** `README.md:860`, Layer 5 Dependencies: "Layer 6, §§6.3 and 6.5". `README.md:890`, §6.2 *Needs:* "§§5.1–5.2, 5.4". `README.md:990`, Layer 6 Dependencies: "Layers 0 and 5".

**Repair:**
- Move the genus-five (`n ≤ 7`) and genus-six (`n ≤ 5`) clauses of §5.4 into a new target placed after §6.5. That includes the route paragraph "Genera five and six …", the plane-quintic step and the Checks on `c(5)`, `c(6)` and `17 − 2g`.
- Have §§10.2, 10.4, 10.9, 12.1, 12.2 and 12.7 cite the new target alongside §5.4.
- Delete "Layer 6, §§6.3 and 6.5" from Layer 5's Dependencies, and delete the matching sentence in "How to read the build".

After the move, Layer 5 needs only Layer 0, and Layer 6 needs Layers 0 and 5.

## R04 (P3) — Targets that need later targets (§2.5; §§9.4–9.6)

**Location:** `TauCetiRoadmap/MotivicStructuresInModuliOfCurves/README.md:448`, §2.5 *Needs:* "§§2.3, 2.4, 2.6"; `README.md:1370`, §9.4 *Needs:* "§§9.6, 9.9 for the smaller genus-four pairs".

**Claim:** §2.5 uses the later §2.6. §9.4 uses the later §9.6, while §9.6 uses §9.4, so §§9.4 and 9.6 form a cycle at the level of targets.

**Witness:** `README.md:1407`, §9.6 *Needs:* "§§9.4–9.5". §9.6 is the difference of §9.5 and §9.4, and §9.4's route uses the open counts at fewer markings.

**Repair:**
- §2.5: add the hypothesis "and `H^q(M̄_{0,n}) = 0` for every odd `q ≤ k` and every `n ≥ 3`". Delete §2.6 from its *Needs:* and its route, and add §2.6 to the *Needs:* of §§2.8 and 9.8; §§2.7 and 2.9 already list it.
- §§9.4–9.6: merge them into one target, "boundary, compact and open counts of `M̄_{4,n}` and `M_{4,n}`, proved for `n = 0, 1, 2, 3` in turn", in the order §9.4's route already gives. Its conclusion is the three tables, and its *Needs:* are §§1.4–1.6, 8.3, 8.6, 8.9–8.11, 8.13 and 9.1. Drop §9.9 from it: no `S₂`-equivariant genus-four input enters (bfp lines 1336–1340).

## R05 (P3) — Locator: the equivariant input ranges in §1.6

**Location:** `TauCetiRoadmap/MotivicStructuresInModuliOfCurves/README.md:374`: "BFP §9, p. 1353, for the equivariant ranges `g′ ≤ 3`, `(g′, n′) ≺ (4, 3)`".

**Claim:** The cited statement is not on p. 1353.

**Witness:** bfp lines 1324–1327, on printed p. 1354 (page 32 of the text), say that the equivariant input for `1 ≤ g′ ≤ 3`, `(g′, n′) ≺ (4, 3)`, is in the literature. P. 1353 (bfp lines 1270–1305) does not say so.

**Repair:** Replace with "BFP, §9.3, proof of Proposition 9.6, p. 1354".

## R06 (P3) — Pull request description: dangling list, empty Lean file unstated, consumers not named

**Location:** The pull request description, prose paragraphs one and two: "The end theorems are:" (nothing follows); "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti"; and, in the summary block, "Its named consumers are roadmaps on …".

**Claim:** The list of end theorems is missing. The text does not say that `Suggested.lean` declares nothing. The README names no consumer roadmap.

**Witness:** `Suggested.lean:49–51` contains only `namespace`/`end`. `README.md:1922` reads "Its natural consumers are roadmaps on …", with no roadmap named.

**Repair:**
- Replace "The end theorems are:" with "The end theorems are those listed in the README's **Summary**."
- Replace the Lean sentence with "`Suggested.lean` states the genus-four point counts; its docstring lists the other headline theorems and the carrier each lacks at the pins". Before R01 is applied, write instead "declares no theorem".
- Replace "Its named consumers" with "Its intended consumers".

## Verified sound

| Target | Instances tried | Values computed (roadmap ↔ source/library) | Result | Change |
| --- | --- | --- | --- | --- |
| §1.6 low-genus counts | `M̄_{0,5}`, `M̄_{1,1}`, `(1,11)` | `q²+5q+1 = (q+1)²+3q`; `q+1`; `H¹¹(M̄_{1,11})` rank 2, `τ(p)` not polynomial; bfp lines 256–257 give ranges 10/7/5 | holds | R05 (page) |
| §3.3 even genus one | `n = 1, 2` | `deg ψ₁ = 1/24 = (1/12)(1/2)`; `b₂(M̄_{1,2}) = 2 = #{δ_irr, δ_{0,{1,2}}}`; petersen-genus-one line 184 | holds | none |
| §4.6 odd-marking reduction | `(n,k) = (11,13), (13,15), (21,24), (1,24)` | odd `k` gives `T = 0`; first nonzero: `11+12 = 23 = n+2` at `n = 21`; `n = 1`: 3 flags < 22; clp lines 433–440 printed for all `k` | holds | none |
| §4.12 top-heaviness | `M̄_{0,3}`, `M̄_{0,4}`, `M̄_{1,12}`, `k = 11` | `a⁰ = id`; `a: ℚ ≅ ℚ`; `a: H¹¹ → H¹³`, `22 = 22`; clp lines 106–109 | holds | none |
| §6.8 tetragonal locus | `n = 0…3`; `n = 4` | `E`: (3,3,4), (2,4,4), (2,3,5), each sum `10 = g+3`; `F`: (5,5), (4,6); `n = 4` excluded; clp lines 672, 688, 726 | holds | none |
| §7.1 `BP` | dimensions; unipotent radical | `45 − (25+10) = 10`; `(u,u′) ↦ (u+Bu′,u′)` leaves no `P`-stable complement to `U`; clp line 738 | holds | none |
| §7.3 Mukai model | centre; `n = 0` | `Z(Spin₁₀) = μ₄` acts on `S⁺` by `i`, trivially on `Gr(7,S⁺)`; `[Gr/SO₁₀]` gives generic `μ₂`; clp lines 852–856 | holds | none |
| §8.1 binary forms | `g = 4`, `q = 5`; parity of `g` | `#G = 24·20 = 480`; `4(5¹⁰−5⁸) = 37500000 = 480·78125`; AV Prop. 4.4(a)/(b) with `d = g+1` | holds | none |
| §8.6 quadric count | `q = 2`; `n = 0` | `#Aut = 48, 120, 72`, all nonzero; `q⁸ + (q⁹−q⁶) + q⁷ = #M₄`; bfp lines 559–562 | holds | none |
| §8.7 nonreduced fibres | cone, nsp, spl | `ℙ¹`: `1−(q+1)t+qt²` = bfp line 719; Betti sums 2, 4, 5 = bfp lines 716, 740, 749 | holds | none |
| §8.9 cone quotients | `n = 1, 2, 3` | sum of the bfp Prop. 8.2 terms (lines 795–806) = quotient × `q⁴(q−1)²(q+1)`, difference 0 | holds | none |
| §3.6 Getzler multiplicities | `n = 12…15` | recomputed `[11,11]`, `[66,429,66]`, `[286,6006,6006,286]`, `[1001,53053,186263,53053,1001]`, `S₁₆`: 1; getzler line 640 prints a non-palindromic `n = 14` row | holds | none |
| §10.2 `H⁴` | `k = 4` seed region | `g′ < 7`, `n′ ≤ 4` lie inside `c = 10,10,11,11,7,5`; `(6,4)`: `4 ≤ 5`; clp lines 956–959 | holds | none |
| §10.4 even homology ≤ 14 | `g = 3…8` | `n ≤ 10, 8, 6, 4, 2` vs `c(g) = 11, 11, 7, 5, 3`; `g = 8`: `16 > 14`; clp line 979 prints "k ≥ 14" | holds | none |
| §11.2 decorated graphs | `(1,12)` with `c = 1`; two edges | degree `11 + 2(e+c)`: 13 and 15; clp lines 1044–1048 count edges only | holds | none |
| §11.9 `H¹⁵(M̄_{2,12})` | image of dimension 11, 55 or 66 | `825+11 = 836`; `825+55 = 880 > 836`; `891 > 836`; `Ind_{S₁₀×S₂}` has dimension `66 = 11+55` | holds | none |
| §12.7 weight-15 injectivity | `(8,0), (8,1), (7,3), (6,5), (5,7), (4,9), (3,11)` | `2g = 16 > 15`; `2g−2+n = 15` with `n ≤ c(g) = 3, 5, 7, 11, 11`; clp lines 1183–1184 | holds | none |
| Headline §9.8 | `k = 9` base region; `(1,11)` | `(4, n ≤ 3)` from `max(8, 6+n) ≤ 9`; `dim H¹¹(M̄_{1,11}) = 2` | holds | none |
| Headline §§9.5/9.7 | rows `n = 0…3`; `q = 2`; `q = 1` | `#M̄₄(𝔽₂) = 7965`; closed − boundary equals the §9.6 rows exactly; open `n = 3` at `q = 1` gives `−10` | holds | R01 |
| Headline §§4.9/4.11 | `k = 0, 1, 4, 11` | `k = 0`: empty region, `H⁰ = RH⁰`; `k = 1`: seeds zero; `k = 4`: `g′ ≤ 6`; `(1,11,11)` in region | holds | none |
| Headline §§10.2–10.4 | `k = 6` bound | `6 ≤ (2g−2)/3` iff `g ≥ 10`; rows above | holds | none |
| Headline §§12.1–12.2 | base cases, `k = 13, 15` | genus 2: `n ≤ 11 > c(2)` gives `(2,11)`; genus 1: `n ≤ 13`; `2g−2+n ≤ 15` stops genus two at `n ≤ 13` | holds | none |
| Headline §7.7 | `n = 0`; `n = 4` | `π_*(ψ₁·π^*α) = κ₀α = 12α`; `n = 4` claimed only for `M°_{7,4}` | holds | none |
| Headline §12.9 | `(1,12)`, `(1,15)`, `(2,12)` | `11·LS₁₂`; `S₁₆ ⊂ H¹⁵(M̄_{1,15})`, so `g ≥ 2` is needed; `836·L²S₁₂` | holds | none |
| Headline §12.10 | `n = 11`, `d = 17` | genus-one factors have ≤ 12 flags, while `S₁₆` needs 15; `H¹¹⊗H¹¹` needs 22 flags | holds | none |
| §5.4 known ranges | `c(5)`, `c(6)` | needs §§6.3, 6.5 of Layer 6, while §6.2 needs §5.4 | cycle | R03 |
| §2.5, §9.4 | order of targets | §2.5 needs the later §2.6; §9.4(n) needs §9.6(n′<n), and §9.6 needs §9.4 | cycle | R04 |

- Locators checked against the text: the 15 sampled targets, plus 25 correction claims of the README: clp 11, bfp 8, getzler, gorsky 2, kannan, clp-h11 and canning-larson-genus-seven. All the corrections are confirmed; the one locator slip is R05.
- Library declarations opened at the pins: 22. Examples: `CuspForm.discriminantEquiv` (`LevelOne/DimensionFormula.lean:65`), `quadraticChar_sum_zero` (`QuadraticChar/Basic.lean:239`), `TauCeti.finrank_spinPlus` (`Spin/Dimension.lean:73`), `IsQuotientCoveringMap.singularCohomologyIsoGroupCohomology` (`GroupCohomology.lean:248`), `CategoryTheory.Pseudofunctor.IsStack` (`Sites/Descent/IsStack.lean:49`).
- Cross-roadmap citations: 81 cited sections in 20 roadmaps resolved, on main or at the open heads. StableReductionPartII §5.15 contains the Vistoli–Edidin–Graham comparison, and §7.11 assigns the tautological rings to this roadmap.
- Gaps: the 9 slugs are identical in `design/plan.json` and the README. WeilConjectures §1.8 has proper duality only, DeligneWeightsAndPurity §9.6 has hard Lefschetz for schemes only, and StableReductionPartII §4.14 has unpointed projectivity only, so no gap asks for something already supplied.
- Gate: every check 0, `OK`. Dependency check: `depcheck: 250 roadmaps, 2380 edges, 0 problem(s)`, with no UPWARD or CYCLE line. No change outside the folder.
- Elaboration: `lake env lean Suggested.lean` exits 0 with no message. The file has no declarations, so there was nothing to compare with `#check`. The R01 block elaborates with `sorry` as its only warning.
- Recomputed: the §9.9 Schur sums against §§9.5–9.6; the §§8.8, 8.10, 8.11 inverse-zeta values and quotient expansions; the §§8.11 and 8.14 cross-checks against §§9.6 and 9.9.
- Ownership against open pull requests was checked with `roadmaps grep` for Harer, Madsen–Weiss, Casnati–Ekedahl, Mukai, Getzler–Kapranov, Keel, the Arf invariant and the cohomology of `A₂` local systems. No second owner was found; SiegelModularForms explicitly excludes `A₂` local systems.

Overlap check: I read StableReductionPartII, AlgebraicGromovWittenTheory, WeilConjectures, CanonicalModelsAndGonality and CountingBundlesAndHallAlgebrasOfCurves (open), and EquivariantIntersectionTheory, StableReduction and AnalyticStableMaps (main). Each shared object is owned by the supplier and cited here:
- pointed stacks, clutching, cotangent lines and the Hodge bundle: StableReductionPartII §§0.4, 3.1–3.3, 5.1, 7.11;
- stack mass, twists and the sieve: WeilConjectures WC.1, WC.5;
- the hyperelliptic presentation: EquivariantIntersectionTheory §3.3 (§8.1 extends it over `ℤ[1/2]`);
- dual graphs: StableReduction Layer 1;
- gonality, Noether's theorem and the genus-four canonical ideal: CanonicalModelsAndGonality §§3.4, 3.9, 5.4, 9.1.

Nothing is shared with the other three.

Source independence: I compared 40 passages with 25 sources: an 8-word-run scan of the whole README, and the 15 sampled locators read side by side. One run of 17 words is shared (R02); the others are titles or forced phrases of at most 14 words. The largest share is clp, about 100 of 240 locators. Contents compared with clp: Layers 4, 5, 6–7, 10, 11 and 12 take up CLP §§2–3, 4, 5, 6, 7 and 8 in that order. The *Needs:* lines force this order (§6.2←§5.4, §10.4←§7.7, §11.1←§10.9, §12.1←§11.10), and the scopes differ: §5 is split into two layers, Layer 10 adds CLP-H11, and the BFP-, Getzler- and Petersen-based Layers 1–3 and 8–9 are interleaved. Result: independent.

## Not verifiable

- harer: settled as uncertified; Harer's virtual cohomological dimension theorem was checked only as recalled in bfp lines 218–231.
- mukai: settled as uncertified; the genus-seven linear-section theorem was read only as recalled in clp lines 833–906.

## Source issues

- **Error** in clp at Lemma 2.1, hypothesis (2.2), pp. 4–5: the source says only smaller triples with `k′ ≤ k − 2` are needed; it should also require same-degree triples with fewer markings, which the proof uses (counterexample `RH*`, `(1,12,11)`); affects a stated result.
- **Gap** in clp at the sentence before Corollary 2.7, p. 7: the source says Lemma 2.1 applied to `RH*` gives the corollary; it should note that the hypothesis fails at `(1,11,11)`, where the quotient is `S₁₂`; affects the proof.
- **Gap** in clp at the proof of Lemma 3.2, p. 10: the source says every boundary class lies in the generated extension; it should treat separating classes with two odd genus-one factors, which are open for even `k ≥ 24`; affects the proof.
- **Misprint** in clp at §5.3.1, before Lemma 5.8, p. 18: the source says the pulled-back quadratic bundle is `U ⊕ U^∨`; it should be an extension `0 → U → V → U^∨ → 0`, split only over `GL₅`; affects nothing.
- **Gap** in clp at the proof of Lemma 5.10, p. 19: the source says a trivialisation of the vector bundle splits the orthogonal Grassmann bundle; a trivialisation of the bundle does not trivialise the quadratic form, so the structure group should be reduced to the parabolic; affects the proof.
- **Error** in clp at equations (5.10)–(5.11), p. 20: the source says the half-spin representation is an `SO₁₀`-bundle and identifies the quotient by `SO₁₀` with `M°₇`; it should use `Spin₁₀` and the effective quotient by `PSO₁₀`; affects the proof.
- **Misprint** in clp at the proof of Theorem 1.5(3), §6.2, p. 23: the source says even `k ≥ 14`; it should be even `k ≤ 14`; affects nothing.
- **Misprint** in clp at the proof of Lemma 7.3, p. 27: the source says the sign character is induced from `S₁₀`; it should be from `S₁₀ × S₂`, of dimension 66; affects nothing.
- **Misprint** in clp before Lemma 7.10, p. 27: the source cites Lemma 3.2(a); it should be Lemma 3.2, which has no parts; affects nothing.
- **Gap** in clp at the proof of Lemma 8.2, p. 28: the source uses only `2g − 2 + n > 15`; it should add `2g > 15` for `n ≤ 1`, since `(8,0)` and `(8,1)` lie outside Table 1; affects the proof.
- **Gap** in clp at the Introduction, p. 3: the source says STE dimensions are unimodal in each parity; hard Lefschetz should be credited only with the increase up to the middle; affects a stated result.
- **Misprint** in bfp at Corollary 3.2, p. 1330: the source says `H^k(M̄_{g,n}) = 0`; it should be `H^k(M̄_{4,n}) = 0`; affects nothing.
- **Misprint** in bfp at the proof of Proposition 3.1, p. 1330: the source says the error is `o(p^{md/2})`; it should be `o(p^{ms/2})`; affects nothing.
- **Misprint** in bfp at Remark 2.2, p. 1328: the source cites Proposition 2; it should be Proposition 2.1; affects nothing.
- **Misprint** in bfp at the opening of §9, p. 1351: the source cites [GK98, Th. 8.3]; it should be Th. 8.13; affects nothing.
- **Error** in bfp at equation (3), p. 1331: the source says the `E₁` terms are plain graph invariants; it should twist by `det E(G)`, which kills the two-edge stratum of `M̄_{1,2}`; affects the proof.
- **Gap** in bfp at §9.1, p. 1351: the source says the trace of `σF_q` on `H^•_ét` equals `#X^σ(𝔽_q)` for any variety; it should use compact supports for nonproper `X`; affects nothing.
- **Gap** in bfp at Definition 9.1, p. 1351: the source says every twisted count defines a representation-ring element; it should say a class function, virtual only under further hypotheses (`Spec 𝔽_{q³}`, `C₃`); affects nothing.
- **Misprint** in bfp at §10.1, p. 1355: the source attaches the coefficient `−11` to `q⁴`; it should be `q³`, as in Theorem 1.5; affects nothing.
- **Misprint** in getzler-semiclassical at the final table, row `n = 14`, p. 491: the source says `−(286L³ + 6006L² + 286L)S₁₂`; it should be `−(286L³ + 6006L² + 6006L + 286)S₁₂`; affects nothing.
- **Misprint** in gorsky at Theorem 3.8, p. 6: the source says `h = ½(1 − Σ_{j=1}^{r} k_j)`; it should be `h = 1 − ½Σ_{j=1}^{r} k_j`, as equation (3) gives; affects nothing.
- **Misprint** in gorsky at Definition 3.5, p. 5: the source says `(x_i, k) = λ_i`; it should be `(x_i, r) = λ_i`; affects nothing.
- **Error** in kannan at Remark 3.8, pp. 11–12: the source says the corrected genus sums `k_i` to `r − 1`; it should sum to `r`, since the identity in genus four must give `h = 4`; affects nothing.
- **Error** in clp-h11 at Corollary 2.5, p. 7: the source says the restriction to the divisors `D_B`, `|B| = 10`, is injective for every `n`; it should require `n ≥ 12`, since at `n = 11` no `D_B` exists; affects nothing.
- **Error** in canning-larson-genus-seven at Remark 2.3, pp. 6–7: the source says covers of a fixed `ℙ¹` form a scheme; bielliptic genus-seven covers have automorphisms over `ℙ¹`, so it is a stack; affects nothing.

## For the human reviewers

- none

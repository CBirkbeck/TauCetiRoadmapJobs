<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/142#issuecomment-6327771543 -->
Red team round 1 pass a (codex) of 4ad50d0

Verdict: needs_changes

1. **F01** (P3) Computational algorithms are deliverables

   **Location:** `packages/FunctionFieldArithmetic/README.md:475`, `:1693`, `:1732`; `packages/FunctionFieldArithmetic/Suggested.lean:242`, `:263`. “there is a terminating procedure returning”

   **Claim:** Sections 1.3, 5.8 and 5.9 require executable basis construction, place enumeration, ray-group computation, termination and complexity bounds.

   **Witness:** README lines 480–504, 1696–1717 and 1735–1758 explicitly require procedures and operation-cost bounds. The binding contract excludes computational algorithms.

   **Exact repair text:** Delete §§1.3, 5.8 and 5.9 and their algorithm-name entries in Suggested.lean. Replace §5.6's final Check sentence with: “The counts must be proved to equal the point counts of the specified curve.” Replace the algorithm-dependent sentences in §5.6 and the scope/dependency lists with references to §§1.1–1.2, 4.5 and 5.1. Retain the mathematical existence, basis, finite-ray-group and count identities in those sections.

2. **F02** (P1) Foundation contracts cite obsolete sections and target identifiers

   **Location:** `packages/FunctionFieldArithmetic/README.md:229`. “SF.3c, targets T353–T356”; “SF.3d T359”; “SF.1 T159–T160”.

   **Claim:** These current supplier sections and targets provide ordinary Picard objects, high-degree Abel maps and fpqc descent.

   **Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4905` has §3.6; `:4937` has §3.7; `:2071` has §1.1. None of SF.3c, SF.3d, T353–T356, T359 or T159–T160 occurs there.

   **Exact repair text:** Replace the contracts by: “SchemeAndStackFoundations §3.6 (`picardComponent`, `picardComponent_torsor`, `picardComponent_point_iff`) supplies the ordinary Picard components and torsors, using JacobianChallenge Layer D for representability and the Picard–Brauer obstruction. SchemeAndStackFoundations §3.7 `abelMaps_highDegree` supplies the ordinary high-degree Abel map, including Brauer–Severi descent. SchemeAndStackFoundations §1.1 supplies quasi-coherent module descent; ModularCurves Layer 0E supplies effective descent of affine schemes.” Replace all SF.3b/SF.3c/SF.3d references by §§3.3/3.6/3.7, SF.2 Hilbert–90/Kummer by §2.11, and SF.5's Weil-bound citation by §5.11. Remove obsolete T-identifiers throughout.

3. **F03** (P3) The Artin–Schreier point-count Check omits its constant field

   **Location:** `packages/FunctionFieldArithmetic/README.md:792`. “For `p = 3`, `m = 2` … the model has exactly `4` rational points”.

   **Claim:** In §3.3's arbitrary finite characteristic-three constant field, these parameters determine four rational points.

   **Witness:** Take `k = 𝔽₉`. Writing `x=1/t`, direct enumeration over `𝔽₉=𝔽₃[i]/(i²+1)` gives fifteen affine solutions of `y³−y=x²`, plus one point at infinity: sixteen, not four.

   **Exact repair text:** Replace “For `p = 3`, `m = 2`” by “For `k = 𝔽₃`, `m = 2`”. Add: “Over `𝔽₉` the same curve has sixteen rational points; the genus and local conductor remain unchanged.”

4. **F04** (P1) The stated dependency graph contains forward and reverse edges

   **Location:** `packages/FunctionFieldArithmetic/README.md:102`, `:1068`, `:1847`, `:1949`, `:2005`. “once the common finite support of 6.4 is used”.

   **Claim:** The roadmap has a single prerequisite order, and the named earlier suppliers only feed it.

   **Witness:** §6.3 base change uses §6.4, whose Needs includes §6.3. §4.5 needs all of Layer 4. Lines 102 and 1847–1849 explicitly make earlier suppliers consume this roadmap.

   **Exact repair text:** Move `cuspFunctions_baseChange` immediately after §6.4, with Needs restricted to the definitions in §6.3 and the finite-support theorem in §6.4. Replace §4.5's “Layers 0.1–0.2, 2 and 3–4” by “§§0.1–0.2, 2.1–2.2, 3.1–3.2 and 4.1–4.4”. Remove the claimed return supplies to DeligneWeightsAndPurity §3.7, AutomorphicLFunctionsAndLocalFactors AL.3 and AutomorphicSpectralTheory. Move any statements actually needed by those earlier roadmaps to their earliest owner, then replace the local target by a comparison/import of that owner's named target. In particular, the per-degree estimate must precede DeligneWeightsAndPurity's use of it, and the function-space inputs must precede the AL.3 Fourier theorems used by §6.7.

   The reverse supplier edges are stated in this package; the absent supplier checkouts prevent confirming whether their current texts still contain those edges. The internal §6.3/§6.4 cycle is directly verifiable.

5. **F05** (P2) An easy Euler-product headline is incorrectly omitted from Lean

   **Location:** `packages/FunctionFieldArithmetic/Suggested.lean:236`, `:261`; `packages/FunctionFieldArithmetic/README.md:1456`. “need carriers that the pinned libraries do not provide”.

   **Claim:** `zeta_eulerProduct` cannot be stated at the pins.

   **Witness:** `Mathlib/RingTheory/PowerSeries/Inverse.lean:82` defines `PowerSeries.invOfUnit`; `Mathlib/RingTheory/PowerSeries/PiTopology.lean:80` supplies the coefficient topology. `Place.degree`, `HasProd` and this file's `zeta` already exist.

   **Exact repair text:** Add the following headline in the Layer 5 section and remove it from the unavailable-carrier list:

   ```lean
   open scoped PowerSeries.WithPiTopology

   /-- The divisor zeta series is the coefficientwise convergent product
   of the geometric series associated to all places (README 5.1). -/
   theorem zeta_eulerProduct [Finite k] (hF : IsFunctionField k F)
       (hk : IsIntegrallyClosedIn k F) :
       HasProd (fun v : Place k F =>
         PowerSeries.invOfUnit
           (1 - (PowerSeries.X : PowerSeries ℤ) ^ v.degree) (1 : ℤˣ))
         (zeta k F) := by
     sorry
   ```

   This uses the existing integer power-series carrier and does not replace the Euler product with a bounded or weakened substitute. The suggested signature was checked against source definitions, not elaborated.

6. **F06** (P3) Statable discriminating Checks lack Lean mirrors

   **Location:** `packages/FunctionFieldArithmetic/README.md:719`, `:1494`, `:1628`; `packages/FunctionFieldArithmetic/Suggested.lean:67`, `:142`, `:216`.

   **Claim:** The Checks test Witt carries, degree-weighted extension counts and the genus-zero boundary on the roadmap's own definitions.

   **Witness:** The examples never compute a Witt carry, distinguish a nontrivial `aswQuotient`, or check degree-two weighting. `IsLPolynomialData` has no genus-zero example.

   **Exact repair text:** Replace the unit-Witt example with a proved characteristic-two carry Check: for `F=𝔽₂(t)`, `a=t`, the second coordinate of `artinSchreierWitt 2 F [a]` is `a²+a³ ≠ 0`. Add a second `pointCount` example proving `pointCount k F 2 = placeCount k F 1 + 2 * placeCount k F 2`. Extend the positive polynomial example to prove both the genus-zero Check `IsLPolynomialData q 0 N 1` and the existing genus-one assertion; keep the incorrect-count rejection as the second example. For `aswQuotient`, extend the length-zero example with the coboundary-zero assertion at every length, and add a second proved example showing that the class of `1` in `aswQuotient p (ZMod p) 1` is nonzero. State these same concrete tests in the README, preserving the two-example maximum per definition.

7. **F07** (P3) The Lean file ends with a prohibited catalogue

   **Location:** `packages/FunctionFieldArithmetic/Suggested.lean:233`. “Statements not typed at the pins”.

   **Claim:** Lines 239–276 catalogue approximately one hundred README-only names as Lean-file content.

   **Witness:** These are neither declarations nor layer signatures or proved Checks; the binding Suggested.lean format explicitly excludes catalogues of names. The Euler-product classification is additionally false (R05).

   **Exact repair text:** Delete lines 233–277. Keep each unformalized target and its intended signature in its README section, and retain only actual declarations and layer comments in Suggested.lean.

8. **F08** (P1) Witt-vector Hilbert 90 is an unowned prerequisite

   **Location:** `packages/FunctionFieldArithmetic/README.md:703`. “Additive Hilbert 90 for Witt vectors over a cyclic extension”.

   **Claim:** The cyclic-extension classification may use this exact sequence as an input, although the Needs list supplies only Witt operations and the Galois correspondence.

   **Witness:** `kw line 276` states the separate Proposition 3.1. No Witt trace or Hilbert-90 declaration occurs in the pinned Mathlib Witt-vector directory, and no named supplier or local target is assigned this result.

   **Exact repair text:** Insert before `artinSchreierWitt_galois`: “`wittVector_additiveHilbert90`: for a finite cyclic Galois extension `L/F` of characteristic `p`, a chosen generator `σ`, and every `n ≥ 0`, the additive sequence `0 → W_n(L)/W_n(F) → W_n(L) → W_n(F) → 0`, with maps `1−σ` and `Σ_{τ∈Gal(L/F)} τ`, is exact. Construct the trace on Witt vectors and prove its truncation compatibility. Source: Kosters–Wan, Proposition 3.1, p. 6. Checks: `n=0`; the identity extension; the length-one vectors of a degree-`p` Artin–Schreier extension, where the trace is surjective although the trace of `1` is zero.” Add this target to the classification's Needs.

9. **F09** (P1) Global reduction theory is used without a target or exact supplier

   **Location:** `packages/FunctionFieldArithmetic/README.md:1990`. “Reduction theory gives `G(𝔸) = G(K)·P₀(c₁)·Σ·U`”.

   **Claim:** The proof of the uniform support theorem consumes adelic Siegel-set coverage, a compactness criterion modulo the centre, and finite-volume reduction theory for all connected reductive groups.

   **Witness:** The only external Needs at line 2005 is RG2.4, identified at lines 120–121 as Iwasawa and Cartan decomposition. None of the package's earlier targets states global Siegel-set coverage or its compactness criterion.

   **Exact repair text:** Insert before `cuspFunctions_compactSupport`: “`functionFieldReduction`: for every connected reductive group over a global function field and every compact open level, construct finitely many rational-parabolic Siegel sets covering the adelic quotient; prove compactness of their bounded root regions modulo the adelic centre and finite volume modulo the split central directions. Include the anisotropic case, non-split groups and all characteristics. Sources: Morris I §§4.1–4.3; Harder §§1.1–1.2 for the split specialization.” Give its precise root inequalities, data and theorem signatures, and make §§6.4 and 7.2 depend on it. If an earlier roadmap actually supplies these statements, replace this target by its exact current section and target names instead of RG2.4's decomposition-only description.

10. **F10** (P1) The unitary continuation proof assumes its missing general theory

   **Location:** `packages/FunctionFieldArithmetic/README.md:2220`. “the general spectral decomposition”; “rationality … and its extension to residual data”.

   **Claim:** The rationality theorem for the unitary Siegel series follows from spectral decomposition and Eisenstein continuation for discrete Levi data.

   **Witness:** Lines 108–111 explicitly say the supplied AutomorphicSpectralTheory branch is everywhere-unramified `GLₙ` and does not supply unitary Eisenstein theory. Section 7.2 gives no named target for the general results its proof invokes.

   **Exact repair text:** Before `siegelEisenstein_rational`, add named README targets for the discrete/residual decomposition for the Levi groups of `H_n`, rational continuation of Eisenstein series from cuspidal Levi data, and its extension to residual discrete data; state the unitary central-character, level and spectral-parameter hypotheses, intertwining maps and pole domains. Cite Morris I pp. 134, 160–168 and Morris II §5.5 and §§6.5–6.6. Make `leviDetCharacter_discrete` and `siegelEisenstein_rational` depend on these targets. Develop the theory for all parabolics and discrete inducing data in this unitary setting, with the spherical Siegel datum as its application.

11. **F11** (P3) The Schmid–Witt uniqueness proposition has the wrong pages

   **Location:** `packages/FunctionFieldArithmetic/README.md:963`, `:1060`. “Proposition 4.4, pp. 16–17”.

   **Claim:** The uniqueness proposition and its proof are on pages 16–17 of the cited arXiv version.

   **Witness:** `kw line 739` starts Proposition 4.4 on printed page 15; the page-16 marker is `kw line 744`, and the proof ends at `kw line 755`. Page 17 concerns a different construction.

   **Exact repair text:** Replace both occurrences of “Proposition 4.4, pp. 16–17” by “Proposition 4.4 and proof, pp. 15–16”.

12. **F12** (P3) The required source manifest is absent

   **Location:** `packages/FunctionFieldArithmetic/README.md:2529` (references); missing `packages/FunctionFieldArithmetic/sources.toml`.

   **Claim:** The package cites 28 works, including works mentioned only in proof sketches, without recording their versions, retrieval provenance or certification status in the required manifest.

   **Witness:** The package file inventory contains README.md, Suggested.lean, metadata.toml and review.json; no sources.toml is present. SGA 3 and Borel–Tits are additionally cited at README lines 1955–1956 outside the reference list.

   **Exact repair text:** Add `sources.toml` with schema `tauceti-roadmap-sources/v1` and one entry for each of the 28 works. Record authors, title, year, locator scheme, exact locators and consuming sections; retain the source service's legal provenance, hash, licence class and status. Record unavailable paywalled texts as `uncertified`; resolve the outstanding missing-source entries before certifying those locators. Include SGA 3 and Borel–Tits. Do not insert local cache paths or extracted source passages.

13. **F13** (P3) The induction-normalization Check compares equivalent constructions as different

   **Location:** `packages/FunctionFieldArithmetic/README.md:2239`. “the two conventions give different series at the same `s`”.

   **Claim:** Normalized induction with exponent `s` differs from the displayed unnormalized induction with exponent `s+n/2`.

   **Witness:** For split `n=1`, trivial `χ`, and `α=(π,1)`, both spherical sections take the value `q^(−s−1/2)` at `m(α)`: normalized induction multiplies its inducing character by `δ_P^(1/2)`.

   **Exact repair text:** Replace that Check by: “Normalized induction of `χ|det|^s` and unnormalized induction of `χ|det|^(s+n/2)` give the same spherical section and Eisenstein series. In split rank one, both sections have value `q^(−s−1/2)` at `m(π,1)`. Keeping the character `χ|det|^(s+n/2)` while switching to normalized induction instead shifts the series parameter to `s+n/2`.”

14. **F14** (P2) The blanket odd-characteristic restriction narrows the local-density library

   **Location:** `packages/FunctionFieldArithmetic/README.md:2143`, `:2314`. “Here `p ≠ 2`”.

   **Claim:** The new split-density construction and uniform Hermitian density statements in §7.4 inherit this restriction from the global Eisenstein layer.

   **Witness:** The split proof counts linear maps over `𝔽_q`, valid also for `q=2`. `li_zhang line 709` explicitly retains the unramified Hermitian smoothness argument at residue characteristic two. No division by two occurs in the displayed density formula.

   **Exact repair text:** Give §7.4 its own local setting: “Let `K` be any nonarchimedean local field and `E/K` an unramified quadratic étale algebra, including the split algebra. There is no residue-characteristic restriction.” Retain the earlier owner's inert-density targets wherever its hypotheses cover them; own the additional cases not supplied there. Prove the split count and uniform identities in this generality. Add the residue-field-`𝔽₂` Checks `Den(T,(O,πO))=1+T`, inert rank-one `Den(T,L)=1−T`, and rank-zero density `1`. Apply this general local library to the odd-characteristic global setting only at §7.5.

15. **F15** (P1) The unramified inducing-character existence theorem is false

   **Location:** `packages/FunctionFieldArithmetic/README.md:2155`, `:2166`. “for every `n ≥ 0` there is a character … unramified at every place”.

   **Claim:** Every étale quadratic cover admits an everywhere-unramified character restricting to `η^n`, including odd `n`; geometric cup-product alternation proves this.

   **Witness:** On `E/𝔽₃: y²=x³+2x²+2x`, take `ν(x,y)=(x+2+2/x,y(1−2/x²))`, `P=(0,0)`. Then `ν*(P−O)=div(y/x)`, but `η(P−O)=−1`: `O` splits and `P` is inert.

   **Exact repair text:** Replace the existence theorem by: “An everywhere-unramified character extending `η^n` exists if and only if `η^n` is trivial on `ker(ν*:Pic(X)→Pic(X′))`. For even `n` the trivial character works. For odd `n` this condition can fail, as on the specified étale elliptic double cover over `𝔽₃`.” State this obstruction and its arithmetic reciprocity evaluation as named targets. Delete the deduction from geometric cup-product alternation: it does not compute the required arithmetic pairing. Mark FYZ Remark 2.1 as a source error. Keep the general cover setting by constructing continuous inducing characters with possible finite ramification, their corresponding nonspherical local sections, and the ramified local Fourier factors. State the spherical formulas in §§7.2–7.6 conditional on a chosen everywhere-unramified inducing character, and add the general ramified coefficient targets instead of excluding the obstructed covers. Use the displayed elliptic cover as a negative-control Check.

16. **F16** (P1) Descent of the underlying open cover does not detect a modulus multiplicity

   **Location:** `packages/FunctionFieldArithmetic/README.md:1385`. “equivalent to … descent of the cover, including extension across points whose exponent becomes zero”.

   **Claim:** Descent of a finite étale cover to the open curve for `m′≤m` is equivalent to its character factoring through the smaller ray group.

   **Witness:** For `m=2[∞]`, `m′=[∞]` on `ℙ¹`, both opens are `𝔸¹`. The cover `y^p−y=t` already descends to that open, but its conductor is `2[∞]`, so its character does not factor through `C_m′`.

   **Exact repair text:** Replace the equivalence by: “`rayLangCover_modulusFactor`: factorization through `C_m′` is equivalent to the conductor dividing `m′`, and to being obtained from the finite-ray construction for `m′` with its specified ramification bound. Extension of the underlying finite étale cover to `X−supp(m′)` detects only whether ramification disappears at removed support points; it does not detect a decrease between two positive exponents.” Add the `2[∞]→[∞]` Artin–Schreier cover as a negative-control Check.

17. **F17** (P3) The central-character Check quantifies over an impossible character

   **Location:** `packages/FunctionFieldArithmetic/README.md:1927`. “`χ` is nontrivial on some element of `Z(K)`”.

   **Claim:** The Check tests the module defined in §6.2 with an incompatible central character.

   **Witness:** Line 1904 defines `χ` on `Z(K)∖Z(𝔸)`. Its pullback to `Z(𝔸)` is automatically trivial on every element of `Z(K)`, so the proposed test case cannot exist in that definition.

   **Exact repair text:** Replace the Check by: “For `G=GL₁`, `K=𝔽_q(t)`, maximal integral level and `Ξ` generated by a degree-two idele, the quotient is `ℤ/2`. With the admissible character `χ(d)=(−1)^d`, equivariant functions have values `(a,−a)`. Over `ℚ`, no nonzero constant function is equivariant; over `ℤ/4`, the nonzero constant function `(2,2)` is equivariant.” If the rational-stabilizer obstruction is retained elsewhere, explicitly define it for an arbitrary character on `Z(𝔸)` before imposing descent to `Z(K)∖Z(𝔸)`.

18. **F18** (P1) The perfect-complex determinant is attributed to a trace-only supplier contract

   **Location:** `packages/FunctionFieldArithmetic/README.md:1673`. “perfect-complex trace and determinant algebra”.

   **Claim:** EtaleCohomologyFoundations F.10.3 supplies the determinant on a perfect derived complex needed by the finite-ring Euler-product identity.

   **Witness:** `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:1295` supplies perfect-complex traces; `:1328` supplies finite-projective determinants. The complex determinant owner is `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:3235`, with `detLine_quasiIso`, `detLine_shortExact` and `detLine_baseChange`.

   **Exact repair text:** Add PadicMeasuresIwasawaAlgebras §5.1's `detLine`, `detLine_quasiIso`, `detLine_shortExact`, `detLine_baseChange` and `detLine_acyclic` to the supplier contract and §5.7 Needs. Define the remaining named bridge `PerfectComplex.characteristicSeries`: for a perfect complex `C` over a commutative ring `A` and a derived endomorphism `u`, take the scalar action of `1−Tu` on `detLine(C⊗_A^L A[[T]])`. Prove representative/lift independence, base change, shift inversion, and the alternating product formula when cohomology is finite projective. Use this bridge in `lFunction_cohomological`. Retain F.10.3 as the supplier of traces and finite-projective determinant comparisons; do not attribute the derived determinant to it.

## Verified sound

Read all 2,597 README lines and all 279 Lean lines, plus the repository README and CONTRIBUTING rules. The declaration inventory has **24 rows: 16 named declarations (7 real-bodied definitions/abbreviations, 9 theorems) and 8 proved examples**. All effective variable and instance contexts were inspected from source. No false named Lean statement, lost essential hypothesis, admitted data, conclusion-as-hypothesis, or forced headline was identified. This is a mathematical/source audit, not an elaboration result.

The README inventory covers **45 numbered target sections**, with **237 distinct inventoried names, definitions and conventions**, and **111 bold spans**. Only one of those bold spans is itself a named mathematical target (“Constant-field reciprocity”); the others are labels, conventions, references or worked-example titles. **170 Check bullets** and the four worked examples were reviewed. Boundary computations include an independent finite-field enumeration giving 4 and 16 points for the Artin–Schreier curve over F₃ and F₉. The source-corrected upper-ramification clamp, Yu degree sign, rational-versus-adelic Fourier index, split half-length exponent and perfect-complex determinant distinction withstand the tested cases. Defective Checks are R03, R06, R13 and R17; the additional characteristic-two coverage issue is R14.

**Supplier coverage:** seven supplied open sibling heads were searched by mathematical object (zero direct citations to those seven occur in this package); eight available main/completed supplier roadmaps were checked: AlgebraicCurves, ClassFieldTheory, LocalFieldsRamification, SchemeAndStackFoundations, JacobianChallenge, ModularCurves, EtaleCohomologyFoundations and PadicMeasuresIwasawaAlgebras. The present ClassFieldTheory scope explicitly leaves Lubin–Tate and equal-characteristic p-primary existence to an extension (`TauCetiRoadmap/ClassFieldTheory/README.md:234`). QWittVectors' current head assigns classical p-typical operations to the pins and builds the distinct big/q-Witt objects (`TauCetiRoadmap/QWittVectors/README.md:11`); no duplicated Artin–Schreier–Witt classification was found there. Eleven other claimed suppliers could not be checked, as listed below.

The manifest pins inspected were Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The existing divisor, degree, genus, class-number and Witt-vector carriers support the retained Lean declarations. The single Mathlib import and the one existing Tau Ceti module import satisfy the import rule. There is no `set_option`, `lemma`, admitted example, or `True` placeholder. The recorded PR diff has four changed files, all inside `packages/FunctionFieldArithmetic/` (README.md, Suggested.lean, metadata.toml, review.json); no out-of-folder edit was found.

The required dependency command returned exit status 1 and exactly:

```text
NOT IN ORDER: FunctionFieldArithmetic (insert it after its last supplier)
depcheck: 8 roadmaps, 60 edges, 1 problem(s)
```

There was no `UPWARD` or `CYCLE` line. The absent-order warning is not raised as a finding. This mechanical output does not certify the manually found internal cycle or the claimed reverse supplies in R04.

The following **67 theorem/section locators across 21 works** were checked against legally fetched text: 66 were located at the cited positions or within the cited section ranges; one pagination error is R11. This count does not certify hypotheses beyond those stated by the source; FYZ Remark 2.1 itself contains the false claim isolated in R15. In particular, BHKT's Proposition 8.2 assumes a split semisimple group and a Noetherian coefficient ring embedding in C; the general coefficient result needs the package's own reduction argument. Source passages are not reproduced here.

| Source id | Count | Locators checked | Text witnesses / qualification |
|---|---:|---|---|
| kw | 8 | Proposition 3.1; Theorems 3.2, 3.4; Propositions 4.3, 4.4; Theorems 4.7, 4.12; Proposition 4.14 | kw line 276; line 280; line 362; line 722; line 739; line 886; line 1074; line 1184. Proposition 4.4 pagination needs R11; source's filtration misprint is corrected in the README. |
| yu | 1 | Lemma 5.3.3 | yu line 1934; degree convention at yu line 366. The nonzero condition and determinant-degree correction are retained. |
| kosters | 2 | Theorem 1.1; Corollary 1.2 | kosters line 66; line 81; proof restriction to rational places at line 172. The roadmap explicitly supplies the degree-extension argument. |
| yoshida | 7 | Lemma 3.4; Propositions 3.5, 4.4, 5.10; Theorem 5.15; Corollary 5.16; Theorem 6.15 | yoshida line 245; line 264; line 331; line 572; line 637; line 651; line 905. Geometric Frobenius is explicit at line 145. |
| parshin | 1 | §2.2, pp. 9–10 | parshin line 363; line 415. The roadmap avoids the source's incorrect assertion that an additive character of every finite field is injective. |
| milne | 4 | A.8, A.9, A.11, A.12 | milne line 5026; line 5048; line 5107; line 5152. Finite-field hypotheses are essential to the package's applications. |
| conrad_geom | 3 | §2; Theorems 3.1, 3.2 | conrad_geom line 80; line 140; line 157. The fixed-modulus universal property is separately proved in the roadmap. |
| guignard_published | 6 | §4.7; Proposition 4.8; Lemma 4.9; Propositions 4.11, 4.12, 4.14 | guignard_published line 737; line 747; line 751; line 794; line 803; line 830. Published pp. 1317–1321 and the affine-torsor argument at line 862 checked. |
| russell | 3 | §3.3; Theorems 3.24, 3.25 | russell line 1654; line 1669; line 1684. The section's algebraically closed setting requires the package's stated descent step. |
| conrad_adelic | 3 | Proposition 2.1; Example 2.3; Theorem 3.6 | conrad_adelic line 53; line 115; line 281. The package stays in the affine finite-type setting; the quasi-separatedness trap at line 312 is avoided. |
| bhkt | 2 | Propositions 8.1, 8.2 | bhkt line 1574; line 1593; narrower group hypotheses at line 1562. |
| ciubotaru_harris | 2 | Proposition 3.1; Lemma 3.2 | ciubotaru_harris line 390; line 406. Rational Hecke coefficients are the algebraicity input. |
| abdurrahman_venkatesh | 1 | §3.2, equations (3.1)–(3.2) | abdurrahman_venkatesh line 1178. Geometric Frobenius and inertia invariants retained. |
| stacks | 1 | Tag 03UZ / Theorem 64.20.1 | stacks line 1138. Finite flat coefficient sheaf and prime-to-characteristic coefficient order are retained. |
| fyz | 6 | §2.1; §2.2; Definition 2.2; Theorem 2.3; Lemma 2.7; Theorem 2.8 | fyz line 344; line 402; line 481; line 509; line 615; line 673. Read surrounding formulas; the unramified-character existence argument in Remark 2.1 is false (R15). |
| li_zhang | 1 | Theorem 3.5.1 | li_zhang line 688; residue-characteristic-two extension at line 709. |
| kudla_rapoport | 1 | Proposition 10.1 | kudla_rapoport line 1719. Its p-adic scope is explicitly distinguished from the function-field comparison in the README. |
| morris1 | 8 | §§4.1, 4.2, 4.3, 5.3, 5.4, 5.5, 5.6; Godement lemma p. 118 | morris1 line 421; line 431; line 438; line 529; line 534; line 548; line 599; line 1058. General reduction/support input checked; rational continuation also read at line 2525. |
| morris2 | 3 | §5.5 theorem; §§6.5–6.6 | morris2 line 1300; line 1980; line 2008. The p. 1164 rational-continuation lemma is present. |
| harder | 3 | Theorem 1.2.1; Lemma 1.2.2; Corollary 1.2.3 | harder line 234; line 239; line 288. Split-group support bound and right-quotient convention checked. |
| sga3 | 1 | Exposé XXVI, Proposition 2.1 | sga3 line 250. Smooth connected filtration terms, vector-group quotients and linear parabolic action checked. |

The adversarial statement table follows. Each row covers every API item listed in that section, its definitions, the associated Checks and the listed test instances; “no counterexample” does not certify unavailable sources or suppliers.

| Section | Lines | Statements / API / Checks | Instances | Result / change |
|---|---|---|---|---|
| 0.1 Degrees, idele degrees and Frobenius conventions | 268–306 | `constant-field reciprocity (bold target)`, `degree_conventions` | Uniformizer; principal idele; quadratic constant extension; scalar in GL₂ | Valuation degree and Yu degree have opposite signs; arithmetic constant-field action agrees. No mathematical change. |
| 0.2 Divisors of degree one | 307–337 | `exists_divisor_degree_eq_one`, `divisor_degree_surjective` | Rational field; degree-one divisor without rational point; nonexact constants | Degree-one divisors need exact finite constants, not a degree-one place. Both Lean binders retained. |
| 0.3 Divisor classes and Picard points over a finite field | 338–388 | `divisorClass_picardPoints` | Projective line; affine chart; pointless real conic | Finite-field Brauer obstruction vanishes; real counterexample is explicitly excluded. Supplier repair R02. |
| 1.1 The two-chart description of `L(D)` | 389–424 | `chartIdeals`, `riemannRochSpace_eq_inf_chartIdeals`, `chartIdeals_add`, `chartIdeals_add_poles`, `chartIdeals_principal` | D=0; D=2∞ on the rational field; principal shift | Inverse chart ideals give span(1,t,t²); sign of the infinity ideal is correct. |
| 1.2 Reduced bases and the invariants of a divisor | 425–474 | `reduced basis (definition)`, `exists_reducedBasis`, `riemannRoch_reducedBasis`, `reducedBasis_unique`, `reducedBasis_shift`, `reducedBasis_dim`, `reducedBasis_sum`, `reducedBasis_principal` | Rank 1; elliptic double cover; constant extension of degree 2 | Reduced degrees give the claimed dimensions; constants contribute dim L(0)=2 in the nonexact case. Hess text uncertified. |
| 1.3 Computing a basis with correctness and termination | 475–536 | `computeRiemannRochBasis`, `computeRiemannRochBasis_sound`, `computeRiemannRochBasis_complete`, `computeRiemannRochBasis_terminates`, `computeRiemannRochBasis_principal`, `computeRiemannRochBasis_cost` | Rational basis; inseparable extension; finite constant extension | No extra mathematical counterexample; algorithm deliverables removed by R01. Complexity source uncertified. |
| 2.1 Divisor lattices | 537–572 | `divisorLattice`, `divisorLattice_isCompactOpen`, `divisorLattice_inter_diagonal`, `divisorLattice_quotient`, `divisorLattice_mono`, `divisorLattice_add`, `divisorLattice_index` | D=0; −∞; −2∞ on the projective line | Intersection/cokernel dimensions 1/0, 0/0, 0/1; index q to degree difference is correct. |
| 2.2 The self-dual measure of a differential and its volumes | 573–607 | `selfDual_local_volume`, `selfDual_global_volumes`, `selfDual_change_differential`, `selfDual_annihilator_local`, `selfDual_integralVolume_ratio` | dt on the projective line; elliptic differential; multiplication by a rational function | Local volume at infinity q, global integral volume q^(1−g), quotient volume 1. Product formula preserves global normalization. |
| 2.3 Fourier transforms of lattice indicators | 608–663 | `fourier_indicator_divisorLattice`, `testFunctions_span_translates` | D=0; translated local ball; applying Fourier twice | Annihilator W−D and positive translation phase agree; two volume factors multiply to 1. Translates are necessary. |
| 3.1 The Artin–Schreier–Witt operator and cyclic `p`-power extensions | 664–725 | `artinSchreierWitt`, `aswQuotient`, `finite truncation / infinite quotient / solution field`, `artinSchreierWitt_galois`, `artinSchreierWitt_add`, `artinSchreierWitt_truncate`, `aswField_eq_iff`, `aswField_degree`, `aswQuotient_map`, `aswQuotient_restrict` | n=0,1,2; p=2; coboundary; primitive and p-divisible classes | Orders and field classification survive boundaries. Missing carry example R06; Hilbert-90 prerequisite R08. |
| 3.2 Reduced Witt–Laurent representatives | 726–772 | `reduced Witt–Laurent representative`, `aswReduced_exists_unique`, `aswReduced_class`, `aswReduced_unramified`, `aswReduced_primitive`, `aswReduced_changeUniformizer` | Constant class; pole T^(−p); zero ramified coefficients | Reduction of p-divisible poles, unramified constant character and trace-unit normalization agree. |
| 3.3 Comparing one-pole covers with Witt classes | 773–824 | `artinSchreier_onePole_comparison` | p=2,m=1; p=3,m=2 over F₃ and F₉; infinity localization | F₃ count 4; F₉ count 16 contradicts unqualified Check R03. Genus and local conductors agree. |
| 4.1 Lubin–Tate formal modules | 825–877 | `LubinTate.formalGroup`, `LubinTate.smul`, `torsion and field construction`, `lubinTate_torsion`, `LubinTate.formalGroup_isComm`, `LubinTate.smul_apply_linear`, `LubinTate.iso_of_series`, `LubinTate.torsion_equiv`, `LubinTate.field_degree`, `LubinTate.field_galois`, `LubinTate.norm_uniformizer`, `LubinTate.relative` | Residue F₂; torsion level 1 and 2; equal characteristic; relative unramified degree 2 | Degrees 1 and 2 at q=2; relative norm valuation subgroup 2Z. No false claim found. |
| 4.2 Local existence, local Kronecker–Weber and injectivity in equal characteristic | 878–921 | `localKroneckerWeber`, `localAbelianExistence_all`, `injective_artinMap_all`, `lubinTate_artin`, `conductor_existence_all` | Unramified norm subgroup; Lubin–Tate norm subgroup; wild AS conductor 2 | Arithmetic Artin acts by inverse unit on torsion; Yoshida explicitly uses geometric Frobenius. Source sign is correctly translated. |
| 4.3 The Schmid–Witt symbol | 922–978 | `schmidWitt`, `schmidWitt_perfect`, `schmidWitt_characterization`, `schmidWitt_formula`, `schmidWitt_normGroup` | Constant Witt class with uniformizer; T^(−1) with 1−aT; prime-to-p unit | Pairings are trace, −a, and zero; completed lift ring avoids invalid ordinary Laurent-series substitution. Page repair R11. |
| 4.4 Conductors of Artin–Schreier–Witt extensions | 979–1024 | `aswConductor_eq`, `aswUpperRamification`, `aswConductor_compositum`, `aswConductor_lengthOne` | Zero class; unramified class; one pole; r below the pole index; p=2 | Conductor 0 or 1+max(i p^(n−v(c_i)−1)); clamped upper filtration is necessary and correctly present. |
| 4.5 Finite ray characters and local-coordinate comparisons | 1025–1090 | `rayIdeleClassGroup`, `rayIdeleClassGroup_degree_exact`, `RayCharacterData`, `rayCharacterData_conductor`, `rayCharacterData_sound`, `rayCharacterData_conductor_minimal`, `rayCharacterData_unramified`, `rayCharacterData_constantValue`, `schmidWitt_localCoordinates`, `schmidWitt_changeParameter`, `localCoordinates_truncation` | Zero modulus; nontrivial constant character; truncation length 0; changed local parameter | Ray degree direction remains Z; finite quotient requires degree character choice. Dependency repair R04; locator R11. |
| 4.6 Rigidified Picard schemes | 1091–1160 | `rigidifiedPicardFunctor`, `generalizedPicard`, `generalizedJacobian`, `generalizedPicard_forgetModulus`, `generalizedPicard_representable`, `generalizedPicard_tensor`, `generalizedPicard_torsor`, `generalizedPicard_baseChange`, `generalizedJacobian_linearPart` | Zero modulus; rational point modulus; doubled point; pointless real conic | Ordinary Picard sheaf distinguished from actual line bundles; nonempty rigidification removes automorphisms. Dimensions and descent agree. R02 supplier repair. |
| 4.7 The ray Abel map and Rosenlicht's universal property | 1161–1227 | `rayAbel`, `HasRayModulus`, `rayAbel_baseChange`, `rayAbel_forgetModulus`, `rayAbel_affineBundle`, `rayAbel_rosenlicht`, `HasRayModulus.baseChange`, `HasRayModulus.comp`, `HasRayModulus.mono`, `rayAbel_rosenlicht_unique` | Modulus 0+∞; modulus 2∞ in characteristic 2; high-degree boundary | Multiplicative coordinate c and additive coordinate −b agree; fibre rank n−N−g+1 is nonnegative. No claim of affine-space fundamental-group invariance. |
| 4.8 Ray classes as rational rigidified line bundles | 1228–1269 | `rayPicard_comparison`, `rayPicard_localUnits` | Unit lambda=2 over F₅; degree-zero and degree-one classes; zero modulus | Rigidification is b⁻¹, hence local unit maps to 3 in the F₅ test. Correct inverse convention. R02 suppliers. |
| 4.9 Lang ray covers, Frobenius and geometric connectedness | 1270–1338 | `rayLangCover`, `rayLangCover_equation`, `rayLangCover_isTorsor`, `rayLangCover_trivialKernel`, `rayLangCover_forgetModulus`, `rayLangCover_frobenius`, `ideleClasses_away_dense`, `rayLangCover_artin`, `rayLangCover_geometricallyConnected` | Trivial kernel; Gm and Ga Lang covers; degree-two F₃ place; full degree-zero image | Arithmetic Frobenius class [v]−deg(v)a agrees; connectedness uses surjectivity on degree-zero classes. No constant-field shortcut. |
| 4.10 Finite ray characters, constant covers and least conductors | 1339–1449 | `finiteRayLangCover`, `finiteRayLangCover_map`, `finiteRayLangCover_generic`, `finiteRayLangCover_forgetModulus`, `finiteRayLangCover_choiceIndependent`, `finiteRayLangCover_classifies`, `finiteRayLangCover_connected`, `finiteRayLangCover_geometricallyConnected`, `finiteRayLangCover_normGroup`, `rayLangCover_conductor`, `RayCharacterData`, `rayLangCover_modulusFactor`, `rayLangCover_artin` | Trivial and nonsurjective characters; pure constant cover; 2[∞] to [∞] | Monodromy/conductor arithmetic is correct, but open-cover descent cannot detect multiplicities: R16. |
| 5.1 The zeta series, its Euler product and point counts | 1450–1498 | `effectiveDivisorCount`, `zeta`, `placeCount`, `pointCount`, `zeta_eulerProduct`, `zeta_logDeriv`, `pointCount_eq`, `effectiveDivisorCount_zero`, `zeta_coeff_zero`, `pointCount_ratFunc`, `zeta_constantCoeff`, `pointCount_constantExtension`, `placeCount_eq_mobius` | Rational field at q=2; r=0,1,2; degree-two place; A₀ | Positive-r theorem excludes junk value at 0; N₂ weights degree-two places by 2. Missing Euler headline R05 and example R06. |
| 5.2 Effective divisors in large degree | 1499–1526 | `effectiveDivisorCount_eq`, `effectiveDivisorCount_of_large` | g=0,n=0; g=1,n=0; n=2g−1 | First boundary valid; elliptic n=0 excluded; multiplicative identity avoids denominator and natural-subtraction errors. |
| 5.3 Rationality, functional equation and the class number | 1527–1557 | `zeta_rationality` | g=0; g=1 over F₅; reciprocal coefficient at j=0,g | P=1 in genus zero; leading coefficient q^g rather than 1; P(1)=h and linear coefficient sign agree. |
| 5.4 Comparison with the scheme zeta function and the Jacobian | 1558–1584 | `zeta_eq_schemeZeta` | Projective line; elliptic curve; arithmetic versus geometric Frobenius | Comparison uses reversed Frobenius characteristic polynomial; root bound is imported. Absent supplier heads limit certification. |
| 5.5 Constant field extensions | 1585–1607 | `lPolynomial_constantExtension`, `zeta_constantExtension` | r=1,2; degree-two place; elliptic extension F₅ to F₂₅ | Splitting multiplicity gcd(d,r) retained; example N₂=27 and L=1+T+25T² agree. |
| 5.6 Recovering the `L`-polynomial from `g` point counts | 1608–1633 | `IsLPolynomialData`, `lPolynomial_isLPolynomialData`, `IsLPolynomialData.unique` | g=0; q=0,1 in algebraic predicate; correct N₁=9 and incorrect N₁=8 | Uniqueness holds even at artificial q; no existence claimed there. Genus-zero example R06; remove computational dependency R01. |
| 5.7 `L`-functions of local systems with finite coefficients | 1634–1692 | `localEulerFactorFinite`, `localEulerFactorFinite_field`, `localEulerFactorFinite_unramified`, `localEulerFactorFinite_liftIndependent`, `localEulerFactorFinite_constantCoeff`, `lFunction_cohomological`, `lFunction_cohomological_projective` | Trivial local system; inertia invariants; zero module; coefficients F_ell and Z/4 | Correct perfectness/flatness hypotheses; the complex determinant supplier is misidentified: R18. |
| 5.8 Enumerating normalized places and verifying point counts | 1693–1731 | `enumeratePlaces_le`, `enumeratePlaces_sound`, `enumeratePlaces_complete`, `enumeratePlaces_nodup`, `pointCount_from_enumeration`, `IsLPolynomialData`, `enumeratePlaces_cost` | Rational-field degree-two places; nonnormal presentation; nonsplit residue extension | Normalization is mathematically appropriate; enumeration and cost targets violate policy R01. |
| 5.9 Computing finite ray quotients and their characters | 1732–1774 | `computeRayQuotient`, `computeRayCharacterData_sound`, `computeRayCharacterData_complete`, `computeRayQuotient_cost` | Zero modulus; trivial group; prime-to-p and p-primary factors | Arithmetic finite quotients are valid objects; explicit computation/cost deliverables violate R01. |
| 5.10 Quantitative Chebotarev in each degree | 1775–1850 | `frobeniusPlaceCount`, `frobeniusPlaceCount_constant_congruence`, `degree_sensitive_chebotarev` | Pure constant extension; incompatible degree; degree 1; nontrivial geometric kernel | Main term uses geometric kernel cardinality and the constant-field congruence. Smaller-degree and ramified-place errors are included. Reverse ownership edge R04. |
| 6.1 Adelic points of affine groups over a function field | 1851–1897 | `adelicPoints`, `adelicPoints_restrictedProduct`, `adelicPoints_diagonal_discrete`, `adelicPoints_finite_stabilizer`, `adelicPoints_map`, `adelicPoints_locallyCompact`, `adelicPoints_prod`, `adelicPoints_Gm`, `adelicPoints_Ga` | Trivial group; Ga; Gm; inverse coordinate; finite integral model | Affine point topology correctly includes the inverse coordinate for Gm; rational points discrete, compact stabilizers finite. No non-quasi-separated generalization. |
| 6.2 Automorphic function modules | 1898–1930 | `automorphicFunctions`, `gl1`, `eval`, `levelChange`, `heckeAction`, `baseChange` | Zero coefficient ring; Gm with and without degree quotient; change of level | Definitions retain the necessary quotient; central-character negative control is impossible in that carrier: R17. |
| 6.3 Constant terms and the cusp module | 1931–1979 | `constantTerm`, `cuspFunctions`, `constantTerm_linear`, `constantTerm_complex`, `constantTerm_refine`, `mem_cuspFunctions_iff`, `cuspFunctions_hecke`, `heckeAction`, `cuspFunctions_baseChange` | Trivial parabolic; zero function; nonabelian Heisenberg quotient; flat base change | Weighted orbit formula retains nonuniform stabilizers; p invertibility suffices. Base-change theorem precedes required finite support: R04. |
| 6.4 Compact support and finiteness of cusp forms | 1980–2016 | `cuspFunctions_compactSupport` | Gm; anisotropic group; fixed level; central character versus central quotient | Uniform support yields finite generation over Noetherian R. Infinite degree counterexample without Xi is correct. Missing reduction target R09. |
| 6.5 Integral coefficient models and algebraic Hecke eigenvalues | 2017–2045 | `cuspFunctions_integralModel`, `heckeEigenvalue_algebraic` | Field coefficients; Noetherian subring of C; nonflat extension excluded | Flatness through the fraction field supports integral models; rational Hecke operators yield algebraic eigenvalues. Cited sources treat narrower group cases; general extension needs R09. |
| 6.6 The global unramified Hecke action and the Satake normalization | 2046–2092 | `normalizedConstantTerm`, `heckeAction_unramified_cusp`, `cuspFunctions`, `normalizedConstantTerm_hecke`, `normalizedConstantTerm_one`, `normalizedConstantTerm_rightTranslate`, `normalizedConstantTerm_transitive`, `satake_gl1_reciprocity` | GL₁ degree character; GL₂ spherical double coset; P=G; zero function | Raw qX₁+X₂ and normalized sqrt(q)(X₁+X₂) yield q+1 on the correctly normalized constant term. Square roots explicitly required. |
| 6.7 Yu's degree-zero nonvanishing | 2093–2150 | `cuspForm_exists_degreeZero_ne_zero` | Zero form excluded; n=1; n=2; scalar translation; g=0 | Nonzero spherical cusp hypothesis present; determinant-degree correction agrees with Yu sign convention. No forced Lean headline. |
| 7.1 Unramified inducing characters | 2151–2188 | `exists_unramified_inducingCharacter` | n=0; split cover; constant quadratic cover; two choices of character | Universal existence is FALSE for the étale elliptic self-cover over F₃ (R15); geometric alternation does not compute the arithmetic obstruction. |
| 7.2 The unitary Siegel–Eisenstein series | 2189–2244 | `I_n`, `sphericalSection`, `siegelEisenstein`, `leviDetCharacter_discrete`, `siegelEisenstein_converges`, `siegelEisenstein_rational`, `section_one`, `section_parabolic`, `section_unipotent`, `siegelEisenstein_leftInvariant`, `section_degree` | n=0,1; normalized and unnormalized induction; nonunitary split character | Conditional on a valid χ (R15), matched induction conventions give the SAME section: R13. Missing general continuation: R10. |
| 7.3 Hermitian Fourier coefficients | 2245–2313 | `fourierCoefficient`, `localWhittaker`, `fourierExpansion`, `fourierCoefficient_rationalLevi`, `whittaker_levi`, `fourierCoefficient_factor` | n=1,T=0; nonsingular T; rational versus adelic Levi; g_X=0,1 | Singular coefficient excluded from factorization; rational index restriction avoids invalid global formula. Measure factor q^(−n²(g−1)) agrees. |
| 7.4 Split Hermitian local densities | 2314–2381 | `hermitianDensity`, `densityPolynomial`, `densityType`, `densityHalfLength`, `hermitianDensity_split`, `den_selfDual`, `den_depends_on_torsion`, `den_functionalEquation` | Rank 0,1; m<n; split overlattice of half-length 1/2; q=2 | Integral exponent 2*half-length correct; rank-one signs differ split/inert; denominators nonzero. Unnecessary blanket characteristic restriction R14. |
| 7.5 Local Whittaker functions and densities | 2382–2411 | `whittaker_eq_density` | s=0; interpolation at s=1; rank 0 | Lattice rank n+2j matches parameter q^(−2j); normalization agrees with density denominator. Heavy carriers correctly stay in README. |
| 7.6 The global coefficient formula of Feng–Yun–Zhang | 2412–2453 | `fyz_globalCoefficient` | Rank 0; split cover; constant quadratic cover; degree over original field | Formula and original-field degree agree conditional on a valid unramified χ; universal applicability fails by R15. |

The complete Lean context table follows. All line numbers in this table refer to `packages/FunctionFieldArithmetic/Suggested.lean`.

| Line | Declaration | Layer | Effective variables and instances | Instances / result |
|---|---|---|---|---|
| 35 | exists_divisor_degree_eq_one | 0.2 | k,F:Type*, Field k, Field F, Algebra k F, Finite k; explicit IsFunctionField k F and IsIntegrallyClosedIn k F | Rational field yes; pointless real conic excluded; nonexact finite constants excluded. Sound. |
| 41 | divisor_degree_surjective | 0.2 | Same as 35 | Integer multiples of degree-one divisor give every integer including zero and negative. Sound. |
| 56 | artinSchreierWitt | 3.1 | p:Nat, Fact p.Prime; F:Type*, Field F, CharP F p | Additive hom difference; characteristic two Witt carries retained. Sound. |
| 62 | aswQuotient | 3.1 | Same as 56, n:Nat | n=0 quotient top; n=1 ordinary AS; infinite Witt representative correctly quotiented by truncation kernel. Sound. |
| 67 | example (unit) | 3.1 | Same as 56 | Frobenius fixes 1. Correct but also holds for incorrect coordinatewise subtraction. |
| 72 | example (Teichmuller) | 3.1 | Same as 56, a:F | Correct Witt subtraction; a=0,1; general a. Does not compute a nonzero carry. |
| 80 | example (length zero) | 3.1 | Same as 56 | Truncation to empty index has full kernel. Sound; no positive-length negative control. |
| 98 | effectiveDivisorCount | 5.1 | k,F:Type*, Field k, Field F, Algebra k F; n:Nat | Nat.card of effective divisors of specified degree. Infinite-card junk outside the stated arithmetic setting is not used by a theorem. |
| 103 | zeta | 5.1 | Same as 98 without n | Integer power series with actual coefficients. No admitted data. |
| 107 | placeCount | 5.1 | Same as 98 with d:Nat | Degree zero excluded under hF; rational degree one q+1; degree two (q²-q)/2. |
| 111 | pointCount | 5.1 | Same as 98 with r:Nat | r=0 gives zero by Nat.divisors convention; r=1 placeCount 1; r=2 weighted sum. |
| 118 | effectiveDivisorCount_zero | 5.1 | k,F field algebra; explicit hF; NO Finite k or exactness needed | Degree positivity forces zero effective divisor over any base field. Sound at stated stronger generality. |
| 132 | example (zeta constant) | 5.1 | k,F field algebra; explicit hF | Sound by preceding proof. |
| 136 | example (zero-degree places) | 5.1 | k,F field algebra; explicit hF | Sound using one_le_degree_of_isFunctionField. |
| 142 | example (first count) | 5.1 | k,F field algebra only | Divisors of 1={1}; correct, but not a degree-two weighting test. |
| 147 | zeta_logDeriv | 5.1 | k,F field algebra, Finite k; explicit hF,hk,r,0<r | r=1 A1=N1; r=2 2A2=N1 A1+N2; subtraction indices range through 0..r-1. Sound. |
| 155 | pointCount_ratFunc | 5.1 | k:Type*, Field k, Finite k; r,0<r; F and Algebra k F disappear | q=2,r=1 gives 3; r=2 gives 5; zero r excluded. Sound. |
| 161 | effectiveDivisorCount_of_large | 5.2 | k,F field algebra, Finite k; explicit hF,hk,n,2g<=n+1 | g=0,n=0: (q-1)=h(q-1); g=1,n=0 excluded; n=2g-1 included. Natural subtraction legitimate. Sound. |
| 171 | zeta_rationality | 5.3 | k,F field algebra, Finite k; explicit hF,hk | g=0 P=1 including coeff1=0; g=1 leading q, P(1)=h; reciprocal indices restricted j<=g. Sound. |
| 194 | IsLPolynomialData | 5.6 | q,g:Nat; N:Nat->Int; P:Polynomial Int | g=0 P=1; q=0 or1 still uniqueness, no existence claimed; incorrect N1 rejected. Sound as algebraic predicate. |
| 202 | IsLPolynomialData.unique | 5.6 | q,g,N,P,Pprime and two predicate hypotheses | Integer Newton induction gives first g coefficients; reciprocal relation gives remainder; g=0 works. Sound, not a conclusion-containing hypothesis. |
| 208 | lPolynomial_isLPolynomialData | 5.6 | k,F field algebra, Finite k; explicit hF,hk,P and denominator identity | hP pins actual zeta numerator; Newton identities, degree and reciprocity follow. Not a vacuous arbitrary-polynomial assertion. |
| 216 | example (q=5,g=1,N1=9) | 5.6 | No context | Finite-field enumeration gives N1=9; predicate uses only N1, so constant function N does not claim all extension counts are nine. Sound. |
| 226 | example (wrong N1=8) | 5.6 | No context | r=1 demands 3=2. Sound negative control. |

## Not verifiable

- **Eleven supplier heads are unavailable in the provided active/completed tree and revision checkouts:** ArithmeticGaloisDuality (§R02.3.2), ArithmeticGaloisRepresentations (§§2.5, 3.7, 5.13), AutomorphicLFunctionsAndLocalFactors (AL.3), DeligneWeightsAndPurity (§§1.6, 1.9, 3.7), WeilConjectures (WC.1, WC.5), ReductiveGroupsPartII (RG2.0–RG2.4), SmoothRepresentationsOfLocalGroups (SR.4.1, SR.4.4), AdelicAlgebraicGroups (AA.0 and Layer 1), GeometryOfNumbersAndQuadraticArithmetic (§3.2), MetaplecticAutomorphicForms and AutomorphicSpectralTheory. Their exact names, hypotheses, ownership boundaries and reverse dependency edges cannot be certified from the package's descriptions. Their absence is not itself a finding or an undeclared supplier gap.
- **One unresolved legal text remains in `needs-references.toml` in the review scratch notes:** Roquette, *Class field theory in characteristic p, its origin and development*. The cited author host refuses connections; an alternative institutional URL returns 404; the source service found no PDF link on the Project Euclid DOI page. Its §4.3.3, equation (4) and §8.1 locators remain unchecked. All other failed source requests were subsequently resolved or classified `uncertified`.
- **Six works remain `uncertified`, as returned by the source service:** Rosen, Goss, Stichtenoth, Hess, SGA 4½ and Borel–Tits. Their paywalled contents were not accessed. They are not placed in the missing-reference request. In particular, Hess's manuscript pagination and complexity claims were not certified, and the Milne A.7 citation was not counted as an independently verified locator for the Picard–Brauer comparison.
- **No Lean elaboration or build was run**, as required by the read-only brief. Binder retention and existing-carrier claims were inspected from source; the proposed Euler-product signature still requires the repair worker's permitted elaboration check.
- **The mechanical dependency graph is incomplete:** it sees eight roadmaps and does not include this roadmap in ORDER.txt. Its lack of an UPWARD/CYCLE diagnostic cannot resolve the manually identified cycle or validate unavailable supplier contracts.
- **No readable design plan or prior repair report marking findings “not actionable in this package” was available.** No declared supplier gaps were assumed, and no settled finding was knowingly re-raised.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4ad50d07f8c73735e578f6b111ed384d9a5ab4f6", "job": "RT-FunctionFieldArithmetic~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->

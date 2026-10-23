Verdict: design
Name: BorelRegulators
Base: none
Owner: none

## Scope

Supply the general archimedean regulator lattice and primitive-period determinant theory for every number field and every higher weight n≥2. The new mathematical endpoints are Borel's zeta covolume, the primitive determinant theorem including rank zero, and the arithmetic quotient volume used in its proof. No polylogarithmic presentation, selected family of symbols, computational algorithm, chosen field or excluded finite prime defines this library.

Part of the filed target is already planned. Preserve the number-field regulator construction, its real isomorphism and the Borel–Beilinson normalization comparison in `packages/PeriodsAndSpecialValues/README.md`, §PS.3.2a, at board PR #169, head 9f14c68. Move that existing regulator block into this earlier supplier; the later section imports it. This is an ownership relocation, not a second design. The stable arithmetic comparison, rational localization and rank calculation already owned by `TauCetiRoadmap/ArithmeticKTheory/README.md`, §§3.3–3.4, remain there; both roadmaps import them. In particular, do not reproduce §PS.3.2a's independently planned rank proof here.

There is a second ownership boundary. `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md`, §6.2, already owns Tamagawa number one for all simply connected semisimple groups. Preserve that theorem. Relocate its classical norm-one, inner-type-A input to this earlier supplier, with its actual proof prerequisites; §6.2 imports this input when treating the general theorem. The new work here is the rational-gauge arithmetic quotient volume and its relation to primitive periods. No second general Tamagawa-number proof is to be designed.

The universal motivic Chern character, cycle-model comparisons and Deligne regulator for varieties belong to TARGET-MotivicEtaleKTheory (#834). Import that construction when identifying the number-field map with its universal realization. Own the point/embedding-space identification and Borel comparison preserved from §PS.3.2a, not another universal motivic regulator. Polylogarithms owns its explicit polylogarithmic comparison and factorial/Hurewicz calibration. PeriodsAndSpecialValues retains its fundamental lines, general special-value predicates and motivic applications. ArithmeticKTheory retains integral arithmetic K-groups and torsion structure.

This is a separate early supplier, rather than a Part II continuing the later fundamental-line or integral K-group programs. Its new direction is the arithmetic-group volume and primitive-period calculation. Importing either later roadmap wholesale would defeat its purpose and introduce a supply cycle.

## Final targets

Write Σ_F for all embeddings F→ℂ, N=[F:ℚ], Δ_F=|disc F|, and ℝ(k)=(2πi)^kℝ with integral line ℤ(k)=(2πi)^kℤ. Complex conjugation acts on embeddings and coefficients simultaneously. Put

V_n(F)=(∏_(σ∈Σ_F) ℝ(n−1))^conj,

with coordinate lattice (∏_Σ_F ℤ(n−1))^conj. Its dimension d_n is r₁+r₂ for odd n and r₂ for even n. Choosing real embeddings and one from each complex pair, with the parity restriction, and dividing each surviving coordinate by (2πi)^(n−1), identifies this lattice with ℤ^d_n. Determinants and covolumes below use this normalization. An empty determinant and the covolume of the zero lattice in the zero space are one.

1. **Preserved regulator and Deligne comparison.** For every number field F and n≥2, realize the renormalized Borel map on the actual Quillen group K_(2n−1)(O_F), with target V_n(F), by its stable primitive cohomology class. Extend it to K_(2n−1)(F)⊗ℚ through the supplied rational localization equivalence. Its real scalar extension is an isomorphism; the rational map is injective. Identify V_n(F) with H¹_D(Spec(F)×_ℚℝ,ℝ(n)), using C/ℝ(n)≃ℝ(n−1) at a complex point. With the suspended Chern-character normalization of the read source, r_Borel=2r_Beilinson, hence their ordered determinants differ by 2^d_n. Keep naturality under embeddings and the sum-over-embeddings trace for finite-extension transfers. These are the preserved §PS.3.2a targets, not new ownership of generic K-theory or the universal motivic regulator. Locators: burgos2002 line 3140, Corollary 9.8, p.78; burgos2002 line 3577, Definition 9.19, p.84; burgos2002 line 3681, Proposition 9.22 and Corollary 9.23, p.85; burgos2002 line 3973, Examples 10.4–10.5, p.91; burgos2002 line 4087, Definitions 10.7–10.8, p.94; burgos2002 line 4139, Theorem 10.9, pp.95–97.

2. **Integral lattice and zeta covolume.** For all F and n≥2, the image Λ_n of K_(2n−1)(O_F)/torsion in V_n(F) is discrete and spans V_n(F) over ℝ. Its positive covolume R_Bo(F,n), relative to the coordinate lattice above, satisfies

   R_Bo(F,n) ∈ ℚˣ · ζ_F^*(1−n)

   and equivalently

   R_Bo(F,n) ∈ ℚˣ · Δ_F^(1/2) π^(d_n−Nn) ζ_F(n).

   Here ζ_F^*(1−n)=lim_(s→1−n) ζ_F^cont(s)/(s−(1−n))^d_n is nonzero; at d_n=0 it is the value itself. The positive-integer value agrees with Mathlib's convergent Dedekind zeta function. The continuation and functional equation are imported. The original homotopy-lattice regulator R′_Bo in Burgos has instead R′_Bo∈π^(−d_n)ℚˣ·ζ_F^*(1−n); Remark 9.20 supplies the conversion, including its real-place powers of two. Do not identify those normalizations silently. The image of K(F)⊗ℚ is the rational span of Λ_n, not a discrete lattice. A determinant on any rational K-basis has the same nonzero rational proportionality. Locators: burgos2002 line 3222, Definition 9.10, p.79; burgos2002 line 3256, Theorem 9.12, p.80; burgos2002 line 3601 and burgos2002 line 3607, Definition 9.19/Remark 9.20, p.84; borel1977 line 571, Theorem 6.2, pp.631–632; borel1977 line 595, §6.4, pp.632–633.

3. **Primitive determinant, including the totally real even-weight theorem.** For every F and n≥2, let a be a stable matrix size satisfying a−1>4N(2n−1), let Γ be a torsion-free arithmetic subgroup of Res_(F/ℚ)SL_a, and let X_a^u be the compact dual of its real symmetric space. On the rational determinant lines of degree-(2n−1) indecomposable cohomology, the comparison induced by invariant forms sends the compact-dual rational line to

   c · (the arithmetic rational line),
   c ∈ ℚˣ · Δ_F^(1/2) π^(d_n−Nn) ζ_F(n).

   The determinant line is ∧^d_n of the indecomposable space; this statement concerns the actual comparison after real scalar extension, not a freely chosen isomorphism. It is compatible with stabilization and passage to commensurable arithmetic groups. In particular, for every totally real F and every even n≥2, d_n=0 and

   Δ_F^(1/2) π^(−nN) ζ_F(n) ∈ ℚˣ.

   This rank-zero conclusion must be proved by the primitive-period argument with its volume input; the real isomorphism between two zero vector spaces supplies no special-value information. Locators: borel1977 line 567, §6.1 and Theorem 6.2, pp.631–632; borel1977 line 581, equations (3)–(5), p.632; borel1977 line 590, Remark 6.3, p.632. The source's m is n−1 here.

4. **Arithmetic quotient volume and its Tamagawa input.** For every number field F, every a≥2, and every central division F-algebra D of dimension a² which is split at every archimedean place, put H=SL₁(D). For every arithmetic Γ⊂H(F), the archimedean quotient is compact and, with the measure m_∞ attached to a nonzero F-rational invariant top form in Borel §1.6, prove

   vol_m∞(H_∞/Γ) ∈ ℚ_>0 · ∏_(j=2)^a ζ_F(j).

   Retain the exact adelic identity τ(H)=vol_m∞(H_∞/Γ_U)·vol(U) for the arithmetic subgroup Γ_U attached to a sufficiently small compact open finite-adelic level U. Use the preserved norm-one Tamagawa theorem τ(H)=1 with its compatible local gauges, and retain the finitely many ramified local factors. Such D exist for every F and a≥2; no chosen division algebra or unramified-only statement replaces this theorem. Transport to other Haar conventions with their explicit discriminant/Jacobian factor. Locators: borel1977 line 153, §1.6, p.617; borel1977 line 177, Lemma 2.2, pp.617–618; borel1977 line 196 and borel1977 line 213, §§2.3–2.4, pp.618–619; borel1977 line 227, the invocation of weil1961 §3.3, Theorem 3.3.1; borel1977 line 523, §5.5, pp.629–630, for the resulting primitive-period integral.

Checks include F=ℚ in weights 2 and 3; an imaginary quadratic field in both parities; and a totally real field in every even weight. In particular the rational-field rank-zero formulas give ζ(2)/π²=1/6 and ζ(4)/π⁴=1/90, while a Tate-divided weight-three regulator determinant is a nonzero rational multiple of ζ(3)/π². Weight one uses the already owned Dirichlet regulator on O_Fˣ and its sum-zero hyperplane; the full group Fˣ has no corresponding finite-rank lattice theorem. Nonpositive weights are outside the cited higher-regulator theorem. Finite S-integer and order comparisons use the supplied localization/rank theorems, with all finite primes allowed.

## Suppliers

| Supplier | Existing ownership to import |
| --- | --- |
| Pinned Mathlib and Tau Ceti | `Mathlib/NumberTheory/NumberField/DedekindZeta.lean`, number-field embeddings/signature/discriminant APIs, `IsZLattice`, `ZLattice.covolume`, determinants and Haar integration. `TauCeti/NumberTheory/NumberField/DedekindZeta.lean` supplies continuation near one, not the global functional equation or Borel theorem. |
| GeneralAlgebraicKTheory | `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md`, §3.12 and Layers 4–7: native Quillen groups, plus/Q comparison, localization and transfer. |
| StableHomotopyKTheory | `TauCetiRoadmap/StableHomotopyKTheory/README.md`, §§3.37 and 4.14: rational H-space primitives and stable-linear-group plus spaces. Use the precise boundedness/finite-type hypotheses available there; the unrestricted complex-field comparison is a declared gap in Polylogarithms. |
| ArithmeticKTheory | `TauCetiRoadmap/ArithmeticKTheory/README.md`, §§3.2–3.4: finite generation, rational localization, stable arithmetic/relative-Lie comparison, primitive generators and Borel ranks. These remain upstream and independent of a regulator-value formula. |
| ArithmeticLocallySymmetricSpaces | `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md`, ALS.F.5, ALS.0.4–ALS.0.9 and ALS.5b.1: invariant forms, symmetric spaces, arithmetic quotients, finite stabilizers and de Rham comparison. |
| AutomorphicFormsOnReductiveGroups | `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md`, §§1.1–1.3: relative Lie cochains, continuous cohomology and van Est. |
| AdelicAlgebraicGroups | `TauCetiRoadmap/AdelicAlgebraicGroups/README.md`, §§1.4, 2.2–2.4, 3.4 and 4.2: scalar restriction, quotient measures, gauge/Tamagawa normalization, anisotropic compactness and strong approximation. Finiteness of a Tamagawa number does not supply its value. |
| ClassFieldTheory | `TauCetiRoadmap/ClassFieldTheory/README.md`, Layer 10: global Brauer invariants and their exact sequence, used in the general division-algebra existence input. |
| LFunctions | `TauCetiRoadmap/LFunctions/README.md`, Layer 3: global Dedekind continuation, completion, functional equation and agreement with the pinned convergent function. |
| NumberFieldArithmetic | `Completed/NumberFieldArithmetic/README.md`: the existing unit lattice, Dirichlet regulator and degree-one class-number formula. |
| Preserved existing work | `packages/PeriodsAndSpecialValues/README.md`, PS.3.2a, for regulator construction/comparison; `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md`, §6.2, for its classical norm-one Tamagawa input. These blocks must move earlier; neither late roadmap as a whole is an upstream supplier. |
| Pending universal realization | TARGET-MotivicEtaleKTheory (#834): the universal motivic Chern/Deligne regulator. It has no designed section yet; consumer references to Layer 4, §9.1 or §12.2 do not create sections. Its general construction must precede any comparison here that uses it and must not depend on Borel's arithmetic value theorem. |

Insert BorelRegulators after its last genuine supplier, including the relocated inputs and any universal-realization prefix it consumes, and before Polylogarithms. The currently listed suppliers through ArithmeticKTheory already precede Polylogarithms. Preserve the order BorelRegulators → Polylogarithms → PeriodsAndSpecialValues for the new contract. The two late ownership blocks require relocation during integration; the present triage edits no other package or merge-order entry.

## Consumers

- `TauCetiRoadmap/Polylogarithms/README.md`, its regulator supplier contract, §§2.3, 3.7–3.8, 4.4 and 4.7: rational regulator image, normalized determinant and the totally real empty determinant. Its references to BorelRegulators Layers 3–5 and §7.1 are requests, not existing section locators. It owns the conversion to L_n periods, including the π^(n−1) factor per row.
- `packages/PeriodsAndSpecialValues/README.md`, PS.3.2a and PS.9.8–PS.9.10: import the preserved arithmetic regulator results and their zeta determinant; retain the downstream fundamental-line and mixed Tate applications.
- `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md`, §6.2: import the relocated classical norm-one input without duplicating it. Its general group theorem and endoscopic applications stay there.
- `TauCetiRoadmap/HabiroNahmSeries/README.md`, §1.5: an indirect consumer through Polylogarithms of the embedding regulator and its rational image. Its symbols and torsion criteria remain downstream.

## Sources

Each work has one key in `packages/BorelRegulators/sources.toml`. No source text is stored in the package.

| Key | Work, access and read locators |
| --- | --- |
| borel1974 | Armand Borel, *Stable real cohomology of arithmetic groups*, 1974, Ann. Sci. ENS 7, pp.235–272. Numdam open repository. Theorem 7.5, p.259, borel1974 line 934; §11.4, borel1974 line 1246; Proposition 12.2, p.271, borel1974 line 1377. These support the existing stable/rank supplier, not a second plan. |
| borel1977 | Armand Borel, *Cohomologie de SL_n et valeurs de fonctions zêta aux points entiers*, 1977, Pisa 4, pp.613–636. Numdam open repository. Lemma 2.2/Proposition 2.4, pp.617–619, borel1977 line 177 and borel1977 line 213; §5.5, pp.629–630, borel1977 line 523; Theorem 6.2/Remark 6.3, pp.631–632, borel1977 line 571 and borel1977 line 590; §6.4, pp.632–633, borel1977 line 595. Formula-bearing pages were also checked visually against the fetched scan. |
| burgos2002 | José Ignacio Burgos Gil, *The Regulators of Beilinson and Borel*, CRM Monograph 15, 2002. Legal author copy at ICMAT; cite its printed numbering. Chapter 9, pp.75–88, and Chapter 10, pp.89–97; exact theorem and line locators appear in endpoints 1–2. In particular Theorem 9.12 is on printed p.80, not pp.72–74; Theorem 10.9 begins on p.95. |
| weil1961 | André Weil, notes by Michel Demazure and Takashi Ono, *Adeles and Algebraic Groups*, 1961, §3.3, Theorem 3.3.1, as invoked by borel1977 line 227. Settled as waived. Cite this locator; no text was supplied or newly requested. |
| beilinson1985 | A. A. Beilinson, *Higher regulators and values of L-functions*, J. Soviet Math. 30 (1985), pp.2036–2070, DOI 10.1007/BF02105861, §§1–2. Historical universal-regulator background, owned by the separate motivic target. The service resolved only a paywalled citation: settled as uncertified and cited by locator alone. The checked number-field comparison uses burgos2002, not an unread claim from this paper. |

## Risks

- The target is only partly new. Rebuilding PS.3.2a, ArithmeticKTheory's stable/rank theorem, or the general Tamagawa theorem would violate existing ownership. Leaving the regulator block late would force BorelRegulators to depend on a consumer. The same audit is required for the classical norm-one proof input relocated from §6.2: bring its real prerequisite closure earlier without importing endoscopic stabilization or creating a reverse edge. Failure to make these moves prevents an acyclic design.
- The pins have arithmetic, lattice and analysis infrastructure, not these higher K-group regulators, real Deligne realization or primitive-period theorem. The named foundational roadmaps are substantial prerequisites. The generic motivic realization is still a separate target, not an available declaration or a permission to use a placeholder carrier.
- A rank formula alone proves neither that the specified regulator is an isomorphism nor that its image is discrete. The lattice assertion must use the integral source, and the primitive determinant theorem must retain rank zero. An arbitrary invertible matrix cannot stand in for a Borel class.
- Coordinate, Chern-character, homotopy-lattice and Tate normalizations differ by factorials, powers of two and powers of π. Endpoint 2 records both regulator conventions. The polylogarithmic conversion stays downstream; using it to prove the regulator theorem would be circular.
- Weil is waived and Beilinson is uncertified; neither is an outstanding missing-reference request. Access certification of the other texts certifies legal reading, not a completed proof. Any further unavailable source needed during design must be recorded once, under its lifetime key.
- The later acceptance file must have one `import Mathlib`, only necessary simple definitions and headline theorems with `sorry`, no sorry'd data and no `set_option`. Foundations missing at the pins cannot be hidden in assumed regulator structures. This triage writes no Lean and specifies no detailed layer or API plan.
